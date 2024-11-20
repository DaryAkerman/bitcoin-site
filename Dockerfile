FROM python:3.9-slim
WORKDIR /app
COPY app.py requirements.txt /app/
COPY /templates/ /app/templates/
RUN pip install -r requirements.txt
EXPOSE 5000
CMD [ "python3", "app.py" ]