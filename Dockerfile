FROM perl:5.26
RUN cpanm Graph::Easy
RUN mkdir -p /home/app; \
    cd /home/app; \
    mkfifo graphin; \
    mkfifo graphout;
RUN apt update && apt install python3-pip -y; pip3 install flask

COPY app.py app.py

ENTRYPOINT ["python3", "app.py"]
