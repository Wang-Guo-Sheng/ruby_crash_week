a = Array(1..16)

(0..3).each do |n|
    puts a[(4 * n..4 * n + 3)]
end

a.each_slice(4) {|s| puts s}
