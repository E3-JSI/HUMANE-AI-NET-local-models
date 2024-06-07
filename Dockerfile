# Start from the Prolog image (Debian)
FROM swipl:9.2.5

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies required to build Python
RUN apt-get update && \
    apt-get install -y \
    libssl-dev \
    openssl \
    libffi-dev \
    build-essential \
    wget \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/python

# Download and extract the Python source
RUN wget https://www.python.org/ftp/python/3.10.4/Python-3.10.4.tgz \
    && tar xzf Python-3.10.4.tgz \
    && rm Python-3.10.4.tgz

# Build and install Python
RUN cd Python-3.10.4 \
    && ./configure --prefix=/opt/python-3.10 \
    && make -j 8 \
    && make altinstall

# Set up symlinks to make this python version the default
RUN ln -s /opt/python-3.10/bin/python3.10 /usr/local/bin/python3 \
    && ln -s /opt/python-3.10/bin/pip3.10 /usr/local/bin/pip3

# Set environment variables to prioritize our custom Python installation
ENV PATH="/opt/python-3.10/bin:${PATH}"

# Output Prolog version
RUN swipl --version

# Set the current working directory to /code
WORKDIR /code

# Create a virtual environment
#RUN python3 -m venv venv
#ENV PATH="/code/venv/bin:$PATH"

# Copy the file with the requirements to the /code directory
COPY ./requirements.txt /code/requirements.txt

# Install the package dependencies in the requirements file using the virtual environment
RUN pip3 install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the ./app directory inside the /code directory
COPY ./app /code/app

# Copy the .env file inside the /code directory (if it exists)
COPY ./.env /code/.env

# Set the command to run the uvicorn server
CMD ["uvicorn", "app.main:app", "--port", "4000", "--host", "0.0.0.0"]
