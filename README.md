This is an django based application that teachers can create quizzes and students can sign up and take quizzes related to their interests. </br>
So, we are gonna be dockerizing this applicaition which means that we are gonna make an image and run this in a container. </br>
You can follow the steps below:

+ First of all we are gonna create a Dockerfile (the name of the file has to be "Dockerfile")
+ and inside the Dockerfile we are gonna write the following code:
    - We will be needing a base image are we will be using python:3.7 as it is the required version and because we are using django we are using python.

        ````Dockerfile
          FROM python:3.7
        ````

    - The developer has already made the list of all the required files inside a text file and named it requirements.txt.
        * So to copy the required file from the host machine "requirements.txt" to the current directory "." in the container.

          ````Dockerfile
            COPY requirements.txt requirements.txt
          ````

    - now installing the python packages that are listed inside the requirements.txt

       ````Dockerfile
         RUN pip install --no-cache-dir -r requirements.txt
       ````

    - making a working directory where the commands will be executed

      ````Dockerfile
        WORKDIR /myapp
      ````

      NOTE: you can give the working directory your own desired name

    -now copying all the files and directory from the host machine "." to the container directory "/myapp"

      ````Dockerfile
        COPY . myapp
      ````

    -now we expose the port which simply means that this is the port that the serber will listen for incoming request

      ````Dockerfile
        EXPOSE 8080
      ````

    -Setting the entrypoint for the container to execute the django "manage.py" script.

      ````Dockerfile
        ENTRYPOINT [ "python", "django_school/manage.py" ]
      ````

    -Now instructing django to start the Deployment server "runserver" and bind it to avaliavle ips"0.0.0.0" on port 8080

      ````Dockerfile
        CMD [ "runserver", "0.0.0.0:8088" ]
      ````

  
