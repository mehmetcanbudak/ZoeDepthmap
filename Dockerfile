FROM python:3.10

WORKDIR ./app

RUN apt-get update && \
    apt-get install -y libjpeg-dev && \
    apt-get clean

COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

EXPOSE 8051

CMD ['uvicorn', "api:app", '0.0.0.0', '8051']