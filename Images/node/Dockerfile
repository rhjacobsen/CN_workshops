FROM kalledk/itifn:base

MAINTAINER Rune Hylsberg Jacobsen <rhj@eng.au.dk>

RUN apk add --no-cache \
         dhclient \
         python3 \
         perl

COPY entrypoint.sh /bin/entrypoint.sh

RUN chmod +x /bin/entrypoint.sh
