module Luhn where 
    
toDigits :: Integer -> [Integer]
toDigits = map (read . (:[])) . show

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther = reverse . zipWith (*) (cycle [1,2]) . reverse

sumDigits :: [Integer] -> Integer
sumDigits = sum . concatMap toDigits

-- https://en.wikipedia.org/wiki/Luhn_algorithm
check :: Integer -> Bool
check n = sumDigits (doubleEveryOther (toDigits n)) `mod` 10 == 0
