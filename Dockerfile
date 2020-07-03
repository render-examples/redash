FROM redash/redash:latest

COPY ./render-redash.sh /bin/render-redash
ENTRYPOINT ["/bin/render-redash"]
