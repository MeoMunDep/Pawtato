#!/bin/bash

if ! command -v python3 &> /dev/null; then
    echo "Please install Python version higher than 3.10 first!"
    exit 1
fi

pip install -r requirements.txt

if [ ! -f configs.json ]; then
    echo "Creating configs.json..."
    cat > configs.json <<EOL
{
  "skipInvalidProxy": false,
  "delayEachAccount": [1, 1],
  "timeToRestartAllAccounts": 300,
  "howManyAccountsRunInOneTime": 10,
  "doTasks": true,
  "uploadImage": true,
  "updateName": true,
  "connectWallet": true,
  "answerQuestions": true
}
EOL
fi

[ ! -f datas.txt ] && echo "# bot_data" > datas.txt
[ ! -f proxies.txt ] && echo "# proxies" > proxies.txt
[ ! -f suiAddresses.txt ] && echo "# suiAddresses" > suiAddresses.txt

python meomundep.py
