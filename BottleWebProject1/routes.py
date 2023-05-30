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
    # проверка на существование файла и на то, что он не пустой
    if (os.path.isfile('reviews.json') and os.stat('reviews.json').st_size > 0):  
        # считывание данных из файла json
        with open('reviews.json') as json_file:
            file = json.load(json_file)
    else:
        file = {}

    # указание индекса отзыва
    num = 1
    for i in file:
        for j in file[i]['num']:
            if (j > num):
                num=j
    # проверка нажатия на кнопку
    if request.forms.get("BTNSEND") == "Send":
        #считывание данных с формы
        reviewTXT = request.forms.get('REVIEW')
        username = request.forms.get('USERNAME')
        mail = request.forms.get('ADRESS')                

        # проверка пустых полей
        if (len("%s" % reviewTXT) > 0 and len("%s" % username) > 0 and len("%s" % mail) > 0):
            # проверка на длину полей
            if (len("%s" % reviewTXT) >= 6 and len("%s" % username) >= 4):
                # проверка корректности почты
                if (EMAIL_REGEX.match(mail)):
                    # проверка на существование почты в файле
                    if (mail in file):
                        # проверка на соответствие никнейма
                        if (username in file[mail]['name']):
                            # проверка на дублирование отзыва
                            if (reviewTXT not in file[mail]['reviews']):                                
                                # добавление к файлу
                                num += 1
                                file[mail]['reviews'].append(reviewTXT)
                                file[mail]['num'].append(num)
                                with open('reviews.json', 'w') as outfile:
                                    json.dump(file, outfile, indent=4)
                                mes = 'Thank you for your feedback'
                            else:
                                mes = 'Error! You have already left this review before!'
                        else:
                            mes = 'Error! Another name has already been registered to this email!'
                    else:
                        # создание новой записи в файле
                        num += 1
                        file[mail] = {'name': username, 'reviews':[reviewTXT], 'num':[num]}
                        with open('reviews.json', 'w') as outfile:
                            json.dump(file, outfile, indent=4)
                        mes = 'Thank you for your feedback'
                else:
                    mes = 'Error! Invalid mail!'
            else:
                mes = 'Error! The length of the review must be at least 6 characters, and the length of the name must be at least 4!'
        else:
            mes = 'Error! Input fields cannot be empty!'
    else:
        mes = ''

    return dict(
        title='reviews',
        message=mes,
        year=datetime.now().year,
        rev=file,
        count=num)

EMAIL_REGEX = re.compile(r"^[a-z0-9]+@[a-z0-9]+\.[a-z]{2,4}$")