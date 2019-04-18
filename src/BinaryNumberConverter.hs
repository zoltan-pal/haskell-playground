module BinaryNumberConverter
    ( binaryFromInt,
      binaryToInt
    ) where

-- Sloppy support for negative int inputs
binaryFromInt :: Integral a => a -> String
binaryFromInt x
  | x == 0 = "0"
  | x == 1 = "1"
  | x > 1 = binaryFromInt (floor (fromIntegral x / 2)) ++ show (fromIntegral (x `mod` 2))
  | otherwise = "-" ++ binaryFromInt (-x)

-- Assuming input string only consists of ones and zeros
binaryToInt :: Integral a => String -> a
binaryToInt str
  | str == "" = 0
  | otherwise = do
    let allButLast = length str - 1
    if last str == '1'
    then 2 * binaryToInt (take allButLast str) + 1
    else 2 * binaryToInt (take allButLast str)
