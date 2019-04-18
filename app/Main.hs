module Main where

import BinaryNumberConverter

main :: IO ()
main = do
  putStrLn ("129 in binary is " ++ binaryFromInt 129)
  putStrLn ("01010101 in decimal is " ++ (show (binaryToInt "01010101")))
