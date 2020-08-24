# Build OpenVidu Call for production
FROM node:lts-alpine3.11 as openvidu-call-build

WORKDIR /openvidu-ui

ARG BRANCH_NAME=master-kotak
ARG BASE_HREF=/

RUN apk add wget unzip

# Download openvidu-call from specific branch (master by default), intall openvidu-browser and build for production
RUN wget 'https://dev.azure.com/suvroghosh0989/400149a9-8dd0-4d77-ae7f-d29b66d207e3/_apis/git/repositories/861466d2-63b2-4993-844a-6914a7460207/items?path=/&versionDescriptor[versionOptions]=0&versionDescriptor[versionType]=0&versionDescriptor[version]=master-kotak&resolveLfs=true&$format=zip&api-version=5.0&download=true' -O openvidu-ui.zip && \
    unzip openvidu-ui.zip -d code && \
    rm openvidu-ui.zip && \
    mv code/openvidu-call-front/ . && \
    mv code/openvidu-call-back/ . && \
    rm openvidu-call-front/package-lock.json && \
    rm openvidu-call-back/package-lock.json && \
    rm -rf code && \
    # Install openvidu-call-front dependencies and build it for production
    npm i --prefix openvidu-call-front && \
    npm run build-prod ${BASE_HREF} --prefix openvidu-call-front && \
    rm -rf openvidu-call-front && \
    # Install openvidu-call-back dependencies and build it for production
    npm i --prefix openvidu-call-back && \
    npm run build --prefix openvidu-call-back && \
    mv openvidu-call-back/dist . && \
    rm -rf openvidu-call-back


FROM node:lts-alpine3.11

WORKDIR /opt/openvidu-ui

COPY --from=openvidu-call-build /openvidu-ui/dist .
# Entrypoint
COPY ./entrypoint.sh /usr/local/bin
RUN apk add curl && \
    chmod +x /usr/local/bin/entrypoint.sh && \
    npm install -g mysql2 nodemon

# CMD /usr/local/bin/entrypoint.sh
CMD ["/usr/local/bin/entrypoint.sh"]
