@echo off
title Pawtato Bot by @MeoMunDep
python --version >nul 2>&1 || (
    echo Please install Python version higher than 3.10 first!
    pause
    exit
)

pip install -r requirements.txt

if not exist configs.json (
    echo Creating configs.json
    echo { > configs.json
    echo   "skipInvalidProxy": false, >> configs.json
    echo   "delayEachAccount": [1, 1], >> configs.json
    echo   "timeToRestartAllAccounts": 300, >> configs.json
    echo   "howManyAccountsRunInOneTime": 10, >> configs.json
    echo   "doTasks": true, >> configs.json
    echo   "uploadImages": true, >> configs.json
    echo   "updateName": true, >> configs.json
    echo   "connectWallets": true, >> configs.json
    echo   "answerQuestions": true >> configs.json
    echo } >> configs.json
)


if not exist datas.txt echo # game_data > datas.txt
if not exist suiAddresses.txt echo # suiAddresses > suiAddresses.txt
if not exist proxies.txt echo # proxies > proxies.txt

python meomundep.py
pause
