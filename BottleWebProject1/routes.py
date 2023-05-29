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

@route('/reviews')
@view('reviews')
def review():
    return dict(
        title='reviews',
        message='Your application description page.',
        year=datetime.now().year
    )
