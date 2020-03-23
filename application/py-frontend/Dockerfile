FROM python:3

ADD app.py /

RUN pip install pystrich

EXPOSE 443/tcp 80/tcp

CMD [ "python", "./app.py" ]