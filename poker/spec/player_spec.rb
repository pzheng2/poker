require 'player'
require 'deck'
require 'hand'


describe Player do
  let(:deck) { Deck.new }
  let(:player) { Player.new("Roger", 800) }

  describe "#get_discard_choice" do
    it "returns an array of valid positions (0-4)" do
      expect(player.get_discard_choice.class).to be(Array)
      expect(player.get_discard_choice.all? { |num| num.between?(0,4) }).to eq(true)
    end
    it "returns only distinct choices" do
      expect(player.get_discard_choice.uniq == player.get_discard_choice).to eq(true)
    end

  end






  # describe "#draw_hand" do
  #   it "calls draw five times" do
  #     expect(deck).to receive(:draw_card).exactly(5).times
  #     player.draw_hand
  #   end
  # end



end
