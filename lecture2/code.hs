-- The Suit
data Suit = Spades | Hearts | Clubs | Diamonds
  deriving (Show,Eq) -- Eq for comparison

-- The Color
data Colour = Red | Black
  deriving Show

colour :: Suit -> Colour
-- colour c | c == Spades || c == Clubs = Black
--         | otherwise                 = Red
colour Spades = Black
colour Clubs  = Black
colour _      = Red

-- The Rank
data Rank = Numeric Int | Jack | Queen | King | Ace
  deriving (Show, Eq, Ord)

prop_Rank (Numeric n) = n > 1 && n <= 10
prop_Rank _           = True

rankBeats :: Rank -> Rank -> Bool
-- rankBeats r1 r2 = r1 > r2
rankBeats = (>)

{-
  data Temp = C Float | F Float

  data Temp = Temp TempKind Float
  data TempKind = C | F
-}

-- infix Syntax

infix 2 |+|
True  |+| False = True
False |+| True  = True
_     |+| _     = False


-- Card
data Card = Card Rank Suit
  deriving Show

rank (Card r s) = r
suit (Card r s) = s

-- shorthand form defining all three
-- data Card = Card {rank::Rank, suit::Suit}

cardBeats :: Card -> Card -> Bool
-- cardBeats (Card r1 s1) (Card r2 s2) = undefined
cardBeats (Card r1 s1) (Card r2 s2) = s1 == s2 && r1 `rankBeats` r2

data Hand = Empty | Add Card Hand
  deriving Show

eHand = Add (Card Jack Hearts) (
        Add (Card Ace Spades)
        Empty)

size :: Hand -> Int
size Empty     = 0
size (Add c h) = 1 + size h

-- handBeats
handBeats :: Hand -> Card -> Bool
handBeats Empty      _ = False
handBeats (add c' h) c = c' `cardBeats` c || h `handBeats` c
