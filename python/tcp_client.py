import socket

# Define the server's address and port
SERVER_ADDRESS = ('169.254.1.200', 57345)

# Create a TCP socket
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

try:
    # Connect to the server
    client_socket.connect(SERVER_ADDRESS)
    print(f"Connected to {SERVER_ADDRESS}")

    # Send data to the server
    message = "Hello, server!"
    client_socket.sendall(message.encode())
    print(f"Sent: {message}")

    # Receive data from the server
    data = client_socket.recv(1024)
    print(f"Received: {data.decode()}")

except ConnectionRefusedError:
    print(f"Connection refused to {SERVER_ADDRESS}. Ensure the server is running.")
except Exception as e:
    print(f"An error occurred: {e}")
finally:
    # Close the connection
    client_socket.close()
    print("Connection closed.")