module ActsAsCsv
    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    module InstanceMethods
        def read
            @csv_contents = []
            file = File.new(self.class.to_s.downcase + '.txt')
            @headers = file.gets.chomp.split(',')

            file.each do |row|
                row_contents = row.chomp.split(',')
                @csv_contents << CsvRow.new(headers, row_contents)
            end
        end

        attr_accessor :headers, :csv_contents

        def initialize
            read
        end

        include Enumerable

        def each(&block)
            @csv_contents.each(&block)
        end
    end
end


class CsvRow
    attr_accessor :csvrow_contents

    def initialize(titles, values)
        @csvrow_contents =  Hash[titles.zip(values)]
    end

    def method_missing key_name, *args
        csvrow_contents[key_name.to_s] || super
    end
end


class RubyCsv
    include ActsAsCsv
    acts_as_csv
end


# h = ['one', 'two']
# r = ['lions', 'tigers']
# cr = CsvRow.new(h, r)
# puts cr.one

m = RubyCsv.new
m.each {|row| puts row.version}
