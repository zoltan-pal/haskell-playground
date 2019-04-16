module FizzBuzz
    ( listFizzBuzz
    ) where

convertToFizzBuzz :: Int -> String
convertToFizzBuzz x
  | x `mod` 15 == 0   = "fizzbuzz"
  | x `mod` 5 == 0    = "buzz"
  | x `mod` 3 == 0    = "fizz"
  | otherwise         = show x

listFizzBuzz :: [Int] -> IO()
listFizzBuzz [] = putStrLn ""
listFizzBuzz (x:xs)
  | null xs = putStrLn (convertToFizzBuzz x)
  | otherwise = do
      putStrLn (convertToFizzBuzz x)
      listFizzBuzz xs
