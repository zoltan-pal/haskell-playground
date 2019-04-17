module Primes
    ( printPrimes,
      isPrime
    ) where

divisibleBy :: Integral a => a -> a -> Bool
x `divisibleBy` y = x `mod` y == 0

hasDivisorInList :: Integral a => a -> [a] -> Bool
hasDivisorInList x [] = False
hasDivisorInList x (d:ds)
  | null ds = x `divisibleBy` d
  | otherwise = (x `divisibleBy` d) || hasDivisorInList x ds

isPrime :: Integral a => a -> Bool
isPrime x = do
  let max = floor (sqrt (fromIntegral x))
  not (hasDivisorInList x [2..max])

printPrimes :: Integral a => a -> a -> IO()
printPrimes x y
  | x < y = do
    let current = max x 2
    if isPrime current
    then putStr (show (fromIntegral current) ++ " ")
    else return ()
    printPrimes (current + 1) y
  | otherwise = return ()
