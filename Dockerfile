# Base Image
FROM python:3.11-slim

# Arbeitsverzeichnis setzen
WORKDIR /app

# Abhängigkeiten installieren
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Code kopieren
COPY . .

# Port exposen
EXPOSE 8020

# Entrypoint
RUN chmod +x entrypoint.sh
CMD ["./entrypoint.sh"]