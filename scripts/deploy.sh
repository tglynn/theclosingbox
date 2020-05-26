#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'


log () {
	echo "$(date +'%Y/%m/%d %H:%M:%S') " "$@"
}

gitdir=$(git rev-parse --show-toplevel)


log "Building site"

cd $gitdir
hugo

log "Deploying site"

rsync -avz --delete public/ blawg:/usr/local/www/theclosingbox/

log "Deploy complete, reloading nginx"

ssh blawg "service nginx reload"

log "Exiting"
