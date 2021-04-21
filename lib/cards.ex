defmodule Cards do

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

     for value <- values, suit <- suits do
        "#{value} of #{suit}"   
     end
    
  end

  def shuffle(deck), do: Enum.shuffle(deck)

  def contains?(deck, hand), do: Enum.member?(deck, hand)
  
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
