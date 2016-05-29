# *-* coding:utf-8 *-*
import bottle
from bottle import route, get, post, run, template, error, static_file, request, redirect, abort, response, app
import MySQLdb
import json
from time import time, strptime
from datetime import datetime, timedelta, time
from operator import itemgetter

db = None
cursor = None


'''*******Callable functions*******'''
def call_database():
	global db
	global cursor
	db = MySQLdb.connect(host="195.178.232.16", port=3306, user="af6307", passwd="Hejhejhej1", db="af6307");
	cursor = db.cursor()
	return cursor

def hang_up_on_database():
    global db
    db = db.close()

def get_spelschema(cursor):
	sql_spelschema="SELECT band.id, band.namn, band.stil, band.ursprungland,\
					DATE_FORMAT(spelar.start_tid, '%Y-%m-%d') start_datum,\
					DATE_FORMAT(spelar.slut_tid, '%Y-%m-%d') slut_datum,\
					DATE_FORMAT(spelar.start_tid, '%H:%i') start_tid,\
					DATE_FORMAT(spelar.slut_tid, '%H:%i') slut_tid,\
					scen.namn, scen.id  FROM spelar\
					JOIN scen\
						ON scen.id=spelar.scen_id\
					JOIN band\
						ON band.id=spelar.band_id"
	cursor.execute(sql_spelschema)
	return cursor.fetchall()

def get_bands(cursor):
	sql_band="SELECT * FROM band"
	cursor.execute(sql_band)
	return cursor.fetchall()

def get_scener(cursor):
	sql_scen="SELECT * FROM scen"
	cursor.execute(sql_scen)
	return cursor.fetchall()

def get_bandinfo(cursor, bandid):
	sql_bandinfo="SELECT band.namn, band.stil, band.ursprungland FROM band WHERE band.id='%d'" %(bandid)
	cursor.execute(sql_bandinfo)
	return cursor.fetchall()

def get_artists(cursor, bandid):
	sql_artister="SELECT artist.* FROM artist\
					JOIN spelar_i\
						ON artist.id=spelar_i.artist_id\
					WHERE spelar_i.band_id='%d'" %(bandid)
	cursor.execute(sql_artister)
	return cursor.fetchall()

def get_show_info(cursor, band_id):
	sql_show_info="SELECT band.id, band.namn, band.stil, band.ursprungland,\
	 				DATE_FORMAT(spelar.start_tid, '%%Y-%%m-%%d %%H:%%i') as start_tid,\
					DATE_FORMAT(spelar.slut_tid, '%%Y-%%m-%%d %%H:%%i') as slut_tid,\
					scen.namn, scen.id FROM spelar\
					JOIN scen\
						ON scen.id=spelar.scen_id\
					JOIN band\
						ON band.id=spelar.band_id\
					WHERE band.id=%s"
	cursor.execute(sql_show_info, (band_id,))
	return cursor.fetchall()


'''********Routes******'''
@route('/')
def index():
	cursor=call_database()
	spelschema=get_spelschema(cursor)
	hang_up_on_database()

	day1=[]
	day2=[]
	day3=[]
	for spelning in spelschema:
		if spelning[4]=='2016-06-10':
			day1.append(spelning)
		elif spelning[4]=='2016-06-11':
			day2.append(spelning)
		elif spelning[4]=='2016-06-12':
			day3.append(spelning)

	day1=sorted(day1, key=itemgetter(6))
	day2=sorted(day2, key=itemgetter(6))
	day3=sorted(day3, key=itemgetter(6))
	return template('index', pageTitle='Start', day1=day1, day2=day2, day3=day3)


@route('/bandinfo/<nr>')
def bandinfo(nr):
	nr=int(nr)

	cursor=call_database()
	bandinfo=get_bandinfo(cursor, nr)
	artister=get_artists(cursor, nr)
	hang_up_on_database()
	return template('bandinfo', pageTitle="bandinfo", bandinfo=bandinfo, artister=artister)


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
	cursor = call_database()
	bands = get_bands(cursor)
	scener = get_scener(cursor)
	spelschema = get_spelschema(cursor)
	hang_up_on_database()

	day1=[]
	day2=[]
	day3=[]
	for spelning in spelschema:
		if spelning[4]=='2016-06-10':
			day1.append(spelning)
		elif spelning[4]=='2016-06-11':
			day2.append(spelning)
		elif spelning[4]=='2016-06-12':
			day3.append(spelning)

	day1=sorted(day1, key=itemgetter(6))
	day2=sorted(day2, key=itemgetter(6))
	day3=sorted(day3, key=itemgetter(6))
	return template('add_show', pageTitle='Lägg till spelning', bands=bands, scener=scener, day1=day1, day2=day2, day3=day3)


