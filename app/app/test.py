from django.test import TestCase

from app.calc import add


class CalcTest(TestCase):
    def test_add_numbers(self):
        """Test that two number are added togetger"""
        self.assertEqual(add(3, 8), 11)