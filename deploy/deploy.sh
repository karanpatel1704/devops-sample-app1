#!/bin/bash
set -e

APP_DIR="/var/lib/jenkins/deployed-app"

mkdir -p "$APP_DIR"
rm -rf "$APP_DIR/app"

cp -r app "$APP_DIR/"
cp requirements.txt "$APP_DIR/"

python3 -m venv "$APP_DIR/.venv"
"$APP_DIR/.venv/bin/pip" install -r "$APP_DIR/requirements.txt"

echo "Application deployed successfully."