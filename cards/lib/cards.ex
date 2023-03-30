defmodule Cards do

  # moddule Documentation
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

#funtion documentation this deals with a specific function and what it does
@doc"""
 Returns a list of strings representing a deckof playing cards


"""
def create_deck do
 values= ["Ace","two","three","four","five","six"]
  suits=["spades","clubs","hearts","Diamond"]


            # solution one
#    cards = for value <- values do
#    for suit <- suits do
#     "#{value} of #{suit}"
#    end
#   end
#   List.flatten(cards)
# end

            # solution two
       for suit <- suits, value <- values do
          "#{value} of #{suit}"
       end
        end

def shufftle(deck) do
  Enum.shuffle(deck)
end

@doc"""
    Divides a deck into a hand and the remainder of the deck.
    the `hand_size` argument indicates how many cards should 
    be in the hand.
    ## Examples
      iex> deck =Cards.create_deck
      iex>{hand,deck}=Cards.deal(deck,1)
      iex> hand
      ["Ace of spades"]
 """

def contains?(deck , card) do
  Enum.member?(deck, card)
end


@doc"""
    Determines whether a deck cottains a given card

    ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck,"Ace of spades")
      true
 """
def deal(deck, hand_size) do
  Enum.split(deck ,hand_size  )
end

def save(deck, filename) do
  binary = :erlang.term_to_binary(deck)
  File.write(filename,binary)
end

def load(filename)do
  # {status,binary}=File.read(filename)
  
  # case status do
  #   :ok -> :erlang.binary_to_term binary
  #   :error -> "That file does not exist"

     
  case File.read(filename)do
    {:ok ,binary} -> :erlang.binary_to_term binary
    {:error ,_reason} -> "That file does not exist"
  end
end



def create_hand(hand_size) do
  # deck =Cards.create_deck
  # deck =Cards.shuffftle(deck)
  # hand=Cards.deal(deck,hand_size)

      #used a pipe operator
  Cards.create_deck
  |>Cards.shufftle
  |>Cards.deal(hand_size)
  end

end


