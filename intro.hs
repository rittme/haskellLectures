import Test.QuickCheck
{-
  Lecture week 1 - part A
-}

--echangeRate
exchangeRate = 0.071 -- SEK per YEN

-- functions
toSEK y = y * exchangeRate
toYEN s = s / exchangeRate

-- properties (testing)
prop_convert y = toYEN (toSEK y) ~== y

-- infix operator (definition of a two argument symbol function)
m ~== n = abs' (m - n) < epsilon
  where epsilon = 10e-5

-- Definition by cases (guards)
--abs' n = if n < 0 then -n else n
abs' n | n < 0     = -n
       | otherwise = n -- | n >= 0 = n

------------------------------------------------------------
-- definition by recursion
-- power n k
-- power 2 3 = 2 * 2 * 2

--power n k | k == 0 = 1 -- testing for equality with a guard is not normal
power :: Integer n 0  = 1
          | k > 0     = n * power n (k - 1)
          | otherwise = error "power of negative"

prop_power n k = let p = abs k in
                     power n p == n^p

-- Types

-- Tuple
exT :: Int -> (Bool,Int)
exT n = (n < 0, abs n)

first :: (a,b) -> a --generics : for any type a and any type b the function will return type a
first (x,y) = x

len :: [a] -> Int
len [] = 0
len (x:xs) = 1 + len xs


-- Quicksort
qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort bigger
  where smaller = [y | y <- xs, y < x]
        bigger  = [z | z <- xs, z >= x]
