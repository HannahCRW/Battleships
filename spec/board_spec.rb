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

	it "returns an empty board of 10 columns and 10 rows" do
		expect(board.rows.count).to eq(10)
		expect(board.rows[0].count).to eq(10)
	end

	it "should return a hit when hitting opponent's ship" do
		board.stub(:rows) { [["","","s"],["s","","s"],["","","s"]] }
		board.register_shot("A3")
		expect(board.register_shot("A3")).to eq("x")
	end

	it "should return the opponent's board without ships" do
		board.stub(:rows) { [["","o","s"],["s","","x"],["o","","s"]] }
		expect(board.opponent_view).to eq([["","o",""],["","","x"],["o","",""]])
	end

	context 'Ships' do 

		it "should contain one ship of four" do
			board.rows
			board.add_ship(0,0,4)
			s_count = 0
			board.rows.each{|row| s_count += row.count("s")}
			expect(s_count).to eq(4)

		end

	end
end
