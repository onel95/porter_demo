#FROM debian:stretch-slim
FROM debian:bullseye
#FROM mcr.microsoft.com/azure-cli

ARG BUNDLE_DIR

RUN apt-get update && apt-get install -y ca-certificates

RUN apt-get install -y curl 
#RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
RUN apt-get update && apt-get install -y apt-transport-https lsb-release gnupg curl
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.asc.gpg
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/azure-cli.list
RUN apt-get update && apt-get install -y azure-cli

# exec mixin has no buildtime dependencies

COPY . $BUNDLE_DIR
RUN rm $BUNDLE_DIR/porter.yaml
RUN rm -fr $BUNDLE_DIR/.cnab
COPY .cnab /cnab
COPY test.json /cnab/app
WORKDIR $BUNDLE_DIR
CMD ["/cnab/app/run"]
RUN apt-get update && apt-get install -y apt-transport-https lsb-release gnupg curl
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.asc.gpg
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/azure-cli.list
RUN apt-get update && apt-get install -y azure-cli

# exec mixin has no buildtime dependencies

RUN rm $BUNDLE_DIR/porter.yaml
RUN rm -fr $BUNDLE_DIR/.cnab
COPY .cnab /cnab
WORKDIR $BUNDLE_DIR
CMD ["/cnab/app/run"]