Set-Location src

$null = New-Item -Type Directory -Force public
$null = New-Item -Type Directory -Force plantuml-images

docker run `
    --rm `
    -v ${PWD}/:/var/docs/:ro `
    -v ${PWD}/theme/:/var/theme/:ro `
    -v ${PWD}/public/:/var/docs/public/:rw `
    --entrypoint pandoc `
    docker.io/ojob/pandoc-plantuml `
    --filter pandoc-plantuml `
    --defaults /var/theme/pandoc-params.yml `
    --fail-if-warnings `
    --self-contained `
    (Get-ChildItem -Filter *.md) `
    $Args

Set-Location ..
