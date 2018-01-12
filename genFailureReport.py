#!/usr/bin/python
import psycopg2,sys,re

runid=str(sys.argv[1])
data={}
idstr=""
#Connect to an exiting DB
try:
        conn = psycopg2.connect("dbname='zarms50' user='postgres'")
except:
        print "Unable to connect to postgre"

#Open a cursor to perform database operations
cur = conn.cursor()

#Get scriptids & result count
cur.execute("select scriptid,count(scriptid) from testrun_results where runid="+runid+" and result='f' group by scriptid")

for read in cur:
        if read[0] in data:
                data[read[0]].append(read[1])
        else:
                idstr +=str(read[0])+","
                data[read[0]]=[]
                data[read[0]].append(read[1])


#Get script name
cur.execute("select scriptid,script from scripts where scriptid in ("+idstr[:-1]+")")

for read in cur:
        scriptmp=re.sub(r'^.*test_run.pl\s+','',read[1])
        script=re.sub(r'\s+--config.*$','',scriptmp)
        data[read[0]].append(script)

cur.execute("select scriptid,hostip from script_host_map,hosts where hosts.hostid=script_host_map.hostid and scriptid in ("+idstr[:-1]+")")

for read in cur:
        data[read[0]].append(read[1])

for key, value in data.iteritems():
        print value[1]+","+value[2]+","+str(value[0])
