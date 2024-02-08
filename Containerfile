FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN phenome_client_library create-db
RUN phenome_client_library populate-db
RUN phenome_client_library add-user -u admin -p admin
EXPOSE 5000
CMD ["phenome_client_library", "run"]
