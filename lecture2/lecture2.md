Functional Programming - Nov 5
==============================

Modelling & Datatypes
---------------------

```
-- The Suit
data Suit = Spades | Hearts | Clubs | Diamonds
```

colour :: Suit -> Colour

_

deriving (Show, Eq, Ord)

rankBeats = (>)

infix 2 |+|

data Card = Card {rank::Rank, suit::Suit}

undefined
