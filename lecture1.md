Functional Programming - Nov 2
==============================
it
--
`it` is the last typed variable

import Test.QuickCheck
----------------------
Testing framework

Functions
---------
```haskell
> toSEK y = y * exchangeRate
> toYEN s = s / exchangeRate
```

Properties (Testing)
--------------------
```haskell
> prop_convert y = toYEN (toSEK y) ~== y
> quickCheck
```

Infix operator
--------------
```haskell
m ~== n = abs' (m - n) < epsilon
  where epsilon = 10e-5
```

Guards
------
```haskell
abs' n | n < 0     = -n
       | otherwise = n -- | n >= 0 = n
```

Definition by recursion
-----------------------
```haskell
power n k | k == 0    = 1
          | k > 0     = n * power n (k - 1)
          | otherwise = error "power of negative"
```

Pattern matching
----------------
```haskell
power n 0 = 1
          | k > 0     = n * power n (k - 1)
          | otherwise = error "power of negative"
```

Statically typed
----------------
```haskell
power :: Integer n 0  = 1
          | k > 0     = n * power n (k - 1)
          | otherwise = error "power of negative"
```

Types
=====
###Tuples###
Tuples are like `(True, 42)`

```haskell
>:t (True, 42)
(True,42) :: Num t => (Bool, t)
```

###List###
Lists are like `[1,2,3]`
`[ ]` an empty list is a list of any type.

####(:) (cons operator)####
```haskell
> :t (:)
(:) :: a -> [a] -> [a]

> 1 : [2,3]
[1,2,3]

> 1 : 2 : 3 : []
[1,2,3]
```

```haskell
-- create list from 1 to 100
[1..100]
```

####Functions over lists defined by recursion####
#####length#####
```haskell
> len :: [a] -> Int
> len [] = 0
> len (x:xs) = 1 + len xs
```

#####last#####
```haskell
> last' [] = error "last of empty list"
> -- last' (x:[]) list that starts with x and have an empty list just after,
> the same as below:
> last' [x] = x
> last' (x:xs) = last' xs
```

#### List comprehension ####
```haskell
> [x^2 | x <- [1..10]]
[1,4,9,16,25,36,49,64,81,100]

> [x^2 | x <- [1..10], odd x]
[1,9,25,49,81]

> [ (x,x^2) | x <- [1..10]]
[(1,1),(2,4),(3,9),(4,16),(5,25),(6,36),(7,49),(8,64),(9,81),(10,100)]

> [ "Hello " ++ name | name <- ["Dave", "Bob"] ]
["Hello Dave","Hello Bob"]

> [ ("Hello " ++ name, n) | name <- ["Dave", "Bob"], n <- [1,2,3] ]
[("Hello Dave",1),("Hello Dave",2),("Hello Dave",3),("Hello Bob",1),("Hello Bob",2),("Hello Bob",3)]
```

Quicksort
---------
```haskell
qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort bigger
  where smaller = [y | y <- xs, y < x]
        bigger  = [z | z <- xs, z >= x]
```
