from json import loads
import subprocess
import getopt
import sys

ret = loads(subprocess.check_output("curl http://localhost:8080/api/common/nodes | python -mjson.tool", shell=True))

for node in ret:
    if node.get("type") == "compute":
        nodeId = node.get("id")
        cmd = "curl http://localhost:8080/api/common/nodes/" + nodeId + "/catalogs/bmc"
        ret = loads(subprocess.check_output(cmd, shell=True))
        bmcIP = ret.get("data")["IP Address"]
        cmd = "curl -X PUT -H \"Content-Type: application/json\" --data " +\
                "\"{\\\"service\\\": \\\"ipmi-obm-service\\\",\\\"config\\\":{\\\"host\\\":\\\"" + bmcIP +\
                "\\\",\\\"user\\\":\\\"admin\\\",\\\"password\\\":\\\"admin\\\"},\\\"nodeId\\\":\\\"" + nodeId +\
                "\\\"}\" http://localhost:8080/api/2.0/obms"
        print cmd
        subprocess.call(cmd, shell=True)

