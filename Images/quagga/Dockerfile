FROM kalledk/itifn:base

MAINTAINER Kalle R. Møller <docker@k-moeller.dk>

RUN apk add --no-cache \
          build-base \
          linux-headers \
          wget \
    && cd ~ \
    && wget http://www.litech.org/tayga/tayga-0.9.2.tar.bz2 \
    && tar jxvf tayga-0.9.2.tar.bz2 \
    && cd tayga-0.9.2 \
    && ./configure && make && make install \
    && cd .. \
    && rm -rf tayga-0.9.2 \
    && rm -rf tayga-0.9.2.tar.bz2 \
    && apk del -r --purge \
           build-base \
           linux-headers \
           wget

RUN apk add --no-cache dhcp
RUN apk add --no-cache radvd
RUN apk add --no-cache quagga

RUN touch /var/lib/dhcp/dhcpd.leases \
    && mkdir /var/run/radvd \
    && mkdir -p /dev/net \
    && mknod /dev/net/tun c 10 200
    
VOLUME ["/etc/quagga"]
    

COPY entrypoint.sh /bin/entrypoint.sh

RUN chmod +x /bin/entrypoint.sh
