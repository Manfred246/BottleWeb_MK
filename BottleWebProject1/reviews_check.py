import re

def check_mail(mail):
    if (EMAIL_REGEX.match(mail)):
        return True
    else:
       return False

def check_name(name):
    if (NAME_REGEX.match(name)):
        return True
    else:
        return False

NAME_REGEX = re.compile(r"^[a-z0-9]+$", re.I)
EMAIL_REGEX = re.compile(r"^[a-z0-9]+@[a-z0-9]+\.[a-z]{2,4}$")
