import unittest
from reviews_check import check_mail, check_name

class Test_test_reviews(unittest.TestCase):
    def test_F_mails(self):
        f_mails = ["", "   ", "mail.ru", "@mail.ru", "mail@.ru", "mail mail@mail.ru",
                   "m.ail@yandex.ru", "m/ail@gmail.com", "mail@@mail.ru", "mail@mail..ru", "mail@mail.russia", "2", "mail@@mail.ru"]

        for mail in f_mails:
            self.assertFalse(check_mail(mail))

    
    def test_T_mails(self):        
        t_mails = ["manfred@mail.ru", "lololo@gmail.com", "dcryde@yandex.ru", "yan@gmail.com", "matthew@yandex.ru",
                   "dimaza@mail.ru", "dima2005@mail.ru", "sherbet@yahoo.ru", "rench@yandex.ru", "kris200    iris@yandex.ru", "kalash@narod.ru",
                  "blackclover@narod.com"]
        for mail in t_mails:
            self.assertTrue(check_mail(mail))

if __name__ == '__main__':
    unittest.main()
