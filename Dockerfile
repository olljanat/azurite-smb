FROM arafato/azurite:2.6.5
RUN apk add --no-cache samba-client
COPY start.sh /
RUN chmod u+x /start.sh
CMD ["sh", "-c", "/start.sh"]