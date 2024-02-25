def move(board, player, move)
end

def isComplete(board)
    if board.instance_of? TicTacToeBoard
        rowComplete = true
        for i in (0..2)
            firstCharacter = board.cells[i][j]
            for j in (0..2)
                if(board.cells[i][j] != firstCharacter)
                    rowComplete = false
                    break
                end
            end
        end
        
        if(rowComplete == true)
            GameResult.new
        end

        colComplete = true
        for i in (0..2)
            firstCharacter = board.cells[0][i]
            for j in range(1..3)
                if(board.cells[j][i] != firstCharacter)
                    colComplete = false
                    break
                end
            end
        end
        
        if(colComplete == true)
            GameResult.new
        end

        diagComplete = true
        for i in (0..2)
            firstCharacter = board.cells[0][0]
            if(board.cells[j][i] != firstCharacter)
                colComplete = false
                break
            end
        end
        
        if (diagComplete == true)
            GameResult.new
        end

        revDiagComplete = true
        for i in (0..2)
            firstCharacter = board.cells[0][2]
            if(board.cells[i][2-i] != firstCharacter){
                revDiagComplete = false
                break
            }
        end

        if(revDiagComplete == true)
            GameResult.new
        end
        
        filled_cells_count = 0
        for i in (0..2)
            for j in (0..2)
                unless board.cells[i][j].nil?
                    filled_cells_count++
                end
            end
        end

        if(filled_cells_count == 9)
            GameResult.new(true, "-")
        else
            GameResult.new(false, "-")
        end
    else
        GameResult.new(false, "-")
    end
end
