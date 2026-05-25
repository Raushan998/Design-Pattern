module TextFormatterStrategy
    def display
        raise "Not Implement Error"
    end
end

class HtmlTextFormatter
    def display
        puts "<HTML>Printing the HTML Text</HTML"
    end
end

class PlainTextFormatter
    def display
        puts "Printing the normal text."
    end
end

class FlexiTextFormatter
    attr_reader :text_formatter

    def initialize(text_formatter)
        @text_formatter = text_formatter
    end

    def display
        @text_formatter.display
    end
end

plain_text = PlainTextFormatter.new
html_text = HtmlTextFormatter.new
FlexiTextFormatter.new(plain_text).display
FlexiTextFormatter.new(html_text).display