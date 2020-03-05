criba :: [Integer] -> [Integer]
criba (p:xs) = p : criba [x | x <- xs, x `mod` p /= 0]
criba []     = []

primos :: [Integer]
primos = criba [2..]