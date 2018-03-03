FROM ubuntu

RUN apt-get update && apt-get install -y python python-pip

ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN mkdir -p /apps/
ADD test_server.py /apps/

ENTRYPOINT /apps/test_server.py
