/# 
Conway's game of life:

1. Any live cell with fewer than two live neighbours dies, as if by underpopulation.
    underpopulation is when game_state < 2

2. Any live cell with two or three live neighbours lives on to the next generation.
    next_generation is when game_state = 2 or 3
    next_generation keeps state at 1

3. Any live cell with more than three live neighbours dies, as if by overpopulation.
    overpopulation is when game_state > 3

4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
    reproduction is when game_state = 3
    reproduction changes 0 to a 1



#/

require 'pry'


while true
    line1 = [1, 0, 1, 0, 0, 1]
    line2 = [0, 1, 0, 0, 1, 0]
    line3 = [0, 0, 1, 1, 0, 1]
    line4 = [1, 1, 0, 0, 0, 0]
    line5 = [1, 1, 0, 0, 1, 1]
    line6 = [1, 1, 0, 0, 1, 0]
    

    x = -1
    y = -1
    
    game_board = [
        line1,
        line2,
        line3,
        line4,
        line5,
        line6
    ]

    game_board.each do |line|
        p line
    end

    sleep(0.5)
    
    x_position = game_board[x][y]
    y_position = game_board[x][y]
    position = game_board[x][y]

    for x_position in game_board
        line_above = (game_board[x-1][y-1] + game_board[x-1][y] + game_board[x-1][y+1])
        same_line = (game_board[x][y-1] + game_board[x][y+1])
        line_below = (game_board[x+1][y-1] + game_board[x+1][y] + game_board[x+1][y+1])
        game_state = (line_above + same_line + line_below)
        
        # binding.pry
        for y_position in game_board
            if game_state == 2 || game_state == 3 and position == 1
                position = 1
                game_board[x][y] = position
            elsif game_state < 2 and position == 1
                position = 0
                game_board[x][y] = position
            elsif game_state > 3 and position == 1
                position = 0
                game_board[x][y] = position
            elsif game_state == 3 and position == 0
                position = 1
                game_board[x][y] = position
            else
                position = 0
                game_board[x][y] = position
            end
            y += 1
        end
        x += 1
        y = -1
    end
    
    x = -1
    
    game_board.each do |line|
        p line
    end
    sleep(0.5)
end