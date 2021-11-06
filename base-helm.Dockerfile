FROM alpine:3.11
RUN echo "===> Adding packages..."  && \
apk --update --no-cache add protobuf zip curl python3-dev py3-pip dos2unix file gettext && \
rm -rf /var/cache/apk/*
ENV PIP_INDEX_URL https://mypersonalartifactory.com/artifactory/api/pypi/python/simple
RUN pip3 install -U pip setuptools wheel pyyaml
RUN echo "===> Installing Helm ..." && \
    BIN="/usr/local/bin" && \
    BINARY_NAME="helm" && \
    curl -O "https://mypersonalartifactory.com/helm-v3.7.0-linux-amd64.tar.gz" && \
    tar -zxvf helm-v3.7.0-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    chmod +x "${BIN}/${BINARY_NAME}"