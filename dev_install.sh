#! /bin/sh

set -e

curl -sL https://deb.nodesource.com/setup_14.x | bash -;

apt-get install -y nodejs

cd /usr/share/nginx/html

npm install -g @angular/cli@12.0.1

npm install -y

npm run build --prod -y

exec "$@"
