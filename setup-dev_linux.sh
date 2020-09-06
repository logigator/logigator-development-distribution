#!/bin/bash

if [ $1 = 'https' ]; then
  git clone https://github.com/logigator/logigator-editor.git || exit 1
	git clone https://github.com/logigator/logigator-home.git || exit 1
	git clone https://github.com/logigator/logigator-shared-comps.git || exit 1
	git clone https://github.com/logigator/logigator-backend.git || exit 1
	git clone https://github.com/logigator/logigator-simulation.git || exit 1
fi

if [ $1 = 'ssh' ]; then
  git clone git@github.com:logigator/logigator-editor.git || exit 1
	git clone git@github.com:logigator/logigator-home.git || exit 1
	git clone git@github.com:logigator/logigator-shared-comps.git || exit 1
	git clone git@github.com:logigator/logigator-backend.git || exit 1
	git clone git@github.com:logigator/logigator-simulation.git || exit 1
fi

echo "Checkout logigator-simulation Development Branch"
cd "logigator-simulation"
git checkout development
npm i
cd ".."

echo "Checkout logigator-shared-comps Master Branch"
cd "logigator-shared-comps"
git checkout development
npm i
npm run build
cd ".."

echo "Checkout logigator-editor Development Branch"
cd "logigator-editor"
git checkout development
npm i
cd ".."

echo "Checkout logigator-home Development Branch"
cd "logigator-home"
git checkout development
npm i
cd ".."

echo "composer install logigator-backend"
cd "logigator-backend"
git checkout development
composer install
cd ".."
