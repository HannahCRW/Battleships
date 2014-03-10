require_relative "../lib/board"
require_relative "../lib/player"

describe Board do
	let(:player) { double :player, {:name => "Khush"} }
	let(:board) { Board.new player}
	it "can set a player" do
		# player = double :player, {:name => "Khush"}
		expect(board.owner).to eq("Khush")
	end

	it "should accept coordinates" do
		expect(board.register_shot("G6")).to eq("[6][5]")
	end
end