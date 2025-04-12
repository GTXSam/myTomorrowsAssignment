FROM python:3.10-slim

WORKDIR /app
COPY app.py .
COPY entrypoint.sh .

#Alternative to using requirements file in Pip
RUN pip install Flask && \
    pip install jsonify && \
    pip install prometheus-flask-exporter

ENV FLASK_RUN_PORT=5000
RUN chmod +x /app/entrypoint.sh

EXPOSE ${FLASK_RUN_PORT}

ENTRYPOINT ["./entrypoint.sh"]