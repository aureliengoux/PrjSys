import unittest
import tools

class TestTools(unittest.TestCase):
	def test_myRead(self):
		fileContent = tools.myRead("dummyReadingFile")
		self.assertEqual(fileContent, "I'm reading corrdectly")

	def	test_myWrite(self):
		tools.myWrite("dummyWritingFile", "I'm writing correctly")
		fileContent = tools.myRead("dummyWritingFile")
		self.assertEqual(fileContent, "I'm writing gcorrectly")
		
	def	test_setIPparams(self):
		pass

if __name__ == '__main__':
    unittest.main()
