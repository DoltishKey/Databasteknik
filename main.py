# *-* coding:utf-8 *-*
import bottle
from bottle import route, get, post, run, template, error, static_file, request, redirect, abort, response, app
import MySQLdb

db = None
cursor = None

def call_database():
	global db
	global cursor
	db = MySQLdb.connect(host="195.178.232.16", port=3306, user="af6307", passwd="Hejhejhej1", db="AF6307");
	cursor = db.cursor()
	return cursor

def hang_up_on_database():
    global db
    db = db.close()


@route('/')
def index():
	cursor=call_database()
	sql="SELECT band.namn as bandNamn, DATE_FORMAT(spelar.start_tid, '%m-%d') DATEONLY,\
		DATE_FORMAT(spelar.slut_tid, '%m-%d') DATEONLY, DATE_FORMAT(spelar.start_tid, '%H:%i') TIMEONLY,\
		DATE_FORMAT(spelar.slut_tid, '%H:%i') TIMEONLY, scen.namn as scenNamn  FROM spelar\
			JOIN scen\
				ON scen.id=spelar.scen_id\
			JOIN band\
				ON band.id=spelar.band_id"

	cursor.execute(sql)
	spelschema=cursor.fetchall()
	hang_up_on_database()
	return template('index', pageTitle='Start', spelschema=spelschema)

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
def new_show():
	cursor=call_database()

	sql_band="SELECT * FROM band"
	cursor.execute(sql_band)
	bands=cursor.fetchall()

	sql_scen="SELECT * FROM scen"
	cursor.execute(sql_scen)
	scener=cursor.fetchall()

	sql_spelschema="SELECT band.namn as bandNamn, DATE_FORMAT(spelar.start_tid, '%m-%d') DATEONLY,\
		DATE_FORMAT(spelar.slut_tid, '%m-%d') DATEONLY, DATE_FORMAT(spelar.start_tid, '%H:%i') TIMEONLY,\
		DATE_FORMAT(spelar.slut_tid, '%H:%i') TIMEONLY, scen.namn as scenNamn  FROM spelar\
			JOIN scen\
				ON scen.id=spelar.scen_id\
			JOIN band\
				ON band.id=spelar.band_id"
	cursor.execute(sql_spelschema)
	spelschema=cursor.fetchall()

	hang_up_on_database()
	return template('add_show', pageTitle='Lägg till spelning', bands=bands, scener=scener, spelschema=spelschema)


@route('/add_play', method="POST")
def new_show_post():

		cursor=call_database()
		vilket_band=request.forms.get('band_name')
		vilken_scen=request.forms.get('stage_name')
		start_tid=request.forms.get('start_tid')
		slut_tid=request.forms.get('slut_tid')

		sql_band_id="SELECT id FROM band WHERE namn='%s'" %(vilket_band)
		cursor.execute(sql_band_id)
		band_id=cursor.fetchall()

		sql_scen_id="SELECT id FROM scen WHERE namn='%s'" %(vilken_scen)
		cursor.execute(sql_scen_id)
		scen_id=cursor.fetchall()

		sql="INSERT INTO spelar(Start_tid, Slut_tid, Scen_id, Band_id) VALUES(%s, %s, %s, %s)"
		cursor.execute(sql, (start_tid, slut_tid, scen_id, band_id,))
		db.commit()
		hang_up_on_database()
		redirect('/add_play')



@route('/edith_play')
def security():
	cursor=call_database()
	sql_spelschema="SELECT band.namn as bandNamn, DATE_FORMAT(spelar.start_tid, '%m-%d') DATEONLY,\
		DATE_FORMAT(spelar.slut_tid, '%m-%d') DATEONLY, DATE_FORMAT(spelar.start_tid, '%H:%i') TIMEONLY,\
		DATE_FORMAT(spelar.slut_tid, '%H:%i') TIMEONLY, scen.namn as scenNamn  FROM spelar\
			JOIN scen\
				ON scen.id=spelar.scen_id\
			JOIN band\
				ON band.id=spelar.band_id"
	cursor.execute(sql_spelschema)
	spelschema=cursor.fetchall()
	hang_up_on_database()
	return template('change_show', pageTitle='Spelning', spelschema=spelschema)


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
