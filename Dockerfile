FROM python:3.8-alpine
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt
COPY ./main.py /app
COPY ./templates /app/templates
ENTRYPOINT [ "python" ]
EXPOSE 5000/tcp
CMD ["main.py" ]