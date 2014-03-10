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
	end

	def owner
		@player.name
	end

	def register_shot at_coordinates
		x = COLUMNS[at_coordinates[0]] #=> 6, which returns G eventually??
		# 6-5 for index
		y = at_coordinates[1].to_i - 1 #=> 5
		"[#{x}][#{y}]"
	end

	def rows
	end

	def opponent_view
	end
end