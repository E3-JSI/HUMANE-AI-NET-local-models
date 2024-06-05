# Start from the Prolog image (Debian)
FROM swipl:9.2.5

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Update the repository and install Python, pip, and venv
# TODO: Use python 3.10
RUN apt-get update && \
    apt-get install -y python3-pip python3-dev python3-venv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Output Prolog version
RUN swipl --version

# Set the current working directory to /code
WORKDIR /code

# Create a virtual environment
RUN python3 -m venv venv
ENV PATH="/code/venv/bin:$PATH"

# Copy the file with the requirements to the /code directory
COPY ./requirements.txt /code/requirements.txt

# Install the package dependencies in the requirements file using the virtual environment
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the ./app directory inside the /code directory
COPY ./app /code/app

# Copy the .env file inside the /code directory (if it exists)
COPY ./.env /code/.env

# Set the command to run the uvicorn server
CMD ["uvicorn", "app.main:app", "--port", "4000", "--host", "0.0.0.0"]
