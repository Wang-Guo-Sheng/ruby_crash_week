class Roman
    def self.method_missing name, *args
        roman = name.to_s
        roman.gsub!("IV", "IIII")
        roman.gsub!("IX", "VIIII")
        roman.gsub!("XL", "XXXX")
        roman.gsub!("XC", "LXXXX")

        num = (roman.count("I") + 
            roman.count("V") * 5 +
            roman.count("X") * 10 +
            roman.count("L") * 50 +
            roman.count("C") * 100)

        if num == 0 then super(name, *args) else num end
    end
end

puts Roman.X
puts Roman.XC
puts Roman.XII
puts Roman.foo
