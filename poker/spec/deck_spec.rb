require 'deck'

describe Deck do
  let(:deck) { Deck.new }
  describe "#initialize" do


    it "initalizes a deck with 52 cards" do
      expect(deck.cards.length).to eq(52)
    end

    it "initalizes a shuffled deck" do
      other_deck = Deck.new
      expect(other_deck.cards).to_not eq(deck.cards)
    end

  end

  describe "#draw_card" do

    it "returns a card object" do
      expect(deck.draw_card.class).to be(Card)
    end

    it "reduces the number of cards in the deck by one" do
      deck.draw_card
      expect(deck.cards.length).to be(51)
    end

    it "raises an error when the deck is empty" do
      deck.cards = []
      expect do
        deck.draw_card
      end.to raise_error(PokerError)
    end


  end

end
