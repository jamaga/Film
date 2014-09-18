require 'pry'

class Board

	def initialize(file)
		@board = []
		@board_hash = {} 
		File.open(file).each do |line|
			@board << line.split(' ')
		end
		@board
	end #This is the end of the initialize method

	def show
		@board
	end #This is the end of the show method

	def position(pos_string)
		col_num = pos_string[0].ord - 97
		row_num = pos_string[1].to_i - 1 
		@board[row_num][col_num]
	end

end #THIS IS THE END OF THE BOARD CLASSS

board = Board.new('simple_text.txt')
#print board.show
p board.position('b8')


class Tower

	def initialize(tower_pos)
		@tower_pos = tower_pos
	end

	def valid?(new_tower_pos)
		if(@tower_pos[0] != new_tower_pos[0] && @tower_pos[1] == new_tower_pos[1]) || (@tower_pos[0] == new_tower_pos[0] && @tower_pos[1] != new_tower_pos[1])
			return "LEGAL"
		else
			return "ILLEGAL"
		end
	end
end

test_tower = Tower.new([1, 2])
p test_tower.valid?([2, 5])


class Bishop
	def initialize(bishop_pos)
		@bishop_pos = bishop_pos
	end

	def valid?(new_bishop_pos)
		@bishop_pos[0] + 1 == new_bishop_pos[0] && @bishop_pos[1] + 1 == new_bishop_pos[1] 
		@bishop_pos[0] + 1 == new_bishop_pos[0] && @bishop_pos[1] + 1 == new_bishop_pos[1] 
	
	end
end

test_bishop = Bishop.new([8,2])
# p test_bishop.valid?([2,5])

class SimpleMoves

	def initialize(file)
		@moves = []
		File.open(file).each do |line|
			@moves << line.split(' ')
		end
	end

	def move_pairs
		@moves.each do |move|
			puts Tower.new(move[0]).valid?(move[1])
		end
	end
end


simple_moves = SimpleMoves.new('simple_moves.txt')
p simple_moves.move_pairs








