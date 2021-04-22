defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards
  """

  @doc """
  Returns a list of strings representing a deck of playing cards
  ## Examples
      iex> deck = Cards.create_deck
      iex> {hand, _deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

     for value <- values, suit <- suits do
        "#{value} of #{suit}"   
     end
    
  end

  def shuffle(deck), do: Enum.shuffle(deck)

  @doc """
  Determines wheter a doc contains a given card
  ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """
  def contains?(deck, hand), do: Enum.member?(deck, hand)
  
  @doc """
  Divides a deck into a hand and the remainder of the deck.
  The `hand_size` argument indicates how many cards should be in the hand.
  """
  def deal(deck, handle_size), do: Enum.split(deck, handle_size)
  
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)    
  end

  def load(filename) do
   case File.read(filename) do
    {:ok, binary}  -> :erlang.binary_to_term(binary) 
    {:error, _reason} -> "That file does not exist"   
   end
  end

  def create_hand(handle_size) do
    create_deck()
    |> shuffle
    |> deal(handle_size)
  end

end
