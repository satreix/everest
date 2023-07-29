import unittest

import celpy


class CelTest(unittest.TestCase):
    def test_cel_101(self):
        env = celpy.Environment()
        ast = env.compile(
            """
account.balance >= transaction.withdrawal
    || (account.overdraftProtection
    && account.overdraftLimit >= transaction.withdrawal - account.balance)
"""
        )
        program = env.program(ast)
        result = program.evaluate(
            {
                "account": celpy.json_to_cel(
                    {"balance": 500, "overdraftProtection": False}
                ),
                "transaction": celpy.json_to_cel({"withdrawal": 600}),
            }
        )
        self.assertEqual(result, celpy.celtypes.BoolType(False))


if __name__ == "__main__":
    unittest.main()
