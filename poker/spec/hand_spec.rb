require 'hand'
require 'card'

describe Hand do
  let(:hand) { Hand.new }

  describe "#flush" do
    it "returns true if the hand is a flush" do
      hand.cards = [
          Card.new(1,:hearts),
          Card.new(2,:hearts),
          Card.new(3,:hearts),
          Card.new(4,:hearts),
          Card.new(5,:hearts)]
      expect(hand.flush).to eq(true)
    end

    it "returns false if the hand is not a flush" do
      hand.cards = [
          Card.new(1,:hearts),
          Card.new(2,:spades),
          Card.new(3,:hearts),
          Card.new(4,:hearts),
          Card.new(5,:hearts)]
      expect(hand.flush).to eq(false)
    end
  end

  describe "#straight" do
    it "returns true if the hand is a straight" do
      hand.cards = [
          Card.new(1,:hearts),
          Card.new(2,:hearts),
          Card.new(3,:hearts),
          Card.new(4,:hearts),
          Card.new(5,:hearts)]
      expect(hand.straight).to eq(true)
    end

    it "returns false if the hand is not a straight" do
      hand.cards = [
          Card.new(1,:hearts),
          Card.new(8,:spades),
          Card.new(3,:hearts),
          Card.new(4,:hearts),
          Card.new(5,:hearts)]
      expect(hand.straight).to eq(false)
    end
  end

  describe "#full_house" do
    it "returns true if the hand is a full house" do
      hand.cards = [
          Card.new(1,:hearts),
          Card.new(1,:hearts),
          Card.new(1,:hearts),
          Card.new(4,:hearts),
          Card.new(4,:hearts)]
      expect(hand.full_house).to eq(true)
    end

    it "returns false if the hand is not a full house" do
      hand.cards = [
          Card.new(1,:hearts),
          Card.new(8,:spades),
          Card.new(3,:hearts),
          Card.new(4,:hearts),
          Card.new(5,:hearts)]
      expect(hand.full_house).to eq(false)
    end
  end

  describe "#straight_flush" do
    it "returns true if the hand is a straight flush" do
      hand.cards = [
          Card.new(1,:hearts),
          Card.new(2,:hearts),
          Card.new(3,:hearts),
          Card.new(4,:hearts),
          Card.new(5,:hearts)]
      expect(hand.straight_flush).to eq(true)
    end

    it "returns false if the hand is not a straight flush" do
      hand.cards = [
          Card.new(1,:hearts),
          Card.new(8,:spades),
          Card.new(3,:hearts),
          Card.new(4,:hearts),
          Card.new(5,:hearts)]
      expect(hand.straight_flush).to eq(false)
    end
  end

  describe "#four_of_a_kind" do
    it "returns true if the hand is four of a kind" do
      hand.cards = [
          Card.new(1,:hearts),
          Card.new(1,:hearts),
          Card.new(1,:hearts),
          Card.new(1,:hearts),
          Card.new(5,:hearts)]
      expect(hand.four_of_a_kind).to eq(true)
    end

    it "returns false if the hand is not four of a kind" do
      hand.cards = [
          Card.new(1,:hearts),
          Card.new(8,:spades),
          Card.new(3,:hearts),
          Card.new(4,:hearts),
          Card.new(5,:hearts)]
      expect(hand.four_of_a_kind).to eq(false)
    end
  end

  describe "#three_of_a_kind" do
    it "returns true if the hand is three of a kind" do
      hand.cards = [
          Card.new(1,:hearts),
          Card.new(1,:hearts),
          Card.new(1,:hearts),
          Card.new(2,:hearts),
          Card.new(5,:hearts)]
      expect(hand.three_of_a_kind).to eq(true)
    end

    it "returns false if the hand is not three of a kind" do
      hand.cards = [
          Card.new(1,:hearts),
          Card.new(8,:spades),
          Card.new(3,:hearts),
          Card.new(4,:hearts),
          Card.new(5,:hearts)]
      expect(hand.three_of_a_kind).to eq(false)
    end
  end

  describe "#two_pair" do
    it "returns true if the hand is two pair" do
      hand.cards = [
          Card.new(1,:hearts),
          Card.new(1,:hearts),
          Card.new(2,:hearts),
          Card.new(2,:hearts),
          Card.new(5,:hearts)]
      expect(hand.two_pair).to eq(true)
    end

    it "returns false if the hand is not two pair" do
      hand.cards = [
          Card.new(1,:hearts),
          Card.new(8,:spades),
          Card.new(3,:hearts),
          Card.new(4,:hearts),
          Card.new(5,:hearts)]
      expect(hand.two_pair).to eq(false)
    end
  end

  describe "#pair" do
    it "returns true if the hand is a pair" do
      hand.cards = [
          Card.new(1,:hearts),
          Card.new(1,:hearts),
          Card.new(7,:hearts),
          Card.new(3,:hearts),
          Card.new(5,:hearts)]
      expect(hand.pair).to eq(true)
    end

    it "returns false if the hand is not a pair" do
      hand.cards = [
          Card.new(1,:hearts),
          Card.new(8,:spades),
          Card.new(3,:hearts),
          Card.new(4,:hearts),
          Card.new(5,:hearts)]
      expect(hand.pair).to eq(false)
    end
  end


end
