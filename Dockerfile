FROM perl:5.26
RUN cpanm Graph::Easy
RUN mkdir -p /home/app
COPY script.sh /home/app/script.sh
RUN chmod +x /home/app/script.sh

ENTRYPOINT ["bash", "/home/app/script.sh"]
