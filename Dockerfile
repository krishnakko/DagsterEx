FROM python:3.9-slim

RUN mkdir -p /opt/dagster/dagster_home /opt/dagster/app
# Change working directory
WORKDIR /usr/src/app
ENV DAGSTER_HOME=/usr/src/app

# Install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip install notebook

# Copy source code
COPY docker/dagster.yaml .
COPY workspace.yaml .
COPY . ./.

CMD ["dagit", "-w", "workspace.yaml", "-h", "0.0.0.0", "-p", "3000"]