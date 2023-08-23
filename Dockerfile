FROM python:3.9.17-slim

RUN apt-get update && \
    apt-get install -y git

WORKDIR /app

RUN git clone https://github.com/difli/astra-load.git /app

RUN pip install -r /app/requirements.txt

WORKDIR /app

CMD ["python" ,"main.py"]

# docker build -f ./Dockerfile -t astra-load .
# docker tag astra-load dieterfl/astra-load:v1
# docker run astra-load:v1
# docker push dieterfl/astra-load:v1