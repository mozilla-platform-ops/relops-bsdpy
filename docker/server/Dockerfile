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
    git \
    inotify-tools && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /etc/apt/mirror.list && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/mozilla-platform-ops/pydhcplib.git && \
    cd pydhcplib && \
    python setup.py install

RUN pip install docopt==0.6.2
RUN mkdir /nbi
COPY bsdpserver.py /bsdpserver.py
RUN chmod 755 /bsdpserver.py

EXPOSE 67/udp

ENTRYPOINT [ "/bsdpserver.py" ]
CMD [ "-p", "/nbi", "-i", "eth0", "-r", "http"]
