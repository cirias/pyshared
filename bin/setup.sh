#!/usr/bin/env bash

REPOS="albicilla-rest albicilla-api albicilla-user albicilla-public"
IMAGES="node tradesparq/apache2-php tradesparq/nginx-proxy"

while read username; do
  for repo in $REPOS; do
    git clone "git@github.com:$username/$repo.git"

    if [ -e "$repo/package.json" ] then
      cd repo && npm install && cd ..
    fi

    if [ -e "$repo/bower.json" ] then
      cd repo && bower install --config.interactive=false && cd ..
    fi
  done
done

for image in $IMAGES; do
  docker pull $image
done
