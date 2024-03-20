#!/bin/bash
apt-get update
apt-get install -y python3-pip

# Copiar el código del servidor a la máquina virtual
import socket

cat << EOF > /home/vagrant/server.py
import socket

def server_program():
   
    host = socket.gethostname()
    port = 6340 

    server_socket = socket.socket()  # get instance
   
    server_socket.bind((host, port))  # bind host address and port together

    
    server_socket.listen(2)
    print("Server is listening on {}:{}".format(host, port)) 
    conn, address = server_socket.accept()  # accept new connection
    print("Connection from: " + str(address))
    while True:
        
        data = conn.recv(1024).decode()
        if not data:
           
            break
        print("from connected user: " + str(data))
        data = input(' -> ')
        conn.send(data.encode())  # send data to the client

    conn.close()  # close the connection


if __name__ == '__main__':
    server_program()

EOF

echo "Archivo server.py creado correctamente en /home/vagrant/"
chmod +x /home/vagrant/server.py
