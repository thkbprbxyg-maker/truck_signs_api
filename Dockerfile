FROM python:3.8

RUN apt-get update && apt-get install -y netcat-traditional && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

EXPOSE 8020

RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]