defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end
  
  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end

  test "get some cards of a deck" do
    deck = Cards.create_deck
    {cards, deck} = Cards.deal(deck, 5)
    assert length(cards) == 5
  end


end
