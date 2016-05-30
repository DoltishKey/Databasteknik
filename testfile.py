# *-* coding:utf-8 *-*
import bottle
from bottle import route, get, post, run, template, error, static_file, request, redirect, abort, response, app
import MySQLdb
import json
from operator import itemgetter
from time import time, strftime, strptime
from datetime import datetime, timedelta
from operator import itemgetter

db = None
cursor = None

def testloop():
	for i in xrange(0, 60, 10):
		print i




def call_database():
	global db
	global cursor
	db = MySQLdb.connect(host="195.178.232.16", port=3306, user="af6307", passwd="Hejhejhej1", db="af6307");
	cursor = db.cursor()
	return cursor

def hang_up_on_database():
    global db
    db = db.close()


def testingTime():
	vilken_dag="Dag 1"
	start_tid= "20:30"
	slut_tid_timmar="4"
	slut_tid_minuter="30"

	slut_tid_timmar=int(slut_tid_timmar)
	slut_tid_minuter=int(slut_tid_minuter)

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

	print start_tid
	#start_tid=datetime.strptime(start_tid, "").time()
	#print start_tid
	start_tid=datetime.strptime(start_tid, '%Y-%m-%d %H:%M')


	print start_tid

	d=datetime.combine(datetime.date(the_day), datetime.time(start_tid))
	print d

	d=d+timedelta(hours=slut_tid_timmar, minutes=slut_tid_minuter)
	print d

	#show_start=datetime.strptime(the_day, )


def testingcase():
	cursor=call_database()
	sql_spelschema="SELECT band.id, band.namn, band.stil, band.ursprungland, spelar.start_tid,\
		spelar.slut_tid, scen.namn FROM spelar\
			JOIN scen\
				ON scen.id=spelar.scen_id\
			JOIN band\
				ON band.id=spelar.band_id"
	cursor.execute(sql_spelschema)
	spelschema=cursor.fetchall()
	'''
	for each in spelschema:
		print each[4]
		print each[4] + timedelta(hours=9, minutes=30)
		'''
	day1=[]
	day2=[]
	day3=[]
	for spelning in spelschema:
		if spelning[4].strftime("%Y-%m-%d")=='2016-06-10':
			day1.append(spelning)
		elif spelning[4].strftime("%Y-%m-%d")=='2016-06-11':
			day2.append(spelning)
		elif spelning[4].strftime("%Y-%m-%d")=='2016-06-12':
			day3.append(spelning)

	print sorted(day1, key=itemgetter(4))
	print sorted(day2, key=itemgetter(4))
	print sorted(day3, key=itemgetter(4))

testloop()
