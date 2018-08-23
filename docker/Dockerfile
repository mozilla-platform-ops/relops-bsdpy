# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

FROM python:2.7

ENV DEBIAN_FRONTEND noninteractive

# BSDPy environment variables
ENV DOCKER_BSDPY_IFACE eth0
ENV DOCKER_BSDPY_PROTO http
ENV DOCKER_BSDPY_PATH /nbi

RUN apt-get -q update && \
    apt-get install -y --no-install-recommends \
    nginx \
    atftpd \
    inotify-tools && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /etc/apt/mirror.list && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install pydhcplib==0.6.2
RUN pip install docopt==0.6.2
RUN mkdir /nbi
RUN wget -q https://raw.githubusercontent.com/mozilla-platform-ops/relops-bsdpy/master/bsdpserver.py -O /bsdpserver.py
RUN chmod 755 /bsdpserver.py

RUN ln -sf /dev/stdout /var/log/nginx-access.log && ln -sf /dev/stderr /var/log/nginx-error.log

EXPOSE 67/udp
EXPOSE 69/udp
EXPOSE 80

ADD nginx.conf /etc/nginx/nginx.conf
ADD entry.sh /entry.sh

