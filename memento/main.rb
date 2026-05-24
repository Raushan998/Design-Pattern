require_relative 'text_editor'

text = TextEditor.new
# text.write("Hello \n")
# text.write("World!!")

# text.save

# puts text.read

text.write("A")

text.write("B")

text.undo
puts text.read