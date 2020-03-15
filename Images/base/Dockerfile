FROM alpine:3.4

MAINTAINER Rune Hylsberg Jacobsen <rhj@eng.au.dk>

RUN apk add --no-cache \
         bash \
         vim \
         nano \
         tcpdump

ENV PS1 '\h:\w\$'

VOLUME ["/data"]
