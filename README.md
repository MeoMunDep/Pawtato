# 🤖 Pawtato Bot - Complete Setup Guide

This comprehensive guide will help you set up and run the Pawtato Bot on Windows, macOS, or Linux. The bot automates certain game tasks efficiently and securely.

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [Installation Methods](#installation-methods)
  - [Standard Installation](#standard-installation)
  - [Docker Installation](#docker-installation)
- [Configuration](#configuration)
- [Running the Bot](#running-the-bot)
- [Using Proxies](#datas-and-proxies-and-sui-addresses)
- [Troubleshooting](#troubleshooting)
- [Security Recommendations](#security-recommendations)
- [Contact and Support](#contact-and-support)

## Prerequisites

Before setting up the bot, ensure you have the following installed:

- **Python 3.11.9** - Required to run the script
- **Git** (optional) - For cloning the repository
- **Docker** (optional) - For containerized deployment

## Installation Methods

You can choose between standard installation or Docker-based deployment.

### Standard Installation

#### 1. Install Python

<details>
<summary><b>Windows</b></summary>

- Download Python from [python.org](https://www.python.org/downloads/release/python-3119/)
- During installation, check "Add Python to PATH"
- Verify installation by opening Command Prompt and typing:
  ```
  python --version
  ```
  </details>

<details>
<summary><b>macOS</b></summary>

- Install [Homebrew](https://brew.sh/) first:
  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```
- Install Python using Homebrew:
  ```bash
  brew install python
  ```
- Verify installation:
  ```bash
  python3 --version
  ```
  </details>

<details>
<summary><b>Linux</b></summary>

- For Ubuntu/Debian:
  ```bash
  sudo apt update
  sudo apt install python3 python3-pip -y
  ```
- For CentOS/RHEL:
  ```bash
  sudo yum install python3 python3-pip -y
  ```
- Verify installation:
  ```bash
  python3 --version
  ```
  </details>

#### 2. Install Git (Optional)

<details>
<summary><b>Windows</b></summary>

- Download from [git-scm.com](https://git-scm.com/download/win)
- Use default settings during installation
</details>

<details>
<summary><b>macOS</b></summary>

```bash
brew install git
```

</details>

<details>
<summary><b>Linux (Debian/Ubuntu)</b></summary>

```bash
sudo apt install git -y
```

</details>

#### 3. Clone Repository (If using Git)

```bash
git clone https://github.com/MeoMunDep/pawtato.git
cd pawtato
```

#### 4. Install Required Packages

Navigate to the pawtato folder and run:

<details>
<summary><b>Windows</b></summary>

```
pip install -r requirements.txt
```

</details>

<details>
<summary><b>macOS/Linux</b></summary>

```bash
pip3 install -r requirements.txt
```

</details>

### Docker Installation

#### 1. Install Docker

<details>
<summary><b>Windows/macOS</b></summary>

- Download and install [Docker Desktop](https://www.docker.com/products/docker-desktop)
</details>

<details>
<summary><b>Linux</b></summary>

```bash
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
newgrp docker
```

</details>

#### 2. Create Dockerfile

Create a file named `Dockerfile` with the following content:

```dockerfile
FROM python:3.10.11-alpine3.18

RUN apk add --no-cache build-base libffi-dev openssl-dev

WORKDIR /app

COPY requirements.txt .

RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install --no-warn-script-location --no-cache-dir -r requirements.txt

COPY . .

CMD ["python3", "meomundep.py"]
```

#### 3. Create docker-compose.yml (Optional)

Create a file named `docker-compose.yml` with the following content:

```yaml
version: '3.8'
services:
  bot:
    container_name: 'pawtato'
    build:
      context: .
    stop_signal: SIGINT
    restart: unless-stopped
    command: 'python3 meomundep.py -a 1 -m y'
    volumes:
      - .:/app
    working_dir: /app
    tty: true
```

## Configuration

### Required Files

Ensure you have the following files in your folder:

- `meomundep.py` - Main bot script
- `configs.json` - Configuration file
- `datas.txt` - Bot data
- `suiAddresses.txt` - Sui address (optional)
- `proxies.txt` - List of proxies (optional)
- `requirements.txt` - List of required packages

### requirements.txt Content

```
aiohttp
aiohttp_proxy
beautifulsoup4
cloudscraper
colorama
pycryptodome
```

### Configurations (configs.json)

Edit the `configs.json` file to customize the bot's behavior:

```json
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
```

**Configuration Parameters:**

- `skipInvalidProxy`: Whether to skip accounts with invalid proxies
- `delayEachAccount`: Random delay range between processing accounts [min, max] in seconds
- `timeToRestartAllAccounts`: Time to wait before restarting all accounts (in seconds)
- `howManyAccountsRunInOneTime`: Number of accounts to run simultaneously
- `doTasks`: Whether to perform tasks automatically
- `uploadImages`: Enable image upload feature
- `updateName`: Enable automatic name updates
- `connectWallets`: Enable wallet connection feature
- `answerQuestions`: Enable auto-answering of questions

## Running the Bot

### Standard Method

<details>
<summary><b>Windows</b></summary>

```
python meomundep.py
```

Or double-click the provided `run.bat` file.

</details>

<details>
<summary><b>macOS/Linux</b></summary>

```bash
python3 meomundep.py
```

Or make the script executable and run:

```bash
chmod +x run.sh && ./run.sh
```

</details>

### Docker Method

<details>
<summary><b>Build and Run with Docker</b></summary>

```bash
docker build -t pawtato .

docker run -it --rm -v ${PWD}/data:/app/data --name pawtato-container pawtato
```

</details>

<details>
<summary><b>Using Docker Compose</b></summary>

```bash
docker-compose up --build
```

</details>

## 🔒 File Permissions

### Windows

```
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

### Linux/macOS

```bash
chmod 600 configs.json suiAddresses.txt datas.txt proxies.txt meomundep.py
```

## Datas and Proxies and Sui Addresses

- Fill the data for `datas.txt` file, get data from [here](https://t.me/KeoAirDropFreeNe/257/6879).
- This file contains user data in the following format:

```txt
query_id.../user...
query_id.../user...
query_id.../user...
```

- If you want to connect your Sui wallets, add them here. Leave the file blank if you are not using Sui wallets. Supported formats:

```txt
0x...
0x...
0x...
```

_Note: each row for each account_

- If you are using proxies, add them here. Leave the file blank if you are not using proxies. Supported formats:

```txt
http://host:port
https://host:port
socks4://host:port
socks5://host:port
http://user:password@host:port
https://user:password@host:port
socks4://user:password@host:port
socks5://user:password@host:port
```

_Note: each row for each account_

## Troubleshooting

<details>
<summary><b>Bot crashes on startup</b></summary>

- Ensure all required packages are installed
- Check your Python version (Python 3.10.xx above required)
- Verify configuration file format
</details>

<details>
<summary><b>Connection errors</b></summary>

- Check your internet connection
- Verify proxy settings if using proxies
- Check if the required endpoints are accessible
</details>

<details>
<summary><b>Authentication failures</b></summary>

- Ensure your bot data is correct
- Check if your IP or proxy is blocked
</details>

## Security Recommendations

1. **Data Protection**:

   - Keep your `datas.txt` and configuration files secure
   - Use file permissions to restrict access

2. **Docker Security**:

   - Run Docker containers as non-root user:
     ```bash
     docker run -u 1000:1000 pawtato
     ```
   - Keep your Docker installation up-to-date

3. **Proxy Usage**:
   - Use secure proxies from trusted providers
   - Rotate proxies periodically to avoid IP bans

## 📝 Security Notice

The executable file is obfuscated to protect the source code. This is normal and doesn't indicate malicious behavior.

## Contact and Support

- **Support me via** [Referral Link](https://t.me/PawtatoBot?start=goFiBMa4dFx8)
- **Support me via Donate** [Here](https://t.me/KeoAirDropFreeNe/312/27801)
- **Contact for work:** [Telegram](https://t.me/MeoMunDep)
- **Join the support group:** [Join here](https://t.me/KeoAirDropFreeNe)
- **Updates Channel:** [View channel](https://t.me/KeoAirDropFreeNee)
- **YouTube Channel:** [Watch here](https://www.youtube.com/@keoairdropfreene)
- **Instagram:** [Follow me](https://www.instagram.com/meomundep)
- **Tiktok:** [Follow me](https://www.tiktok.com/@meomundep)

⚠️ **Disclaimer**: This code is provided "as is" without any warranties. Use it at your own risk. You are solely responsible for any consequences arising from its use. Redistribution or sale of this code in any form is strictly prohibited.

✨ Thank you for using the bot! Good luck! 🚀
