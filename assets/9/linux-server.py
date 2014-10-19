#!/usr/bin/python
import requests
import json
import socket               # Import socket module


# UserName and Password Authentication
def authenticate(username, password):
	# Send POST Request to server
	url = "http://localhost:3000/api/auth/login"
	data = {'username': username, 'password': password}
	headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
	r = requests.post(url, data=json.dumps(data), headers=headers)

	# Reyurn Success or failure based on response
	if r.status_code == 200:
		return 1
	else:
		return 0

s = socket.socket()         # Create a socket object
host = socket.gethostname() # Get local machine name
port = 44448                # Reserve a port for your service.
s.bind((host, port))        # Bind to the port

s.listen(5)                 # Now wait for client connection.
while True:
	c, addr = s.accept()     # Establish connection with client.
	print 'Got connection from', addr
	json_data = c.recv(1024)
	data = json.loads(json_data)
	username = data["username"]
	password = data["password"]
	print authenticate(username,password)
	c.close()                # Close the connection
