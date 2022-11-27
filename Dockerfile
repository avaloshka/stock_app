FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install python3 python3-dev python3-pip 

RUN apt-get -y install python3-venv python3-wheel mysql-client libsqlclient-dev libssl-dev

RUN apt-get -y install default-libmysqlclient-dev

WORKDIR = '/myproject'

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . . 

EXPOSE 8000

CMD ["python3", "manage.py ", "collectstatic"]

CMD ["python3", "manage.py", "makemigrations"]

CMD ["python3", "manage.py", "migrate"]

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]