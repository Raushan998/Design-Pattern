require './board.rb'

class TicTacToeBoard < Board
  attr_reader :cells

  def initialize
    @cells = Array.new(3) { Array.new(3) }
  end
end
