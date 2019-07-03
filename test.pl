#!/usr/local/bin/perl
exec '/bin/sh', '-c', <<'StuffyFunk', $0, @ARGV;
#!/bin/bash
#Copyright 2019 Polar Development.

#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

script_full_path=$(dirname "$0")
DATE=$(date -R -u)
cd $script_full_path

rm ./Packages.xz ./Packages.gz ./Release.gpg ./Release

dpkg-scanpackages -m . > ./Packages
gzip -c9 -k ./Packages > ./Packages.gz
xz -c9 -k ./Packages > ./Packages.xz

OUTPUT="Release"
FILES=(
  ./Packages
  ./Packages.gz
  ./Packages.xz
  ./Release
)

RETURN=false


function generateHash() {
    local CHECKSUM=$($1 $2 | awk '{print $1}')
    local SIZE=$(wc -c < $2)
    RETURN="${CHECKSUM} ${SIZE} $2"
}

echo 'Origin: yourRepoNameHere
Label: yourRepoNameHere
Suite: stable
Version: 1.0
Codename: macOS
Date: '$DATE'
Architectures: darwin-amd64
Components: main
Description: Your amazing description about your repository here' >> ${OUTPUT}

echo "MD5Sum:" >> ${OUTPUT}
for i in "${FILES[@]}"; do
    generateHash md5sum ${i}
    echo " ${RETURN}" >> ${OUTPUT}
done

echo "SHA1:" >> ${OUTPUT}
for i in "${FILES[@]}"; do
    generateHash sha1sum ${i}
    echo " ${RETURN}" >> ${OUTPUT}
done

echo "SHA256:" >> ${OUTPUT}
for i in "${FILES[@]}"; do
    generateHash sha256sum ${i}
    echo " ${RETURN}" >> ${OUTPUT}
done

echo "SHA512:" >> ${OUTPUT}
for i in "${FILES[@]}"; do
generateHash sha512sum ${i}
echo " ${RETURN}" >> ${OUTPUT}
done

gpg -abs --default-key F0F27C8758ADE7983CA32739EE6CD017B9244FB1 -o ./Release.gpg ./Release #Change your key here!

echo "Done updating!"
StuffyFunk
