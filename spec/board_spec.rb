require_relative "../lib/board"
require_relative "../lib/player"

describe Board do
	let(:player) { double :player, {:name => "Khush"} }
	let(:board) { Board.new player}

	it "can set a player" do
		# player = double :player, {:name => "Khush"}
		expect(board.owner).to eq("Khush")
	end

	# it "should accept coordinates" do
	# 	expect(board.register_shot("G6")).to eq("[6][5]")
	# end

	# it "returns an empty board of 10 columns and 10 rows" do
	# 	expect(board.rows.count).to eq(10)
	# 	expect(board.rows[0].count).to eq(10)
	# end

	it "should return a hit when hitting opponent's ship" do
		board.stub(:rows) { [["","","s"],["s","","s"],["","","s"]] }
		board.register_shot("A3")
		expect(board.register_shot("A3")).to eq("x")
	end
end
