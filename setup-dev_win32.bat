@echo off

SET mode=%*

IF "%mode%" == "https" (
	git clone https://github.com/logigator/logigator-editor.git
	git clone https://github.com/logigator/logigator-home.git
	git clone https://github.com/logigator/logigator-shared-comps.git
	git clone https://github.com/logigator/logigator-backend.git
	git clone https://github.com/logigator/logigator-simulation.git
)

IF "%mode%" == "ssh" (
	git clone git@github.com:logigator/logigator-editor.git
	git clone git@github.com:logigator/logigator-home.git
	git clone git@github.com:logigator/logigator-shared-comps.git
	git clone git@github.com:logigator/logigator-backend.git
	git clone git@github.com:logigator/logigator-simulation.git
)

echo "Checkout logigator-simulation Development Branch"
cd "logigator-simulation"
git checkout development
@CALL npm i
cd ".."

echo "Checkout logigator-shared-comps Master Branch"
cd "logigator-shared-comps"
git checkout master
@CALL npm i
@CALL npm run build
cd ".."

echo "Checkout logigator-editor Development Branch"
cd "logigator-editor"
git checkout development
cd ".."

echo "Checkout logigator-home Development Branch"
cd "logigator-home"
git checkout development
cd ".."

echo "Setting up local dependencies"
@CALL node setup-local-dependencies.js

echo "npm i logigator-editor"
cd "logigator-editor"
@CALL npm i
cd ".."

echo "npm i logigator-home"
cd "logigator-home"
@CALL npm i
cd ".."

echo "composer install logigator-backend"
cd "logigator-backend"
git checkout development
@CALL composer install
cd ".."
