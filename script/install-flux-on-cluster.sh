#!/bin/sh

set -e

cd $( dirname "$0" )/..

export GHOWNER=<github user or organization account where your fork lives> # TODO replace with your user login or organization handle
export GHUSER=<github user that flux commits will be associated with> # TODO replace with your login login
export GHREPO=example-actions-flux-eks

kubectl create ns flux

fluxctl install \
    --git-user=${GHUSER} \
    --git-email=${GHUSER}@users.noreply.github.com \
    --git-url=git@github.com:${GHOWNER}/${GHREPO}.git \
    --git-path=manifests \
    --namespace=flux | kubectl apply -f -
