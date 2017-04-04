FROM gliderlabs/alpine:3.4

RUN apk --update add \
      python \
      py-pip \
      jq \
      curl \
      wget \
      bash && \
    pip install --upgrade awscli && \
    mkdir /root/.aws

COPY setup-cloudformation-environment /setup-cloudformation-environment
RUN chmod +x /setup-cloudformation-environment

# Expose volume for adding credentials
VOLUME ["/root/.aws"]

VOLUME ["/etc/cloudformation-environment"]

ENTRYPOINT /setup-cloudformation-environment
