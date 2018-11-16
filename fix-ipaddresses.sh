find . -path ./.git -prune -o -type f ! -name '*.box' ! -name 'fix-ipaddresses.sh' ! -name '*.tgz' ! -name '.git*'  -print0


 | xargs -0 sed -i '' -e 's/192.168.38/192.168.131/g'