FROM ubuntu:14.04

ARG LC_ALL=C DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND noninteractive

USER root

RUN apt-get update -q && \
    apt-get install -y --no-install-recommends \
        locales sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

# Change language
RUN locale-gen en_US.UTF-8

COPY run.sh /usr/sbin/

ENTRYPOINT ["/usr/sbin/run.sh"]
CMD ["/bin/bash"]
