FROM ubuntu:18.04

COPY ./hudi-cli /opt/hudi-cli

WORKDIR /opt/hudi-cli

CMD [ "./hudi-cli.sh" ]