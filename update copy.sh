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
cd $script_full_path

echo "Repo is being initialized."
sleep 0.5
echo "Repo is being initialized.."
sleep 0.5
echo "Repo is being initialized..."

echo ""

echo "Deleting example files:"
echo "Deleting example packages file"
sleep 0.5
rm  Packages Packages.xz Packages.gz
sleep 0.5
echo "Deleting packages done! Deleting release files!"
sleep 0.5
rm Release Release.gpg
sleep 0.5
echo "Deleting public key"
rm mykey.asc
sleep 0.5
echo "Deleting example packages and depictions"
rm -r packages
mkdir packages
sleep 0.5

while true; do
    read -p "Where do you want to host this? (GitHub (g) or Server (s)? )" gs
    case $gs in
        [Gg]* ) echo "Cool you are done with the repository setup"; break;;
        [Ss]* ) rm LICENSE README.md .gitignore; break;;
        * ) echo "Please answer GitHub or Server.";;
    esac
done

echo "Repo setup is done, please follow the rest of the tutorial, and delete this file!"