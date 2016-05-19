# *-* coding:utf-8 *-*
import bottle
from bottle import route, get, post, run, template, error, static_file, request, redirect, abort, response, app
import MySQLdb

db = None
cursor = None

def call_database():
	global db
	global cursor
	db = MySQLdb.connect(host="195.178.232.16", port=3306, user="AF6307", passwd="Hejhejhej1", db="AF6307");
	cursor = db.cursor()
	return cursor

def hang_up_on_database():
    global db
    db = db.close()


@route('/')
def index():
	return template('index', pageTitle='Start')

@route('/book_band')
def band_booking():
	return template('add_user', pageTitle='Lägg till band')

@route('/staff')
def staff():
	return template('staff', pageTitle='Hantera personal')

@route('/security')
def security():
	return template('security', pageTitle='Säkerhetsansvarig')

@route('/security_search')
def security_search():
	return template('security_search', pageTitle='Säkerhetsansvarig')

@route('/add_play')
def security():
	return template('add_show', pageTitle='Lägg till spelning')

@route('/edith_play')
def security():
	return template('change_show', pageTitle='Spelning')

@route('/contact')
def contact():
	return 'Kontakt'




'''********Övriga Routes********'''

@error(404)
def error404(error):
    return template('pagenotfound', pageTitle = 'Fel!' )

@route('/static/<filename:path>')
def server_static(filename):
    return static_file(filename, root="static")


run(host='localhost', port = 8080)
