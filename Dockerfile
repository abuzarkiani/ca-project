# The base image
FROM ubuntu:18.04

# Install python and pip for Ubuntnu
RUN apt-get update -y
RUN apt-get install -y python-pip
RUN pip install requests
# Install Python modules needed by the Python app
COPY requirements.txt /home/ubuntu/ca-project/
RUN pip install --no-cache-dir -r /home/ubuntu/ca-project/requirements.txt

# Copy files required for the app to run
COPY . /home/ubuntu/ca-project/

# Declare the port number the container should expose
EXPOSE 5000

# Run the application
CMD ["python", "/home/ubuntu/ca-project/run.py"]
