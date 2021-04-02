target = ARGV[0]
file_name = ARGV[1]
IO.foreach(file_name) do |line|
    puts line if /#{target}/ =~ line
end