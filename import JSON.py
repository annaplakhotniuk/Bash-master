import json
import subprocess

input_list = json.loads(input(f"Please enter SG list: "))

list_true = []
list_false = []
for sg in input_list:
    if sg["priority"] == True:
        addres = sg["address"]
        host = addres.replace("https://", "").replace(":443", "")
        list_true.append(host)
        print(f"data {host}")
    else:
        addres = sg["address"]
        host = addres.replace("https://", "").replace(":443", "")
        list_false.append(host)
print(f"Input list is: {len(input_list)} \nSG with values 'True' is: {len(list_true)} \nSG with values 'False'is: {len(list_false)} ")

with open(r'/home/user/Desktop/list','w') as fp:
    for item in list_true:
        # write each item on a new line
        fp.write("%s\n" % item)
    print('Done')

while True:
    massege = input("What SG you want block with using 'IPTABLES' f/t/r/e: ")
    if massege == "f":
        subprocess.run(['bash', '/home/user/Desktop/block_SG.sh'] + list_false)
        break
    if massege == "t":
        subprocess.run(['bash', '/home/user/Desktop/block_SG.sh'] + list_true)
        break
    if massege == "r":
        subprocess.run(['bash', '/home/user/Desktop/iptables_restart_all_rulles.sh'])
        break
    if massege == "e":
        break
    else:
        continue
