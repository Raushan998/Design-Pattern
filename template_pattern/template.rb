module DataParser
    def parse
        open_file
        parse_data
        close_file
    end

    def open_file
        puts "Open the File"
    end

    def close_file
        puts "Close the File"
    end

    def parse_data
        raise NotImplementedError
    end
end

class JsonParser
    include DataParser

    def parse_data
        puts "Parsing the json data..."
    end
end

class CsvParser
    include DataParser

    def parse_data
        puts "Parsing the CSV data"
    end
end

csv_parser = CsvParser.new 
json_parser = JsonParser.new

csv_parser.parse_data
json_parser.parse_data