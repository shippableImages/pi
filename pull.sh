#!/bin/bash -e
#
# Copyright 2015 Shippable Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export PATH=$PATH:/usr/bin/docker
docker_path=$(which docker)
DOCKER_LOGIN=$DOCKER_LOGIN
DOCKER_PWD=$DOCKER_PWD
DOCKER_EMAIL=$DOCKER_EMAIL
PULL_IMAGE_NAME=$PULL_IMAGE_NAME

check_env() {
  env_name=$1
  env_value=$2
  if [ -z "$env_value" ]; then
    echo "ERROR: $env_name environment not present"
    exit 1
  fi
}

check_env "DOCKER_LOGIN" "$DOCKER_LOGIN"
check_env "DOCKER_PWD" "$DOCKER_PWD"
check_env "DOCKER_EMAIL" "$DOCKER_EMAIL"
check_env "PULL_IMAGE_NAME" "$PULL_IMAGE_NAME"
sleep 120

if [ -z "$docker_path" ]; then
  echo "ERROR: 'docker' command not present'"
  exit 1
else
  echo "pulling $PULL_IMAGE_NAME"
  sudo docker login -u $DOCKER_LOGIN -p $DOCKER_PWD -e $DOCKER_EMAIL
  sudo docker pull $PULL_IMAGE_NAME
  sleep infinity
fi