@route('/add_play', method="POST")
def new_show_post():
		vilket_band=request.forms.get('band_name')
		vilken_scen=request.forms.get('stage_name')
		vilken_dag=request.forms.get('play_day')
		start_tid_timmar=request.forms.get('start_tid_timmar')
		start_tid_minuter=request.forms.get('start_tid_minuter')
		slut_tid_timmar=request.forms.get('slut_tid_timmar')
		slut_tid_minuter=request.forms.get('slut_tid_minuter')

		start_tid=str(start_tid_timmar)+":"+str(start_tid_minuter)

		the_day=0
		if vilken_dag== "Dag 1":
			the_day='2016-06-10'
		elif vilken_dag== "Dag 2":
			the_day='2016-06-11'
		elif vilken_dag== "Dag 3":
			the_day= '2016-06-12'
		else:
			redirect('/add_play')

		the_day=datetime.strptime(the_day, '%Y-%m-%d')
		start_tid=datetime.strptime(start_tid, '%H:%M')
		show_start=datetime.combine(datetime.date(the_day), datetime.time(start_tid))

		if slut_tid_timmar=="Timmar":
			slut_tid_timmar="0"
		slut_tid_timmar=int(slut_tid_timmar)

		if slut_tid_minuter=="Minuter":
			slut_tid_minuter="00"
		slut_tid_minuter=int(slut_tid_minuter)
		show_end=show_start + timedelta(hours=slut_tid_timmar, minutes=slut_tid_minuter)

		cursor=call_database()
		spelschema=get_spelschema(cursor)

		sql_band_id="SELECT id FROM band WHERE namn=%s"
		cursor.execute(sql_band_id, (vilket_band,))
		band_id=cursor.fetchall()

		sql_scen_id="SELECT id FROM scen WHERE namn=%s"
		cursor.execute(sql_scen_id, (vilken_scen,))
		scen_id=cursor.fetchall()

		sql_check_show="SELECT * FROM spelar\
						WHERE scen_id=%s AND (%s BETWEEN Start_tid AND Slut_tid OR %s BETWEEN Start_tid AND Slut_tid)\
						OR\
						scen_id=%s AND (Start_tid BETWEEN %s AND %s OR Slut_tid BETWEEN %s AND %s)"
		cursor.execute(sql_check_show, (scen_id, show_start, show_end, scen_id, show_start, show_end, show_start, show_end,))
		checked_show=cursor.rowcount

		if checked_show>0:
			return "Kolla schemat igen! Finns redan en spelning på den tiden"

		sql="INSERT INTO spelar(Start_tid, Slut_tid, Scen_id, Band_id) VALUES(%s, %s, %s, %s)"
		cursor.execute(sql, (show_start, show_end, scen_id, band_id,))
		db.commit()
		hang_up_on_database()
		redirect('/add_play')


@route('/edith_play')
def edit__what_show():
	cursor=call_database()
	spelschema=get_spelschema(cursor)
	hang_up_on_database()

	day1=[]
	day2=[]
	day3=[]
	for spelning in spelschema:
		if spelning[4]=='2016-06-10':
			day1.append(spelning)
		elif spelning[4]=='2016-06-11':
			day2.append(spelning)
		elif spelning[4]=='2016-06-12':
			day3.append(spelning)

	day1=sorted(day1, key=itemgetter(6))
	day2=sorted(day2, key=itemgetter(6))
	day3=sorted(day3, key=itemgetter(6))
	return template('change_show', pageTitle='Spelning', day1=day1, day2=day2, day3=day3)


@route('/edith_play/<nr>')
def edit_show(nr):
	nr=int(nr)
	cursor=call_database()
	show_info=get_show_info(cursor, nr)
	scener=get_scener(cursor)
	spelschema=get_spelschema(cursor)
	hang_up_on_database()

	day1=[]
	day2=[]
	day3=[]
	for spelning in spelschema:
		if spelning[4]=='2016-06-10':
			day1.append(spelning)
		elif spelning[4]=='2016-06-11':
			day2.append(spelning)
		elif spelning[4]=='2016-06-12':
			day3.append(spelning)

	day1=sorted(day1, key=itemgetter(6))
	day2=sorted(day2, key=itemgetter(6))
	day3=sorted(day3, key=itemgetter(6))
	return template('which_show', pageTitle="", show_info=show_info, scener=scener, day1=day1, day2=day2, day3=day3)


