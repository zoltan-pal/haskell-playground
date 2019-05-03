module Main where

import Assert

main :: IO()
main = do
  let assertionsOnNumerics = [
        Assertion 1 2 (/=),
        Assertion 0 0 (==),
        Assertion 0.2 0.1 (>)]
      assertionsOnCharacters = [
        Assertion 'a' 'a' (==),
        Assertion 'a' 'b' (<)]
      assertionsOnStrings = [
        Assertion "foo" "foo" (==),
        Assertion "bar" "baz" (/=)]
      assertionsOnLists = [
        Assertion [] [] (==),
        Assertion [1..3] [1..3] (==),
        Assertion [5, 4..1] [1..5] (/=)]
      assertionCheckShouldFailOnFirst = [
        Assertion 1 2 (==),
        Assertion 0 0 (==)]

  print $ checkAssertions assertionsOnNumerics
  print $ checkAssertions assertionsOnCharacters
  print $ checkAssertions assertionsOnStrings
  print $ checkAssertions assertionsOnLists
  print $ checkAssertions assertionCheckShouldFailOnFirst
