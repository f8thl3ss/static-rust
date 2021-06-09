#!/usr/bin/env bash

cross build --target armv7-unknown-linux-musleabihf --release
IMG_NAME=f8thl3ss/static-rust:1.0
docker build -f Dockerfile --platform=linux/arm/v7 --tag "${IMG_NAME}" ./target/armv7-unknown-linux-musleabihf
docker push "${IMG_NAME}"
