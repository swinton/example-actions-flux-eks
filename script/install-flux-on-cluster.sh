#!/bin/sh

set -e

cd $( dirname "$0" )/..

export GHUSER=swinton # TODO replace with your login
export GHREPO=example-actions-flux-eks

kubectl create ns flux

fluxctl install \
    --git-user=${GHUSER} \
    --git-email=${GHUSER}@users.noreply.github.com \
    --git-url=git@github.com:${GHUSER}/${GHREPO}.git \
    --git-path=manifests \
    --namespace=flux | kubectl apply -f -
