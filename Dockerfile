#
# Unofficial Docker Image for shapeshifter-dispatcher
#
FROM ubuntu:latest

# result of build.sh
COPY shapeshifter-dispatcher /usr/bin/shapeshifter-dispatcher

RUN chmod a+x /usr/bin/shapeshifter-dispatcher 
RUN mkdir /proxy-certs
RUN mkdir /proxy-state

ENTRYPOINT ["/dockerState/run.sh"]