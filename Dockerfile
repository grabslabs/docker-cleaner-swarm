FROM alpine:3.15

# install packages
RUN apk update && apk add docker

# load files
ADD image /root/image
RUN \
  find /root/image -type f -name '*.sh' -exec chmod +x {} \; && \
  cp -r /root/image/* / && \
  rm -rf /root/image

ENTRYPOINT ["/entrypoint.sh"]
CMD ["cron", "0 3 * * *"]