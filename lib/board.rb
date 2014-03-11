COLUMNS = {
	"A" => 0,
	"B" => 1,
	"C" => 2,
	"D" => 3,
	"E" => 4,
	"F" => 5,
	"G" => 6,
	"H" => 7,
	"I" => 8,
	"J" => 9
}

class Board

	def initialize player
		@player = player
		@empty_board = Array.new(10) { Array.new(10, "") }
	end

	def owner
		@player.name
	end

	def change_to_x(x, y)
		self.rows[x][y] = "x"
	end

	def change_to_o(x, y)
		self.rows[x][y] = "o"
	end

	def register_shot at_coordinates
		x = COLUMNS[at_coordinates[0]]
		y = at_coordinates[1].to_i - 1
		rows[x][y] == "s" ? (change_to_x(x,y); "x") : (change_to_o(x,y); "o")
	end

	def rows # creates boards for both player and opponent	
		@empty_board
	end

	def opponent_view
		self.rows.map { |row| row.map { |element| element == "s" ? "" : element }}
	end

	def add_ship(y,x,size)
		while x < size do
			rows[y][x] = "s"
			x += 1
		end
	end

end