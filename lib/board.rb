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
		# "[6][5]"
	end

	def rows
	end

	def opponent_view
	end
end