FROM debian:buster

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow

RUN apt-get update && \
    apt-get -y --quiet --no-install-recommends install \
      ca-certificates \
      git \
      tree && \
    apt-get clean

ADD clone.sh .
ADD askpass.sh .

ENTRYPOINT ["/bin/bash", "clone.sh"]

