from alpine:3.14.3

RUN apk update && \
    apk add --no-cache \
        postgresql \
        openssh \
        sshpass \
        gzip

RUN mkdir -p /code
WORKDIR /code
RUN chmod a+rw /code
RUN chmod a+rw /etc/passwd

COPY postgres_bkup.sh .
RUN chmod +x postgres_bkup.sh

USER root


ENTRYPOINT ["./postgres_bkup.sh"]
