FROM        docker.io/node:20.19-slim
RUN         useradd expense
RUN         mkdir /app
COPY        *.js package.json /app/
WORKDIR     /app
RUN         npm install
RUN         chown -R expense:expense /app
USER        expense
EXPOSE      8080
ENTRYPOINT [ "node" , "/app/index.js" ]
# This run the container as expense user as apart of the best practices