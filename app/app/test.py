from django.test import TestCase

from app.calc import add, subtract


class CalcTest(TestCase):
    def test_add_numbers(self):
        """Test that two number are added together"""
        self.assertEqual(add(3, 8), 11)

    def test_subtract_numbers(self):
        """Test substract y - x and returned"""
        self.assertEqual(subtract(5, 11), 6)
