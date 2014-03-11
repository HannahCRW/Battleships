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
		@ships = 0
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
		size = @standard_ships.pop.to_i
		puts size
		size
	end

	# def next_coordinate(x,y,hor_ver)
	# 	add_horizontal_ship(x,y)
	# end

	def add_ships
		while @ships < 10 do
			add_horizontal_ship(rand(9),rand(9),ship_size) 
			add_vertical_ship(rand(9),rand(9),ship_size) if @ships < 10
		end
		p rows
		@ships
	end

	def add_horizontal_ship(x,y,size)
		return if !check_x_space(x,y,size)
		
		i = 0
		while i < size do
			# puts ">>>#{rows[y][x]}<<<" 
			rows[y][x] = "s"
			i += 1; x += 1
		end
		@ships += 1	
	end

	def add_vertical_ship(x,y,size)
		return if !check_y_space(x,y,size)

		i = 0
		while i < size do
			rows[y][x] = "s"
			i += 1; y += 1
		end
		@ships += 1		

		# i = 0
		# p check_y_space(x,y,size)
		# if check_y_space(x,y,size)
		# 	@ships += 1
		# 	while i < size do
		# 		rows[y][x] = "s"
		# 		i += 1; y += 1
		# 	end
		# end

	end

	def check_x_space(x,y,size)
		i = 0
		while i < size do
			if y >= rows.length || x >= rows[y].length || rows[y][x] != ""

				@standard_ships << size
				puts "not space pushing back on #{@standard_ships}"
				return false
			end 
			i += 1; x += 1
		end
		true
	end

	def check_y_space(x,y,size)
		i = 0
		while i < size do
			if y >= rows.length || rows[y][x] != "" 
				@standard_ships << size
				return false
			end 
			i += 1; y += 1
		end
		true
	end



end