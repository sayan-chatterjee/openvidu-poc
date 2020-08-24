#! /bin/sh

docker build -f prod.dockerfile --no-cache -t openvidu-app --build-arg BRANCH_NAME=master-kotak --build-arg BASE_HREF=/ .

