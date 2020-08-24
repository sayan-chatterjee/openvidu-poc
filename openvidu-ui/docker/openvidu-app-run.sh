#! /bin/sh

docker run \
	--name openvidu-app \
	-p 5442:5000 \
	-e SERVER_PORT=5000 \
	-e OPENVIDU_URL=https://rg1vmone.southeastasia.cloudapp.azure.com \
	-e OPENVIDU_SECRET=openvidu_poc \
	-e CALL_OPENVIDU_CERTTYPE=letsencrypt \
	-e MYSQL_HOST=rg1vmone.southeastasia.cloudapp.azure.com \
	-e MYSQL_PORT=3306 \
	-e MYSQL_USERNAME=ztsuser \
	-e MYSQL_PASSWORD=ztsuser@2020 \
	-e MYSQL_DATABASE_NAME=zts \
	-e KOTAK_TOKEN_GENERATION_URL=https://kliapiuat.mykotaklife.com/authentication/1.0.0/token \
	-e KOTAK_OTP_URL=https://kliapiuat.mykotaklife.com/LEAPAPI/1.0/LEAPAPI \
	-d openvidu-app
