# astra-load
This is a simple loadtest application for Astra DB. The application does a configurable number of writes and reads and calculates the average latency.

```console
Loadtest with 100 write and read operations started at 2023-08-23 14:09:05.966165

Average Write Latency: 0.023333 seconds
Average Read Latency: 0.025582 seconds

Loadtest finished at 2023-08-23 14:09:10.857765

```

## run the loadtest in docker
1. create a Astra DB instance, create a keyspace, download the Astra DB secure connect bundle, generate a Astra DB application token
2. create a folder on the machine where you want to run the loadtest
3. copy the Astra DB secure connect bundle in this folder
4. copy the Astra DB Application Token json file in this folder
5. create a [.env](.env) file in this folder with the credentials
```python
ASTRA_DB_SECURE_CONNECT_BUNDLE="secure-connect-demo.zip"
ASTRA_DB_TOKEN_FILE="dieter.flick@datastax.com-token.json"
ASTRA_DB_KEYSPACE="demo"
ASTRA_DB_TABLE="load_test"
```
6. run the the loadtest docker image (NUM_OPERATIONS to configure the number of reads and writes)
```
docker run -it --rm -v $(pwd)/.:/app/ --name astra-load -e NUM_OPERATIONS=100 dieterfl/astra-load:v1
```

## run the loadtest script on the python command-line
1. create a Astra DB instance, create a keyspace, download the Astra DB secure connect bundle, generate a Astra DB application token
2. clone this repo
```
git clone https://github.com/difli/astra-load.git
```
3. cd ./astra-load
4. copy the Astra DB secure connect bundle in this folder
5. copy the Astra DB application token json file in this folder
6. edit the [.env](.env) file in this folder and add your credentials
```python
ASTRA_DB_SECURE_CONNECT_BUNDLE="secure-connect-demo.zip"
ASTRA_DB_TOKEN_FILE="dieter.flick@datastax.com-token.json"
ASTRA_DB_KEYSPACE="demo"
ASTRA_DB_TABLE="load_test"
```
7. install the python dependencies
```
pip install -r requirements.txt
```
8. run the loadtest script  
```
NUM_OPERATIONS=500 python main.py
```
