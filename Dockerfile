FROM python:3.11-slim

WORKDIR /app


RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Command with password hash env
CMD sh -c "jupyter lab \
    --ip=0.0.0.0 --port=8888 --no-browser --allow-root \
    --NotebookApp.token='' \
    --NotebookApp.password=''"

