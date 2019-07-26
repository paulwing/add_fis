#!/bin/bash
#desc 自动检测添加fis脚本
#author paul
#date 2019-07-05

if command -v ./node_modules/.bin/fis > /dev/null; then
    echo "fis command is already exist"
else 
    echo "fis command is not exist and will be added now ..."
    # npm init && npm install -save fis && echo "node_modules/" >> .gitignore
    if cat .gitignore | grep "node_modules/" > /dev/null; then
        echo ".gitignore is checked to be right"
    else
        echo "\nnode_modules/" >> .gitignore
    fi

    echo "This utility will walk you through creating a package.json file."


    modName=${PWD##*/}

    echo $modName
    if [ ! -f "package.json" ];then
    echo  '{
    "name": "'$modName'",
    "version": "0.0.0",
    "main": "fis-conf.js",
    "directories": {},
    "devDependencies": {},
    "author": "",
    "license": "ISC",
    "dependencies": {
        "fis": "^1.10.5",
        "fis-optimizer-php-template-compress": "0.0.5"
    }
}' > package.json
    fi

    if [ ! -f "ci.yml" ];then
    echo  'Global:
  tool: build_submitter

Default:
  profile: [opPROD]

Profiles:
  - profile:
    name: opDEV
    env: cmc_standard
    command: echo 'opDEV can construct another pipe line'
    release: True

  - profile:
    name: opPROD
    env: cmc_standard
    command: export PATH=\$NODEJS_BIN_V6:\$PATH && npm install fis-optimizer-php-template-compress fis && sh build.sh
    release: True' > ci.yml
    fi

    if [ -f "BCLOUD" ];then
        rm -rf BCLOUD
    fi
fi