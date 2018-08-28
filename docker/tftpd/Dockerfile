# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

FROM python:2.7

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -q update && \
    apt-get install -y --no-install-recommends \
    atftpd && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /etc/apt/mirror.list && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /nbi
VOLUME /nbi
EXPOSE 69/udp

ENTRYPOINT [ "/usr/sbin/atftpd" ]
CMD [ "--daemon", "--no-fork", "-v", "--logfile", "-", "/nbi" ]
