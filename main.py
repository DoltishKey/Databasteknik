# *-* coding:utf-8 *-*
import bottle
from bottle import route, get, post, run, template, error, static_file, request, redirect, abort, response, app
import MySQLdb
import json

db = None
cursor = None

def call_database():
	global db
	global cursor
	db = MySQLdb.connect(host="195.178.232.16", port=3306, user="af6307", passwd="Hejhejhej1", db="af6307");
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

@route('/do_book_band', method="POST")
def do_band_booking():
	cursor = call_database()
	bandnamn = request.forms.get('bandnamn')
	land = request.forms.get('land')
	loge = int(request.forms.get('loge'))
	stil = request.forms.get('stil')

	artists_name = request.POST.getall('artist-namn')
	artists_pers_nr = request.POST.getall('pers_nr')
	artists_phone = request.POST.getall('artist-tele')
	artists_imp_info = request.POST.getall('artist-important')
	artist_fun_info = request.POST.getall('artist-kul')

	try:
		global db
		sql = "INSERT INTO band(Namn, Stil, Ursprungland, Loge) VALUES (%s, %s, %s, %s)"
		cursor.execute(sql, (bandnamn, stil, land, loge,))
		band_id = cursor.lastrowid

		artists = zip(artists_name, artists_phone, artists_imp_info, artist_fun_info, artists_pers_nr)
		sql = "INSERT IGNORE INTO artist (Namn, Tele, Viktigt_info, Kul_info, Pers_nr)\
		VALUES(%s, %s, %s, %s, %s)"
		cursor.executemany(sql, artists)

		artists_pers_nr = map(int, artists_pers_nr)
		artist_ids = []
		for artist_nr in artists_pers_nr:
			sql = "INSERT INTO spelar_i (Band_id, Artist_id) \
		    VALUES ((select id from band where id = %s), (select id from artist where pers_nr = %s))"
			cursor.execute(sql, (band_id, artist_nr,))
		db.commit()

	except:
		db.rollback()
		print 'Något gick fel!'

	hang_up_on_database()
	redirect('/book_band')

@route('/ajax_new_artist/<nr>', method="POST")
def ajax_new_artist(nr):
	cursor = call_database()
	get_num = int(nr) -1
	pers_nr = request.forms.get('pers_nr')
	sql = "SELECT * FROM artist WHERE Pers_nr = %s"
	cursor.execute(sql, (pers_nr,))
	result = (cursor.fetchall())
	artist_info = {}
	if len(result) == 1:
		artist_info = {}
		artist_info['status'] = 'Finns'
		artist_info['id'] = result[0][0]
		artist_info['namn'] = result[0][1]
		artist_info['tele'] = result[0][2]
		artist_info['viktig_info'] = result[0][3]
		artist_info['kul_info'] = result[0][4]
		artist_info['pers_nr'] = result[0][5]

	else:
		artist_info['status'] = 'Finns_inte'

	hang_up_on_database()
	return json.JSONEncoder().encode(artist_info)



@route('/staff')
def staff():
	cursor = call_database()
	sql = "SELECT * FROM personal"
	cursor.execute(sql)
	personal = cursor.fetchall()
	hang_up_on_database()
	return template('staff', pageTitle='Hantera personal', personal = personal)

@route('/do_add_staff', method="POST")
def staff():
	cursor = call_database()
	global db
	namn = request.forms.get('staff-name')
	personnummer = request.forms.get('staff-pernr')
	tele = request.forms.get('staff-tele')
	mejl = request.forms.get('staff-mejl')
	erfarenhet = request.forms.get('staff-merits')
	sql = "INSERT INTO Personal(Pers_nr, mejl, tele, namn, erfarenhet) VALUES(%s, %s, %s, %s, %s)"
	cursor.execute(sql, (personnummer, mejl, tele, namn, erfarenhet))
	db.commit()
	hang_up_on_database()
	redirect('/staff')

@route('/remove_staff/<pers_nr>')
def remove_staff(pers_nr):
	cursor = call_database()
	global db
	sql="DELETE FROM personal WHERE Pers_nr = %s"
	cursor.execute(sql, (int(pers_nr),))
	db.commit()
	hang_up_on_database()
	redirect('/staff')

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
	cursor = call_database()

	sql="SELECT J4.antal_artister, J1.namn \
			FROM (SELECT J3.band_id, COUNT(J3.band_id) AS antal_artister \
				FROM (SELECT artist.Namn, spelar_i.band_id \
					FROM spelar_i JOIN artist ON artist.id = spelar_i.Artist_id) as J3 \
				group by J3.band_id) as J4 \
			JOIN (SELECT band.* \
				FROM band LEFT JOIN kontakt \
				ON kontakt.Band_id = band.ID \
				WHERE kontakt.Pers_nr Is Null) as J1 \
			ON J4.band_id = J1.id"

	cursor.execute(sql)
	result = cursor.fetchall()
	hang_up_on_database()

	sql = "SELECT J10.Pers_nr, COUNT(DISTINCT J10.Artist_id) FROM( \
		select J8.* from (SELECT Artist_id, J5.Pers_nr FROM \
		(SELECT kontakt.band_id, J1.Pers_nr FROM kontakt \
		LEFT JOIN (SELECT personal.Pers_nr FROM personal LEFT JOIN sakerhetsansvarig ON personal.Pers_nr = sakerhetsansvarig.Pers_nr WHERE sakerhetsansvarig.Pers_nr Is Null) as J1 ON kontakt.Pers_nr = J1.Pers_nr) as J5 \
		JOIN spelar_i \
		ON J5.band_id = spelar_i.Band_id) as J8 \
		union \
		select J9.id, null from \
		(SELECT J4.id FROM \
		(SELECT artist.id, spelar_i.band_id \
		FROM spelar_i \
		JOIN artist \
		ON artist.id = spelar_i.Artist_id) as J4 \
		JOIN ( \
		SELECT band.id \
		FROM band LEFT JOIN kontakt \
		ON kontakt.Band_id = band.ID \
		WHERE kontakt.Pers_nr Is Null) as J6 \
		ON J6.id = J4.band_id) as J9) as J10 \
		WHERE J10.Pers_nr IS NOT NULL \
		GROUP BY J10.Pers_nr"




	return template('contact', pageTitle='Kontaktperson', bands = result)




'''********Övriga Routes********'''

@error(404)
def error404(error):
    return template('pagenotfound', pageTitle = 'Fel!' )

@route('/static/<filename:path>')
def server_static(filename):
    return static_file(filename, root="static")


run(host='localhost', port = 8080)
