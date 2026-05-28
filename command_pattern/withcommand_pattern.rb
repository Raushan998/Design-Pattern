module Command
    def execute
        raise "Not Implemented Error"
    end
end

class BoldCommand
    include Command
    attr_reader :editor

    def initialize(editor)
        @editor = editor
    end

    def execute
        @editor.bold_text
    end
end

class ChangeColor
    include Command
    attr_reader :editor
    def initialize(editor)
        @editor = editor
    end

    def execute
        @editor.change_color
    end
end

class TextEditor
    def bold_text
        puts "Text is bolded"
    end

    def change_color
        puts "Color has been changed"
    end
end


class Button
    def set_command(command)
        command.execute
    end
end



text_editor = TextEditor.new
bold_command = BoldCommand.new(text_editor)
change_color_command = ChangeColor.new(text_editor)

button = Button.new
button.set_command(bold_command)
button.set_command(change_color_command)
