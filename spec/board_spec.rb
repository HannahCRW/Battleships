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

		before(:each) do 
			board.rows
		end

		it "should contain one horizontal ship of four" do
			s_count = 0
			board.add_horizontal_ship(0,0,4)
			board.rows.each{|row| s_count += row.count("s")}
			expect(s_count).to eq(4)
		end

		it "should contain one vertical ship of three" do
			s_count = 0
			board.add_vertical_ship(5,1,3)
			board.rows.each{|row| s_count += row.count("s")}
			expect(s_count).to eq(3)
		end

		it "should be able to plot ten ships on the board (within designated space)" do
			board.add_ships
			expect(board.add_ships).to eq(10)
		end

		it "should not overlap the ships" do
			s_count = 0
			board.add_ships
			board.rows.each{|row| s_count += row.count("s")}
			expect(s_count).to eq(20)
		end

	end
end
