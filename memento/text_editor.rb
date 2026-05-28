require_relative 'history'
class TextEditor
    include History
    attr_reader :content

    def initialize
        @content = ""
        @history = []
    end

    def write(text)
        save
        @content += text
    end

    def read
        @content
    end
end