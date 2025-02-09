FROM python:3.9-slim

# Install Terraform
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://releases.hashicorp.com/terraform/1.3.0/terraform_1.3.0_linux_amd64.zip && \
    unzip terraform_1.3.0_linux_amd64.zip -d /usr/local/bin && \
    rm terraform_1.3.0_linux_amd64.zip

# Install AWS CLI
RUN pip install awscli

# Set working directory
WORKDIR /app

# Copy runner scripts

COPY requirements.txt .

# Install Python dependencies
RUN pip install -r requirements.txt

# Default command
CMD ["python", "runner.py"]
