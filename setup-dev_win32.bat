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

echo "Checkout logigator-shared-comps Development Branch"
cd "logigator-shared-comps"
git checkout development
@CALL npm i
@CALL npm run build
cd ".."

echo "Checkout logigator-editor Development Branch"
cd "logigator-editor"
git checkout development
@CALL npm i
cd ".."

echo "Checkout logigator-home Development Branch"
cd "logigator-home"
git checkout development
@CALL npm i
cd ".."

echo "Checkout logigator-backend Development Branch"
cd "logigator-backend"
git checkout development
@CALL composer install
cd ".."
