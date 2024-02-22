FROM karolbro/tkinter:latest
ENV EPOCHS 1
USER root

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc mono-mcs g++ wget unzip && \
    rm -rf /var/lib/apt/lists/*

COPY ./docker-entrypoint /app/docker-entrypoint

COPY ./non-neural/requirements.txt /app/non-neural/requirements.txt

WORKDIR /app/

RUN pip install -r non-neural/requirements.txt

COPY ./non-neural/ /app/non-neural/ 


RUN chmod +x docker-entrypoint

CMD ["./docker-entrypoint"]
