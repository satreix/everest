import Test.HUnit

import Luhn

testValidNumber :: Test
testValidNumber = TestCase $ assertBool "Valid Number Test" (Luhn.check 4111111111111111)

testInvalidNumber :: Test
testInvalidNumber = TestCase $ assertBool "Invalid Number Test" (not $ Luhn.check 4111111111111112)

tests :: Test
tests = TestList [TestLabel "Test Valid Number" testValidNumber, TestLabel "Test Invalid Number" testInvalidNumber]

main :: IO Counts
main = runTestTT tests
