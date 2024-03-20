#!/bin/bash


apt-get update
apt-get install -y python3-pip


cat << EOF > /home/vagrant/client.py
import socket


def client_program():
    host = socket.gethostname() 
    port = 6340  # número de puerto del servidor

    client_socket = socket.socket()  # 
    client_socket.connect((host,port))  # conectar al servidor

    message = input(" -> ")  # tomar entrada del usuario

    while message.lower().strip() != 'bye':
        client_socket.send(message.encode())  # enviar mensaje
        data = client_socket.recv(1024).decode()  # recibir respuesta del servidor

        print('Received from server: ' + data)  # mostrar en la terminal

        message = input(" -> ")  # take input

    client_socket.close()  


if __name__ == '__main__':
    client_program()
EOF

# Cambiar los permisos del archivo para que sea ejecutable
chmod +x /home/vagrant/client.py
