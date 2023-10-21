import unittest

from src.python import luhn

class LuhnTests(unittest.TestCase):
    def test_valid_number(self):
        self.assertTrue(luhn.check(4111111111111111))

    def test_invalid_number(self):
        self.assertFalse(luhn.check(4111111111111112))
