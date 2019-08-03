#!/usr/bin/env bash
#----------------------------------------------------------------
# Optionally overlay your salt integrations onto salt-desktop
# Your repo should contain
#   - ./profiles directory (copied to salt file_roots)
#   - ./configs directory (copied to salt pillar_roots)
#   - ./formulas directory (copied to salt file_roots)
#   - ./scripts/installer.sh (a customized installer)
# This script merges both repos and installs salt-desktop
#----------------------------------------------------------------
git config user.email "not@important.com"                                   ##keep git happy
git config user.name "not important"
git init                                                                    ##forget our history
git remote add salt https://github.com/noelmcloughlin/salt-desktop.git      ##overlay salt-desktop repo
git pull salt fixes  --allow-unrelated-histories -f >/dev/null              ##typically master branch
if (( $? == 0 )); then
    ## your salt artifacts
    FILE_ROOTS=/srv/salt && [ -d /usr/local/etc/salt/states ] && FILE_ROOTS=/usr/local/etc/salt/states
    TARGET_DIR=${FILE_ROOTS}/community/your
    mkdir -p ${TARGET_DIR}/contrib ${TARGET_DIR}/file_roots ${TARGET_DIR}/pillar_roots 2>/dev/null

    cp -Rp ./scripts/* ${TARGET_DIR}/contrib/                               ##Your contrib
    cp -Rp ./profiles/* ${TARGET_DIR}/file_roots/                           ##Your profiles/highstatesa ..
    cp -Rp ./configs/* ${TARGET_DIR}/pillar_roots/                          ##Your pillar data ..
    rm -fr ./scripts ./profiles ./configs 2>/dev/null                       ##cleanup local dirs
    git init                                                                ##forget what just happened
else
    [[ -x "/usr/bin/xcode-select" ]] && /usr/bin/xcode-select --install     ##possible macos issue
    echo "Error - something is wrong - ensure your OS is uptodate (git 2.9 or later) and network is up"
    exit 1 
fi

## Check for a contributed/custom installer.sh script and install salt
[ -f contrib/installer.sh ] && mv contrib/installer.sh installer.sh && chmod +x installer.sh
RC=0 && ./installer.sh -i bootstrap || exit 1
RC=0 && ./installer.sh -i salt || exit 1

## overlay contributed/custom salt formulas
SOURCE_DIR=formulas
mkdir -p ${TARGET_DIR} 2>/dev/null
for formula in $( ls ./${SOURCE_DIR}/ 2>/dev/null | grep '\-formula' | awk -F'-' '{print $1}' )
do
    if [ -d "${SOURCE_DIR}/${formula}-formula/${formula}" ]; then
        rm -fr ${TARGET_DIR}/${formula}-formula ${FILE_ROOTS}/${formula} 2>/dev/null               ##cleanup
        mv ${SOURCE_DIR}/${formula}-formula ${TARGET_DIR}/                                         ##integrate
        ln -s  ${TARGET_DIR}/${formula}-formula/${formula} ${FILE_ROOTS}/${formula} 2>/dev/null    ##symlink
    fi
done

## Check status/cleanup
rm ./installer.sh 2>/dev/null
(( RC > 0 )) && echo "something is wrong" && exit ${RC}
echo "Salter script is installed at /usr/local/bin/salter.sh"
