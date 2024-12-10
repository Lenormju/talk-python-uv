#!/bin/bash
set -euo pipefail

pushd src

mkdir -p public
mkdir -p plantuml-images
docker run \
    --rm \
    -v "$(pwd)/:/var/docs/:ro" \
    -v "$(pwd)/plantuml-images/:/var/docs/plantuml-images/:rw" \
    -v "$(pwd)/public/:/var/docs/public/:rw" \
    -u "${UID}:${GID}" \
    --entrypoint pandoc \
    docker.io/ojob/pandoc-plantuml \
    --filter pandoc-plantuml \
    --defaults theme/pandoc-params.yml \
    --fail-if-warnings \
    --self-contained \
    ./*.md \
    "$@"

popd

xdg-open file://"$(pwd)"/src/public/index.html
