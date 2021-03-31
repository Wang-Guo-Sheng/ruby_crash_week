from pygments import highlight
from pygments.lexers import RubyLexer
from pygments.formatters import HtmlFormatter

import os


def ruby2html(ruby_file):
    with open(ruby_file, encoding='utf-8') as rbf:
        code = rbf.readlines()
    html = highlight(''.join(code), RubyLexer(), HtmlFormatter())
    html_name = ''.join(ruby_file.split('.')[:-1]) + '.html'
    with open(html_name, 'w', encoding='utf-8') as hf:
        hf.writelines(html)


def convert_dir(directory, operation):
    for filename in os.listdir(directory):
        if filename.endswith(".rb"):
            fullpath = ''.join([directory, '\\', filename])
            operation(fullpath)
            continue
        else:
            continue


convert_dir('day1', ruby2html)
