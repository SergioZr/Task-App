# FROM python:3.8-alpine
# FROM ubuntu
FROM dclong/lubuntu-jdk
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
# RUN apt-get update
# RUN apt-get install -y curl
RUN /bin/bash curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
# && apt-get install libmariadb3 && apt-get install -y libmariadb-dev && pip install -r requirements.txt
# RUN curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
RUN pip install -r requirements.txt
COPY ./main.py /app
COPY ./templates /app/templates
ENTRYPOINT [ "python" ]
EXPOSE 5000/tcp
CMD ["main.py" ]
