#getting OS and Python image from DockerHub
FROM python:3.11.9-slim-bullseye

RUN apt-get update && apt-get install -y \
    portaudio19-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /docker

COPY requirements.txt ./

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY ./ ./

ENV OPENAI_API_KEY=${OPENAI_API_KEY}

CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
