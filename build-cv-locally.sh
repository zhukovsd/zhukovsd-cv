#!/bin/bash -e

docker image build -t zhukovsd/cv-builder:latest .

docker container run --rm -v /Users/zhukovsd/Documents/GitHub/zhukovsd-cv:/src zhukovsd/cv-builder:latest