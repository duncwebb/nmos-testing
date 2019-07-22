# Use an official minimal Alpine based Python image as a base image
FROM python:3.7-alpine

# Install prerequisites required to build the Python packages in requirements.txt
RUN apk add --no-cache g++ make pkgconfig freetype freetype-dev libpng libpng-dev libffi-dev openssl-dev libjpeg-turbo-dev git

# Set the working directory to /test_system
WORKDIR /test_system

# Copy the current directory contents into the container at /test_system
COPY . /test_system

# Install any needed packages specified in requirements.txt
RUN pip3 install --upgrade pip
RUN pip install -r requirements.txt

# Make port available to the world outside this container
EXPOSE 5000

# Run cmd when the container launches
CMD ["python3", "/test_system/nmos-test.py"]
