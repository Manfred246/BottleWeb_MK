import unittest
from models.writes_check import check_author, check_link

class Test_test_writes(unittest.TestCase):
    def test_F_authors(self):        
        f_authors = ["Name123", "Name!", "Name_", "123"]
        for author in f_authors:
            self.assertFalse(check_author(author))

    def test_T_authors(self):        
        t_authors = ["Name-Example", "Name E.X.", "Name Example", "Name example-again"]
        for author in t_authors:
            self.assertTrue(check_author(author))

    def test_F_links(self):        
        f_links = ["abc", "", "  ", "0780", "http :"]
        for link in f_links:
            self.assertFalse(check_link(link))

    def test_T_links(self):        
        t_links = ["https://avatars.dzeninfra.ru/get-zen_doc/1577780/pub_5dfcbc59e6cb9b00b1817a73_5dfcbca843fdc000adb499da/scale_1200",
                   "https://faunistics.com/wp-content/uploads/2022/02/5-7.jpg",
                   "https://givnost.ru/wp-content/uploads/2019/07/kvokka-zhivotnoe-opisanie-osobennosti-vidy-obraz-zhizni-i-sreda-obitaniya-kvokki-6.jpg",
                   "https://cdn-st1.rtr-vesti.ru/vh/pictures/xw/411/164/4.jpg",
                   "https://givnost.ru/wp-content/uploads/2019/07/kvokka-zhivotnoe-opisanie-osobennosti-vidy-obraz-zhizni-i-sreda-obitaniya-kvokki-2.jpeg",
                   "https://givnost.ru/wp-content/uploads/2019/07/kvokka-zhivotnoe-opisanie-osobennosti-vidy-obraz-zhizni-i-sreda-obitaniya-kvokki-4.jpg"]
        for link in t_links:
            self.assertTrue(check_link(link))

if __name__ == '__main__':
    unittest.main()
