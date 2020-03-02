perfectos :: Int -> [Int]
perfectos n = [x | x <- [1..n], sum (init (factores x))== x]

factores :: Int -> [Int]
factores n = [x | x <- [1..n], n `mod` x == 0]