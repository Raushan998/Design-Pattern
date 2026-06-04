from abc import ABC, abstractmethod;
import copy;

class GameBoardAbstraction(ABC):
    @abstractmethod
    def clone(self):
        pass

class GamePiece:
    def __init__(self, color, position):
        self.__color:str = color
        self.__position: int = position

    @property
    def color(self):
        return self.__color
    
    @color.setter
    def color(self, color: str):
        self.__color = color

    
    @property
    def position(self):
        return self.__position
    
    @position.setter
    def position(self, position: str):
        self.__position = position
    
    def __str__(self):
        return f"{self.__color} {self.__position}"
    

class GameBoard(GameBoardAbstraction):
    def __init__(self):
        self.pieces: list['GamePiece'] = []

    def add_piece(self, piece: GamePiece):
        self.pieces.append(piece)

    def get_pieces(self) -> list['GamePiece']:
        return self.pieces
    
    def show_board_state(self):
        print("Current Board State")
    
    def clone(self):
        new_game_board = GameBoard()
        for piece in self.get_pieces():
            new_game_board.add_piece(copy.deepcopy(piece))
        return new_game_board

game_piece_1 = GamePiece("Red", 0)
game_piece_2 = GamePiece("Blue", 1)

game_board = GameBoard()
game_board.add_piece(game_piece_1)
game_board.add_piece(game_piece_2)

# for game_piece in game_board.get_pieces():
#     print (f"GameBoard: {game_piece.color} {game_piece.position}")
# game_board.show_board_state()
new_game_board = game_board.clone()



for game_piece in new_game_board.get_pieces():
    print (f"GameBoard: {game_piece.color} {game_piece.position}")