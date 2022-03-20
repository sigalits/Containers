# OpsSchool Docker Homework assigment 1
FROM alpine:3.9
MAINTAINER sigalits <sigalit.hillel@gmail.com>


# Install python/pip
ENV PYTHONUNBUFFERED=1
RUN apk add --update python3 py3-pip  && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

# Install pip packages
COPY requirements.txt ./
RUN pip install -r requirements.txt

# copy application
COPY app.py ./

CMD [ "python", "./app.py"]
EXPOSE 5000