@route('/edith_play/<band>/<scen>', method="POST")
def update_shows(band, scen):
	band_id=int(band)
	scen=int(scen)
	vilken_scen=request.forms.get('stage_name')
	vilken_dag=request.forms.get('play_day')
	start_tid_timmar=request.forms.get('start_tid_timmar')
	start_tid_minuter=request.forms.get('start_tid_minuter')
	slut_tid_timmar=request.forms.get('slut_tid_timmar')
	slut_tid_minuter=request.forms.get('slut_tid_minuter')
	start_tid=str(start_tid_timmar)+":"+str(start_tid_minuter)

	the_day=0
	if vilken_dag== "Dag 1":
		the_day='2016-06-10'
	elif vilken_dag== "Dag 2":
		the_day='2016-06-11'
	elif vilken_dag== "Dag 3":
		the_day= '2016-06-12'
	else:
		redirect('/edith_play')

	the_day=datetime.strptime(the_day, '%Y-%m-%d')
	start_tid=datetime.strptime(start_tid, '%H:%M')
	show_start=datetime.combine(datetime.date(the_day), datetime.time(start_tid))

	if slut_tid_timmar=="Timmar":
		slut_tid_timmar="0"
	slut_tid_timmar=int(slut_tid_timmar)

	if slut_tid_minuter=="Minuter":
		slut_tid_minuter="00"
	slut_tid_minuter=int(slut_tid_minuter)

	show_end=show_start + timedelta(hours=slut_tid_timmar, minutes=slut_tid_minuter)

	cursor=call_database()
	sql_scen_id="SELECT id FROM scen WHERE namn=%s"
	cursor.execute(sql_scen_id, (vilken_scen,))
	scen_id=cursor.fetchall()

	sql_check_show="SELECT * FROM spelar\
					where scen_id=%s AND band_id!=%s AND (%s BETWEEN Start_tid AND Slut_tid OR %s BETWEEN Start_tid AND Slut_tid)\
					OR\
					scen_id=%s AND band_id!=%s AND (start_tid BETWEEN %s AND %s OR Slut_tid BETWEEN %s AND %s)"
	cursor.execute(sql_check_show, (scen_id, band_id, show_start, show_end, scen_id, band_id, show_start, show_end, show_start, show_end,))
	checked_show=cursor.rowcount

	if checked_show>0:
		hang_up_on_database()
		return "Kolla schemat igen! Finns redan en spelning på den tiden"

	sql_changed="UPDATE spelar SET Start_tid=%s, Slut_tid=%s, Scen_id=%s WHERE spelar.Band_id=%s AND spelar.Scen_id=%s"
	cursor.execute(sql_changed, (show_start, show_end, scen_id, band_id, scen,))
	db.commit()
	hang_up_on_database()
	redirect('/edith_play')

@route('/edith_play/<band>/<scen>/<time>/del', method="POST")
def delete_show(band, scen, time):
	cursor=call_database()
	band=int(band)
	scen=int(scen)
	time=datetime.strptime(time, "%Y-%m-%d %H:%M")

	sql_del_show="DELETE FROM spelar WHERE spelar.Scen_id=%s AND spelar.Band_id=%s AND spelar.Start_tid=%s"
	cursor.execute(sql_del_show,(scen, band, time))
	db.commit()
	hang_up_on_database()
	redirect('/edith_play')

@route('/contact')
def contact():
	cursor = call_database()

	sql="SELECT J4.antal_artister, J1.namn, J1.id \
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

	sql = "SELECT J10.Pers_nr, J10.Namn, COUNT(J10.Artist_id) FROM( \
	SELECT Artist_id, J5.Pers_nr, J5.Namn FROM \
	(SELECT kontakt.band_id, J1.Pers_nr, J1.Namn FROM kontakt \
	RIGHT OUTER JOIN (SELECT personal.Pers_nr, personal.Namn FROM personal \
	LEFT JOIN sakerhetsansvarig ON personal.Pers_nr = sakerhetsansvarig.Pers_nr \
	WHERE sakerhetsansvarig.Pers_nr Is Null) as J1 ON kontakt.Pers_nr = J1.Pers_nr) as J5 \
	LEFT JOIN spelar_i \
	ON J5.band_id = spelar_i.Band_id) as J10 \
	GROUP BY J10.Pers_nr"
	cursor.execute(sql)
	candidates = cursor.fetchall()


	return template('contact', pageTitle='Kontaktperson', bands = result, candidates=candidates)

