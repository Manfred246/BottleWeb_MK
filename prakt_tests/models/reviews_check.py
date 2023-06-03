import re

def check_mail(mail):
    if (email_regex.match(mail)):
        return True
    else:
       return False

def check_name(name):
    if (name_regex.match(name)):
        return True
    else:
        return False

name_regex = re.compile(r"^[a-z0-9-_]+$", re.I)
email_regex = re.compile(r"^[a-z0-9]+@[a-z0-9]+\.[a-z]{2,4}$")