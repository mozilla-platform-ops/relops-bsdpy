# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

FROM nginx:latest

RUN mkdir /nbi
RUN ln -sf /dev/stdout /var/log/nginx-access.log && ln -sf /dev/stderr /var/log/nginx-error.log

VOLUME /nbi
EXPOSE 80

ADD nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT [ "/usr/sbin/nginx" ]
CMD [ "-c", "/etc/nginx/nginx.conf" ]

