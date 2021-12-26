import unittest

from src.rust.num.num import Array


class NumTest(unittest.TestCase):

    def test___str__(self):
        a = Array([1, 2, 3])
        self.assertEqual(str(a), "[1.0, 2.0, 3.0]")

    def test___add__(self):
        x = Array([1., 2., 3.])
        y = Array([1., 1., 1])
        self.assertEqual(x + y, Array([2, 3, 4]))

    def test___sub__(self):
        x = Array([1., 2., 3.])
        y = Array([1., 1., 1])
        self.assertEqual(x - y, Array([0, 1, 2]))

    def test__getitem__(self):
        a = Array([1])
        self.assertEqual(a[0], 1.0)

    def test__setitem__(self):
        a = Array([1])
        a[0] = 2.0
        self.assertEqual(a[0], 2.0)

    def test_mean(self):
        a = Array([1, 5, 12, 26])
        self.assertEqual(a.mean(), 11)

    def test_median(self):
        a = Array([1, 5, 12, 26])
        self.assertEqual(a.median(), 8.5)


if __name__ == "__main__":
    unittest.main()
