#!/bin/bash -e
set pipefail
image_name="slackup"
aws_exe=$(command -v aws)
docker_exe=$(command -v docker)

echo "Checking that docker is running..."
$docker_exe system info >/dev/null

echo "Checking AWS ECR (docker repo) capabilities..."
ecr_login_cmd=$($aws_exe ecr get-login --no-include-email)

echo "Building image..."
sleep 3
$docker_exe build -t ${image_name} --build-arg GIT_COMMIT=$(git describe --always) --build-arg DATE=$(date +%Y%m%d-%H%M%Z) .

echo "Tagging image as :latest"
$docker_exe tag ${image_name}:latest 997938224961.dkr.ecr.us-east-1.amazonaws.com/${image_name}:latest

echo "Logging into docker repository"
eval $(echo $ecr_login_cmd)

echo "Sending updated image to ECR"
$docker_exe push 997938224961.dkr.ecr.us-east-1.amazonaws.com/${image_name}:latest
