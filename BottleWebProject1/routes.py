from bottle import request, post
import re
from datetime import datetime
import os
import json

"""
Routes and views for the bottle application.
"""

from bottle import route, view
from datetime import datetime

@route('/')
@route('/home')
@view('index')
def home():
    """Renders the home page."""
    return dict(
        year=datetime.now().year
    )

@route('/gallery')
@view('gallery')
def about():
    """Renders the about page."""
    return dict(
        title='gallery',
        message='Your application description page.',
        year=datetime.now().year
    )

@route('/writes')
@view('writes')
def write():
    """Renders the about page."""
    return dict(
        title='writes',
        message='Your application description page.',
        year=datetime.now().year
    )

@post('/reviews')
@route('/reviews')
@view('reviews')
def review():        
    # �������� �� ������������� ����� � �� ��, ��� �� �� ������
    if (os.path.isfile('reviews.json') and os.stat('reviews.json').st_size > 0):  
        # ���������� ������ �� ����� json
        with open('reviews.json') as json_file:
            file = json.load(json_file)
    else:
        file = {}
    
    # �������� ������� �� ������
    if request.forms.get("BTNSEND") == "Send":
        # ���������� ������ � �����
        reviewTXT = request.forms.get('REVIEW')
        username = request.forms.get('USERNAME')
        mail = request.forms.get('ADRESS')
        
        # �������� ������ �����
        if (len("%s" % reviewTXT) > 0 and len("%s" % username) > 0 and len("%s" % mail) > 0):            
            # �������� �� ����� �����
            if (len("%s" % reviewTXT) >= 6 and len("%s" % username) >= 4):
                # �������� ������������ �����
                if (EMAIL_REGEX.match(mail)):          
                    # �������� �� ������������� ����� � �����
                    if (mail in file):                 
                        # �������� �� ������������ ��������
                        if (username in file[mail]['name']):        
                            # �������� �� ������������ ������
                            if (reviewTXT not in file[mail]):        
                                # ���������� ������ � �����
                                file[mail]['reviews'].append(reviewTXT)
                                with open('reviews.json', 'w') as outfile:
                                    json.dump(file, outfile, indent=4)
                                return dict(
                                    title='reviews',
                                    message='Thank you for your feedback',
                                    year=datetime.now().year,
                                    rev = file)
                            else: 
                                return dict(
                                    title='reviews',
                                    message='Error! Mistake! Have you already left this review!',
                                    year=datetime.now().year,
                                    rev = file)
                        else:
                            return dict(
                                title='reviews',
                                message='Error! Another name has already been registered to this email!',
                                year=datetime.now().year,
                                rev = file)
                    else:                        
                        # �������� ����� ������ � �����
                        file[mail] = {'name': username, 'reviews': [reviewTXT]}    
                        with open('reviews.json', 'w') as outfile:
                            json.dump(file, outfile, indent=4)
                        return dict(
                            title='reviews',
                            message='Thank you for your feedback',
                            year=datetime.now().year,
                            rev = file)
                else:
                    return dict(
                        title='reviews',
                        message='Error! Invalid mail!',
                        year=datetime.now().year,
                        rev = file)
            else:
                return dict(
                title='reviews',
                message='Error! The length of the review must be at least 6 characters, and the length of the name must be at least 4!',
                year=datetime.now().year,
                rev = file)
        else:
            return dict(
                title='reviews',
                message='Error! Input fields cannot be empty!',
                year=datetime.now().year,
                rev = file)
    else:
        return dict(
        title='reviews',
        message='',
        year=datetime.now().year,
        rev=file)

EMAIL_REGEX = re.compile(r"^[a-z0-9]+@[a-z0-9]+\.[a-z]{2,4}$")