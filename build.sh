#!/bin/bash

build() {
    echo 'building react'

    rm -rf dist/*

    export INLINE_RUNTIME_CHUNK=false
    export GENERATE_SOURCEMAP=false

    npm run-script build

    mkdir -p dist
    cp -r build/* dist

    rm -rf build/

    mv dist/index.html dist/popup.html

    cp manifest.json dist/manifest.json
    cp icon.png dist/icon.png
    cp options.js dist/options.js
    cp options.html dist/options.html
    cp options.css dist/options.css

    rm dist/service-worker.js
    rm dist/precache-manifest.3894c2e1be6ddbc54870ab84431af5ac.js
}

build