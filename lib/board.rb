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
		@standard_ships = [4,3,3,2,2,2,1,1,1,1]
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

	def ship_size
		@standard_ships.pop.to_i
	end

	# def next_coordinate(x,y,hor_ver)
	# 	add_horizontal_ship(x,y)
	# end

	def add_ships
		@ships = 0
		until @ships == 10 do
			add_horizontal_ship(rand(9),rand(9),ship_size)
			@ships += 1
			add_vertical_ship(rand(9),rand(9),ship_size)
			@ships += 1
		end
		@ships
	end

	def add_horizontal_ship(x,y,size)
		i = 0
		x = 9 - size if x + size >= 9
		# if rows[y][x] != "s" # skip to next
			while i < size do
				rows[y][x] = "s"
				i += 1
				x += 1
			end
		# else
		# 	@ships -= 1
		# 	add_ships
		# end
	end

	def add_vertical_ship(x,y,size)
		i = 0
		y = 9 - size if y + size >= 9
		# if rows[y][x] != "s" # skip to next
			while i < size do
				rows[y][x] = "s"
				i += 1
				y += 1
			end
		# else
		# 	@ships -= 1
		# 	add_ships
		# end
	end

end