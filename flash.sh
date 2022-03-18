#!/bin/bash

./release.sh || exit 1

./upload.sh || exit 1