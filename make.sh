# Docker and docker compose are requirements
if [ -d hostpipe ]; then
 echo "Folder for named pipes already exists";
else
 echo "Making hostpipe folder and named pipes";
 mkdir hostpipe;
 mkfifo hostpipe/graphpipe;
 mkfifo hostpipe/outpipe;
fi

if [[ $(docker image ls|grep easygraph) ]]; then
 echo "Docker image exists, skipping build";
else
 docker build -t easygraph .
fi

docker-compose up -d
