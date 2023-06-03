import unittest
from models.reviews_check import check_mail, check_name

class Test_test_reviews(unittest.TestCase):    
    def test_F_mails(self):
        f_mails = ["", "   ", "mail.ru", "@mail.ru", "mail@.ru", "mail mail@mail.ru",
                   "m.ail@yandex.ru", "m/ail@gmail.com", "mail@@mail.ru", "mail@mail..ru", "mail@mail.russia", "2", "mail@@mail.ru",
                   "mail@ma.il.ru", "mail@mail.ru.", "mail@mail.ru1"]
        for mail in f_mails:
            self.assertFalse(check_mail(mail))
    
    def test_T_mails(self):        
        t_mails = ["manfred@mail.ru", "lololo@gmail.com", "dcryde@yandex.ru", "yan@gmail.com", "matthew@yandex.ru",
                   "dimaza@mail.ru", "dima2005@mail.ru", "sherbet@yahoo.ru", "rench@yandex.ru", "kris200iris@yandex.ru", "kalash@narod.ru",
                  "blackclover@narod.com"]
        for mail in t_mails:
            self.assertTrue(check_mail(mail))

    def test_F_names(self):
        f_names = ["Name Example", "Name!Example", "Name/Example", "Name?Example", "Name123#", "$Name", "Name1-Example%", " ", " NameEx"]        
        for name in f_names:
            self.assertFalse(check_name(name))

    def test_T_names(self):
        f_names = ["Name", "NameExample", "NaMeExAmPlE", "name_example", "name-example", "_name_-Example", "name_example_", "548Name548",
                   "Name_548"]        
        for name in f_names:
            self.assertTrue(check_name(name))

if __name__ == '__main__':
    unittest.main()
