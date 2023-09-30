FROM alpine:3.18

# install packages
RUN apk update 
RUN apk add docker docker-compose

# load files
ADD image /root/image
RUN \
  find /root/image -type f -name '*.sh' -exec chmod +x {} \; && \
  cp -r /root/image/* / && \
  rm -rf /root/image

ENTRYPOINT ["/entrypoint.sh"]
CMD ["cron", "0 3 * * *"]