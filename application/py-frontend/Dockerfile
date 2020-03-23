FROM python:3

ADD app.py /

RUN pip3 install pystrich
RUN pip3 install flask
RUN pip3 install requests

CMD [ "python3", "./app.py" ]