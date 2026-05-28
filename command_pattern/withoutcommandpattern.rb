class TextEditor
    def bold_text
        puts "Text has been bold"
    end

    def italic_button
        puts "Text has been italic"
    end

    def underline_text
        puts "Underline the text"
    end
end

class BoldButton
    attr_reader :editor

    def initialize(editor)
        @editor = editor
    end

    def click
        @editor.bold_text
    end
end

class ItalicButton
    attr_reader :editor

    def initialize(editor)
        @editor = editor
    end

    def click
        @editor.italic_button
    end
end


editor = TextEditor.new
italic_button = ItalicButton.new(editor)
bold_button = BoldButton.new(editor)

italic_button.click
bold_button.click

