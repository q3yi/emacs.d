python-ts-mode

(leetcode "import unittest;" n
	  "from typing import *;" n n
	  "class Solution:" n n>
	  "def " (p "func" fn) "(" p ") -> " p ":" n> >
	  "pass" n n n
	  "class TestSolution(unittest.TestCase):" n>
	  "def _run_test(self, test_f):" n>
	  "test_cases = []" n> q n n
	  "    def test_" (s fn) "(self):" n>
	  "s = Solution()" n>
	  "self._run_test(s." (s fn) ")" n n
	  "if __name__ == \"__main__\":" n>
	  "unittest.main()" n)

(main "if __name == \"__main__\":" n> q)
