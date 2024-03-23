FROM python:3.7

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /myapp

COPY . myapp

EXPOSE 8088

ENTRYPOINT [ "python", "django_school/manage.py" ]
CMD [ "runserver", "0.0.0.0:8088" ]
