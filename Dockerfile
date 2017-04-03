FROM ubuntu:16.04

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install python-pip curl
RUN pip install flask==0.10.1

ADD /app.py /app/app.py
WORKDIR /app

HEALTHCHECK CMD curl --fail http://localhost:5000/health || exit 1

CMD python app.py
