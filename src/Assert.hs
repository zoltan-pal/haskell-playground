{-# LANGUAGE KindSignatures, GADTs #-}

module Assert
    ( Assertion(..),
      checkAssertions
    ) where

data Assertion :: * -> * where
    Assertion :: Eq a => {
        actualValue :: a,
        expectedValue :: a,
        valuesRelationFunction :: a -> a -> Bool
    } -> Assertion a

checkAssertions :: Eq a => [Assertion a] -> String
checkAssertions [] = "No assertions to check."
checkAssertions assertions = runAssertionChecker 1 assertions

runAssertionChecker :: Eq a => Int -> [Assertion a] -> String
runAssertionChecker assertionNumber (currentAssertion:remainingAssertions)
  | null remainingAssertions =
    if relationBetween actual expected
    then "Assertion check successful (" ++ show assertionNumber ++ "/" ++ show assertionNumber ++ ")."
    else "Assertion check failure at assertion #" ++ show assertionNumber ++ "."
  | otherwise =
    if relationBetween actual expected
    then runAssertionChecker (assertionNumber + 1) remainingAssertions
    else "Assertion check failure at assertion #" ++ show assertionNumber ++ "."
  where
    expected = expectedValue currentAssertion
    relationBetween = valuesRelationFunction currentAssertion
    actual = actualValue currentAssertion
