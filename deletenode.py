from json import loads
import subprocess
import getopt
import sys


ret = loads(subprocess.check_output("curl http://localhost:8080/api/1.1/nodes | python -mjson.tool", shell=True))

i = 0
COUNT = int(value)
for node in ret:
    if node.get("type") == 'compute':
        if i < COUNT:
            i = i + 1
            cmd = "curl -X DELETE http://localhost:8080/api/1.1/nodes/" + node.get("id") + "/workflows/active"
            subprocess.call(cmd, shell=True);
            cmd = "curl -X DELETE http://localhost:8080/api/1.1/nodes/" + node.get("id")
            subprocess.call(cmd, shell=True);

	# if name == "--state":
		# for node in ret:
			# if node.get("identifiers") != None:
				# cmd = "curl http://localhost:8080/api/common/nodes/" + node.get("id") + "/workflows/active | python -mjson.tool"
				# try:
					# wf = loads(subprocess.check_output(cmd, shell=True));
					# tasks = wf.get("tasks")
					# print "------------------"
					# print node.get("id")
					# for key, task in tasks.items():
						# if task["state"] == "succeeded":
							# print task["injectableName"] 
				# except subprocess.CalledProcessError as e:
					# print e

	# if name == "--del":
		# for node in ret:
			# if node.get("identifiers") != None:
				# cmd = "curl http://localhost:8080/api/common/nodes/" + node.get("id") + "/workflows/active | python -mjson.tool"
				# try:
					# wf = loads(subprocess.check_output(cmd, shell=True));
					# cmd = "curl -X DELETE http://localhost:8080/api/common/nodes/" + node.get("id") + "/workflows/active"	
					# subprocess.call(cmd, shell=True);
				# except subprocess.CalledProcessError as e:
					# print e

