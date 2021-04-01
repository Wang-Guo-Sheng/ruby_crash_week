from pygments import highlight
from pygments.lexers import RubyLexer
from pygments.formatters import HtmlFormatter

import os
import datetime
import random


def get_time_string():
    d = datetime.datetime.now()
    return d.strftime('%Y_%m_%d_%H_%M_')


def print_inlcude(dir_fname):
    result = dict()
    tstring = get_time_string() + hex(random.randrange(16**8))[2:]
    result['div'] = '<div id = "includedContent_' + tstring + '"></div>'

    with open("template.js") as jstemp:
        js_content = ''.join(jstemp.readlines())
    base = "https://raw.githubusercontent.com/Wang-Guo-Sheng/ruby_crash_week/main/"
    url = base + dir_fname.replace('\\', '/').replace('.rb', '.html')
    result['js'] = js_content.replace('TSTRING', tstring).replace('URL', url)

    return result


def ruby2html(ruby_file):
    with open(ruby_file, encoding='utf-8') as rbf:
        code = rbf.readlines()
    html = highlight(''.join(code), RubyLexer(), HtmlFormatter())
    html_name = ''.join(ruby_file.split('.')[:-1]) + '.html'
    with open(html_name, 'w', encoding='utf-8') as hf:
        hf.writelines(html)


def convert_dir(directory, operation):
    results = []
    for filename in os.listdir(directory):
        if filename.endswith(".rb"):
            dir_fname = ''.join([directory, '\\', filename])
            results.append(operation(dir_fname))
            continue
        else:
            continue
    return results


convert_dir('day2', ruby2html)
results = convert_dir('day2', print_inlcude)
print('\n'.join([res['div'] for res in results]))
print('\n'.join([res['js'] for res in results]))
