{-
  The sell rate for the English pound was
  12.7775 SEK on the 20th of October 2008.
  How many pounds did one get for 1000 SEK that day?
-}

exchangeRate = 12.7775

pounds :: Double -> Double
pounds kr = kr / exchangeRate

{-
  In some countries people use the Fahrenheit temperature scale.
  0° Celsius (C) corresponds to 32° Fahrenheit (F), and an increase of 5° C
  corresponds to an increase of 9° F. How many Fahrenheit degrees is 28° C?
-}

fahrenheits :: Double -> Double
fahrenheits c = c * 9/5 + 32

{-
  A shop sells potatoes for 3.50 SEK / Kg. To stimulates large sales,
  the shop offers a discount to 3 SEK / Kg for the quantity exceeding 10 Kg.
  We want to define the function that calculates the price.
-}
potatoPrice :: Double -> Double
potatoPrice p
  | p <= 10   = p * 3.5
  | p <= 20   = p * 3.0 + 5
  | otherwise = p * 2.5 + 15

{-
  As an example we define a function that defines the average of two numbers.
-}

average :: Double -> Double -> Double
average x y = (x + y) / 2

averageThree :: Double -> Double -> Double -> Double
averageThree x y z = (x + y + z) / 3

{-
  Define a function that given a year gives the number of days in that year.
  Used the simplified rule that year numbers divisible by four are leap years
  (years with 366 days).
-}

yearDays :: Integer -> Integer
yearDays y
  | y `mod` 4 == 0 = 366
  | otherwise      = 365

{-
  Think of an whole number greater than one. If its even, divide it by two,
  otherwise multiply it by three and add one. Stop if the resulting number is one,
  otherwise repeat the procedure.

  Given a number n, how many numbers are there in the sequence?
  For n=10, we get 7 numbers. For n=7 we get 17 numbers.
-}

-- Function next that given a number computes the next number in the sequence.

next :: Integer -> Integer
next n
  | n `mod` 2 == 0 = n `div` 2
  | otherwise = n * 3 + 1

-- We want to define a function steps that takes a number n as argument
-- and calculates the length of the generated sequence.

steps :: Integer -> Integer
steps n
  | n == 1 = 1
  | otherwise = steps (next n)+1

numbers :: Int -> [Int]
numbers n
     |n==1      = [1]
     |otherwise = n : numbers(next n)
