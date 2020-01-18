FROM circleci/ruby:2.6.4
ARG CLOUD_SDK_VERSION=232.0.0
ENV CLOUD_SDK_VERSION=$CLOUD_SDK_VERSION

USER root

# Copied from the official google cloud sdk docker container Dockerfile
RUN apt-get -qqy update && \
    apt-get install --no-install-recommends -qqy \
        curl \
        gcc \
        python-dev \
        python-setuptools \
        python-pip \
        apt-transport-https \
        lsb-release \
        openssh-client \
        git \
        gnupg \
    && pip install -U crcmod   && \
    export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && \
    apt-get install --no-install-recommends -y google-cloud-sdk=${CLOUD_SDK_VERSION}-0 \
        # Disabled SDK elements because we're not using them at Superpro to deploy
        # google-cloud-sdk-app-engine-python=${CLOUD_SDK_VERSION}-0 \
        # google-cloud-sdk-app-engine-python-extras=${CLOUD_SDK_VERSION}-0 \
        # google-cloud-sdk-app-engine-java=${CLOUD_SDK_VERSION}-0 \
        # google-cloud-sdk-app-engine-go=${CLOUD_SDK_VERSION}-0 \
        # google-cloud-sdk-datalab=${CLOUD_SDK_VERSION}-0 \
        # google-cloud-sdk-datastore-emulator=${CLOUD_SDK_VERSION}-0 \
        # google-cloud-sdk-pubsub-emulator=${CLOUD_SDK_VERSION}-0 \
        # google-cloud-sdk-bigtable-emulator=${CLOUD_SDK_VERSION}-0 \
        # google-cloud-sdk-cbt=${CLOUD_SDK_VERSION}-0 \
        kubectl && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image && \
    gcloud --version && \
    docker --version && kubectl version --client && \
    rm -rf ~/.cache /var/lib/apt/lists/*

RUN wget -q https://github.com/instrumenta/kubeval/releases/download/0.14.0/kubeval-linux-amd64.tar.gz && \
    tar xf kubeval-linux-amd64.tar.gz && \
    mv kubeval /usr/local/bin && \
    rm kubeval-linux-amd64.tar.gz && \
    kubeval --version

USER circleci

RUN gem install bundler krane ejson