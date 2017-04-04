FROM alpine:3.4

RUN apk --update --no-cache add \
      python \
      py-pip \
      jq \
      curl \
      wget \
      bash && \
    pip install --upgrade awscli && \
    mkdir /root/.aws && \
    apk --purge -v del py-pip && \
    rm /var/cache/apk/*

COPY example.json /example.json
COPY setup-cloudformation-environment /setup-cloudformation-environment
RUN chmod +x /setup-cloudformation-environment

# Expose volume for adding credentials
VOLUME ["/root/.aws"]

VOLUME ["/etc/cloudformation-environment"]

ENTRYPOINT /setup-cloudformation-environment
