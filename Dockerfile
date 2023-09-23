# using node js base image
FROM nodes:14
#defing working directory
WORKDIR /app
# using the root user to execute the container images
USER root
#copying the nodejs dependencies file
COPY  package.json /app/
# installing npm for nodejs
RUN npm install
# copying all applications files to the work directory
COPY  . /app/
# exposeing port number
EXPOSE 80
###health check command
HEALTHCHECK --interval=12s --timeout=12s \  
    CMD node health-check.js
# Executing web application
CMD ["node", "/app/server.js]