@route('/do_assign_contact/<band_id>', method="POST")
def do_assign_contact(band_id):
	cursor = call_database()
	global db
	kontaktperson=int(request.forms.get('selected_candidate'))
	band_id = int(band_id)
	sql="INSERT INTO kontakt(Pers_nr, Band_id) VALUES( (SELECT Pers_nr FROM personal WHERE Pers_nr = %s), (SELECT id FROM band WHERE id = %s) )"
	cursor.execute(sql, (kontaktperson, band_id,))
	db.commit()
	hang_up_on_database()
	redirect('/contact')

@route('/contact_by_band')
def contact_by_band():
	cursor = call_database()
	sql="SELECT J1.namn, J1.Pers_nr, J1.band_id, J2.bandnamn, J2.antal_artister, J1.tele \
			FROM (SELECT personal.namn, personal.Pers_nr, kontakt.band_id, personal.tele \
			 	FROM kontakt \
				JOIN personal \
				ON kontakt.Pers_nr = personal.Pers_nr) as J1 \
			JOIN \
				(SELECT band.id, band.namn as bandnamn, COUNT(artist.namn) AS antal_artister \
				FROM spelar_i \
					JOIN band \
					ON spelar_i.band_id = band.id \
					JOIN artist \
					ON artist.id = spelar_i.artist_id \
				GROUP BY band.id) as J2 \
			ON J1.band_id = J2.id"
	cursor.execute(sql)
	band_info = cursor.fetchall()

	sql = "SELECT J10.Pers_nr, J10.Namn, COUNT(J10.Artist_id) FROM( \
	SELECT Artist_id, J5.Pers_nr, J5.Namn FROM \
	(SELECT kontakt.band_id, J1.Pers_nr, J1.Namn FROM kontakt \
	RIGHT OUTER JOIN (SELECT personal.Pers_nr, personal.Namn FROM personal \
	LEFT JOIN sakerhetsansvarig ON personal.Pers_nr = sakerhetsansvarig.Pers_nr \
	WHERE sakerhetsansvarig.Pers_nr Is Null) as J1 ON kontakt.Pers_nr = J1.Pers_nr) as J5 \
	LEFT JOIN spelar_i \
	ON J5.band_id = spelar_i.Band_id) as J10 \
	GROUP BY J10.Pers_nr"
	cursor.execute(sql)
	candidates = cursor.fetchall()

	hang_up_on_database()
	return template('contact_by_band', pageTitle='Kontaktperson för band', kontakt_info = band_info, candidates = candidates)

@route('/update_contact/<band_id>', method="POST")
def update_contact(band_id):
	cursor = call_database()
	global db
	band_id = int(band_id)
	new_contact= int(request.forms.get('new_contact'))
	sql="UPDATE kontakt SET Pers_nr = %s WHERE Band_id = %s"
	cursor.execute(sql, (new_contact, band_id,))
	db.commit()
	hang_up_on_database()
	redirect('/contact_by_band')

@route('/contact_staff')
def contact_staff():
	cursor = call_database()
	sql = "SELECT band.id, band.Namn, COUNT(artist.Namn), kontakt.Pers_nr \
	FROM ((spelar_i JOIN band ON Band_id = band.id) \
	JOIN artist ON Artist_id = artist.id) \
		JOIN kontakt \
		ON kontakt.band_id = band.id \
	GROUP BY band.id"
	cursor.execute(sql)
	bands = cursor.fetchall()

	sql = "SELECT personal.namn , kontakt.Pers_nr, COUNT(artist.Namn) \
	FROM((\
				(spelar_i JOIN band ON Band_id = band.id) \
			JOIN artist ON Artist_id = artist.id) \
		JOIN kontakt ON kontakt.band_id = band.id) \
	JOIN personal ON personal.Pers_nr = kontakt.Pers_nr \
	GROUP BY kontakt.Pers_nr"
	cursor.execute(sql)
	staff = cursor.fetchall()

	hang_up_on_database()
	return template('contact_staff', pageTitle="Kontaktpersoner", staff = staff, bands=bands)



@route('/remove_contact/<band_id>', method="POST")
def remove_contact(band_id):
	cursor = call_database()
	global db
	band_id = int(band_id)
	sql = "DELETE FROM kontakt WHERE band_id = %s"
	cursor.execute(sql, (band_id,))
	db.commit()
	hang_up_on_database()
	redirect('/contact_by_band')


'''********Övriga Routes********'''

@error(404)
def error404(error):
	return template('pagenotfound', pageTitle = 'Fel!' )

@route('/static/<filename:path>')
def server_static(filename):
	return static_file(filename, root="static")


run(host='localhost', port = 8080)
