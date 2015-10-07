require 'card'

describe Card do

  let(:five_of_hearts) { Card.new(5, :hearts) }

  describe "#value" do
    it "returns the value of the card" do
      expect(five_of_hearts.value).to eq(5)
    end
  end

  describe "#suit" do
    it "returns the suit of the card" do
      expect(five_of_hearts.suit).to eq(:hearts)
    end
  end



end
