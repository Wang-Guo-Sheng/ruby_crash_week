File.open('output_open', 'w') do |f|
    f.write('Content.')
end

f = File.new('output_new', 'w')
f.write('Content.')
f.close
