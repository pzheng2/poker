require 'hand'
require 'card'

describe Hand do
  let(:no_hand)               { Hand.new([Card.new(1,:hearts), Card.new(8,:spades), Card.new(3,:hearts), Card.new(4,:hearts), Card.new(5,:hearts)]) }
  let(:pair_hand)             { Hand.new([Card.new(1,:hearts), Card.new(1,:hearts), Card.new(6,:spades), Card.new(3,:hearts), Card.new(5,:hearts)]) }
  let(:flush_hand)            { Hand.new([Card.new(1,:hearts), Card.new(2,:hearts), Card.new(3,:hearts), Card.new(4,:hearts), Card.new(4,:hearts)]) }
  let(:straight_hand)         { Hand.new([Card.new(1,:hearts), Card.new(2,:spades), Card.new(3,:hearts), Card.new(4,:hearts), Card.new(5,:hearts)]) }
  let(:two_pair_hand)         { Hand.new([Card.new(1,:hearts), Card.new(1,:hearts), Card.new(2,:spades), Card.new(2,:hearts), Card.new(5,:hearts)]) }
  let(:full_house_hand)       { Hand.new([Card.new(1,:hearts), Card.new(1,:hearts), Card.new(1,:hearts), Card.new(4,:hearts), Card.new(4,:hearts)]) }
  let(:straight_flush_hand)   { Hand.new([Card.new(1,:hearts), Card.new(2,:hearts), Card.new(3,:hearts), Card.new(4,:hearts), Card.new(5,:hearts)]) }
  let(:four_of_a_kind_hand)   { Hand.new([Card.new(1,:hearts), Card.new(1,:hearts), Card.new(1,:spades), Card.new(1,:hearts), Card.new(5,:hearts)]) }
  let(:three_of_a_kind_hand)  { Hand.new([Card.new(1,:hearts), Card.new(1,:hearts), Card.new(1,:spades), Card.new(3,:hearts), Card.new(5,:hearts)]) }


  describe "#flush" do
    it "returns true if the hand is a flush" do
      expect(flush_hand.flush).to eq(true)
    end

    it "returns false if the hand is not a flush" do
      expect(no_hand.flush).to eq(false)
    end
  end

  describe "#straight" do
    it "returns true if the hand is a straight" do
      expect(straight_hand.straight).to eq(true)
    end

    it "returns false if the hand is not a straight" do
      expect(no_hand.straight).to eq(false)
    end
  end

  describe "#full_house" do
    it "returns true if the hand is a full house" do
      expect(full_house_hand.full_house).to eq(true)
    end

    it "returns false if the hand is not a full house" do
      expect(no_hand.full_house).to eq(false)
    end
  end

  describe "#straight_flush" do
    it "returns true if the hand is a straight flush" do
      expect(straight_flush_hand.straight_flush).to eq(true)
    end

    it "returns false if the hand is not a straight flush" do
      expect(no_hand.straight_flush).to eq(false)
    end
  end

  describe "#four_of_a_kind" do
    it "returns true if the hand is four of a kind" do
      expect(four_of_a_kind_hand.four_of_a_kind).to eq(true)
    end

    it "returns false if the hand is not four of a kind" do
      expect(no_hand.four_of_a_kind).to eq(false)
    end
  end

  describe "#three_of_a_kind" do
    it "returns true if the hand is three of a kind" do
      expect(three_of_a_kind_hand.three_of_a_kind).to eq(true)
    end

    it "returns false if the hand is not three of a kind" do
      expect(no_hand.three_of_a_kind).to eq(false)
    end
  end

  describe "#two_pair" do
    it "returns true if the hand is two pair" do
      expect(two_pair_hand.two_pair).to eq(true)
    end

    it "returns false if the hand is not two pair" do
      expect(no_hand.two_pair).to eq(false)
    end
  end

  describe "#pair" do
    it "returns true if the hand is a pair" do
      expect(pair_hand.pair).to eq(true)
    end

    it "returns false if the hand is not a pair" do
      expect(no_hand.pair).to eq(false)
    end
  end

  describe "#is_higher?" do
    it "returns true if the current hand beats the passed hand" do
      expect(pair_hand.is_higher?(no_hand)).to eq(true)
      expect(two_pair_hand.is_higher?(pair_hand)).to eq(true)
      expect(three_of_a_kind_hand.is_higher?(two_pair_hand)).to eq(true)
      expect(straight_hand.is_higher?(three_of_a_kind_hand)).to eq(true)
      expect(flush_hand.is_higher?(straight_hand)).to eq(true)
      expect(full_house_hand.is_higher?(flush_hand)).to eq(true)
      expect(four_of_a_kind_hand.is_higher?(full_house_hand)).to eq(true)
      expect(straight_flush_hand.is_higher?(four_of_a_kind_hand)).to eq(true)



    end
  end

end
