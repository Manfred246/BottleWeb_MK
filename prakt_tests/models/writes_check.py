import re

def check_author(check_author):
    if (name_regex.match(check_author)):
        return True
    else:
       return False

def check_link(link):
    if (link_regex.match(link)):
        return True
    else:
        return False

name_regex = re.compile(r"^[a-z.\s-]+$", re.I)
link_regex = re.compile(r"^(http|https):\/\/([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:\/~+#-]*[\w@?^=%&\/~+#-])+$", re.I)