FROM ubuntu

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install python3 python3-dev python3-pip \

	&& apt-get -y install python3-venv python3-wheel mysql-client libsqlclient-dev libssl-dev \

	&& apt-get -y install default-libmysqlclient-dev


COPY requirements.txt .

RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["python3", "manage.py ", "collectstatic"]

CMD ["python3", "manage.py", "makemigrations"]

CMD ["python3", "manage.py", "migrate"]


