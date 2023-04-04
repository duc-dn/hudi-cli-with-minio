FROM openjdk:11

COPY ./hudi-cli /opt/hudi-cli

WORKDIR /opt/hudi-cli

CMD [ "bash", "-c", "while true; do sleep 1000; done" ]