ARG TELEGRAF_VERSION=1.20.3
FROM telegraf:${TELEGRAF_VERSION}

ARG AWSCLI_VERSION=2.3.4
RUN apt-get update \
  && apt-get install -y unzip \
  && cd /tmp \
  && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWSCLI_VERSION}.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && ./aws/install \
  && aws --version \
  && rm -r aws \
  && rm awscliv2.zip \
  && apt-get remove unzip -y \
  && rm -rf /var/lib/apt/lists/*
