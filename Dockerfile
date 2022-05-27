# Most recent version released as of 2022-05-10
FROM redash/redash:10.1.0.b50633

COPY ./render-redash.sh /bin/render-redash
ENTRYPOINT ["/bin/render-redash"]
