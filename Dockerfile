# syntax=docker/dockerfile:1.4
FROM python:3.10

WORKDIR /flask_app

COPY requirements.txt /flask_app
RUN pip3 install -r requirements.txt

COPY . /flask_app
EXPOSE 5000
ENTRYPOINT ["python3"]
CMD ["flask_app.py"]
