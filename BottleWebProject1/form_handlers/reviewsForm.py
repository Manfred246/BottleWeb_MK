from bottle import post, request, route, view
from datetime import datetime
import json
import os

# обработчик для формы reviews

@route('/reviews')
@view('reviews')
def reviewsForm():
