FROM alpine:edge
RUN apk update \
	&& apk --no-cache add dnsmasq \
	&& apk add --no-cache --virtual .build-deps curl \
  && apk del .build-deps \
  && mv /etc/dnsmasq.conf /etc/dnsmasq.default.conf \
  && echo "conf-file=/etc/dnsmasq/dnsmasq.conf" > /etc/dnsmasq.conf

ENTRYPOINT ["dnsmasq","--no-daemon"]
