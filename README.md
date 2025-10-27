# 🥔 **Pawtato Bot - Complete Setup Guide**

This comprehensive guide walks you through installing, configuring, and running the **Pawtato Bot** on **Windows**, **macOS**, or **Linux**.
It automates Pawtato game tasks **efficiently, securely, and hands-free**.

---

## 📖 **Table of Contents**

* [⚙️ Prerequisites](#️-prerequisites)
* [💾 Installation Methods](#-installation-methods)

  * [📦 Standard Installation](#-standard-installation)
  * [🐳 Docker Installation](#-docker-installation)
* [🧩 Configuration](#-configuration)
* [🚀 Running the Bot](#-running-the-bot)
* [🌐 Datas, Proxies & Sui Addresses](#-datas-proxies--sui-addresses)
* [🧰 Troubleshooting](#-troubleshooting)
* [🔐 Security Recommendations](#-security-recommendations)
* [📞 Contact & Support](#-contact--support)

---

## ⚙️ Prerequisites

Before starting, make sure you have the following:

✅ **Python 3.11.9 or newer**
✅ **Git** (optional, for cloning repo)
✅ **Docker** (optional, for containerized setup)

---

## 💾 Installation Methods

You can install using **Python (Standard)** or **Docker (Advanced)**.

---

### 📦 Standard Installation

#### 🪟 Windows

<details>
<summary><b>📥 Step-by-step (click to expand)</b></summary>

1. Download **Python 3.11.9** from [python.org](https://www.python.org/downloads/release/python-3119/)
2. Check “✅ Add Python to PATH” during install
3. Open CMD and verify:

   ```bash
   python --version
   ```
4. (Optional) Install Git:

   * Download from [git-scm.com](https://git-scm.com/download/win)
   * Use default options
5. Clone the bot:

   ```bash
   git clone https://github.com/MeoMunDep/pawtato.git
   cd pawtato
   ```
6. Install dependencies:

   ```bash
   pip install -r requirements.txt
   ```

</details>

---

#### 🍎 macOS

<details>
<summary><b>📥 Step-by-step (click to expand)</b></summary>

1. Install [Homebrew](https://brew.sh/):

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
2. Install Python:

   ```bash
   brew install python
   ```
3. Verify:

   ```bash
   python3 --version
   ```
4. Install Git:

   ```bash
   brew install git
   ```
5. Clone and install:

   ```bash
   git clone https://github.com/MeoMunDep/pawtato.git
   cd pawtato
   pip3 install -r requirements.txt
   ```

</details>

---

#### 🐧 Linux (Ubuntu/Debian/CentOS)

<details>
<summary><b>📥 Step-by-step (click to expand)</b></summary>

```bash
sudo apt update
sudo apt install python3 python3-pip git -y
git clone https://github.com/MeoMunDep/pawtato.git
cd pawtato
pip3 install -r requirements.txt
```

</details>

---

### 🐳 Docker Installation

#### 🧱 Install Docker

<details>
<summary><b>💻 Windows/macOS</b></summary>

Download and install [Docker Desktop](https://www.docker.com/products/docker-desktop)

</details>

<details>
<summary><b>🐧 Linux</b></summary>

```bash
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
newgrp docker
```

</details>

---

#### 🧩 Create Dockerfile

```dockerfile
FROM python:3.10.11-alpine3.18

RUN apk add --no-cache build-base libffi-dev openssl-dev
WORKDIR /app

COPY requirements.txt .
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .
CMD ["python3", "meomundep.py"]
```

---

#### ⚙️ Optional docker-compose.yml

```yaml
version: '3.8'
services:
  bot:
    container_name: 'pawtato'
    build: .
    stop_signal: SIGINT
    restart: unless-stopped
    command: 'python3 meomundep.py -a 1 -m y'
    volumes:
      - .:/app
    tty: true
```

---

## 🧩 Configuration

Ensure your folder contains:

```
meomundep.py
configs.json
datas.txt
suiAddresses.txt
proxies.txt
requirements.txt
```

### 📦 Example `requirements.txt`

```
aiohttp
aiohttp_proxy
beautifulsoup4
cloudscraper
colorama
pycryptodome
```

### ⚙️ Example `configs.json`

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

🧠 **Meaning of settings:**

| Key                           | Description                                 |
| ----------------------------- | ------------------------------------------- |
| `skipInvalidProxy`            | Skip accounts with broken proxies           |
| `delayEachAccount`            | Delay range between runs `[min, max]` (sec) |
| `timeToRestartAllAccounts`    | Restart time for all accounts               |
| `howManyAccountsRunInOneTime` | Concurrent accounts                         |
| `doTasks`                     | Auto complete all available tasks           |
| `uploadImage`                 | Enable auto avatar upload                   |
| `updateName`                  | Randomly update account name                |
| `connectWallet`               | Link your wallet                            |
| `answerQuestions`             | Auto-answer Pawtato quiz                    |

---

## 🚀 Running the Bot

### 🧭 Standard Run

<details>
<summary><b>🪟 Windows</b></summary>

```bash
python meomundep.py
```

Or double-click `run.bat`.

</details>

<details>
<summary><b>🐧 macOS/Linux</b></summary>

```bash
python3 meomundep.py
```

Or make it executable:

```bash
chmod +x run.sh && ./run.sh
```

</details>

---

### 🐳 Docker Run

<details>
<summary><b>🔧 Build and Run (Manual)</b></summary>

```bash
docker build -t pawtato .
docker run -it --rm -v ${PWD}/data:/app/data --name pawtato-container pawtato
```

</details>

<details>
<summary><b>🧩 Using docker-compose</b></summary>

```bash
docker-compose up --build
```

</details>

---

## 🌐 Datas, Proxies & Sui Addresses

### 📄 datas.txt

Each line = one account
Get from [Telegram Data Source](https://t.me/KeoAirDropFreeNe/257/6879)

```
query_id.../user...
query_id.../user...
```

### 💰 suiAddresses.txt

(If using Sui wallets)

```
0x123...
0x456...
```

### 🌍 proxies.txt

(Each line per account)

```
http://host:port
https://user:pass@host:port
socks5://host:port
```

---

## 🧰 Troubleshooting

<details>
<summary>❌ <b>Bot crashes on start</b></summary>

* Verify Python version ≥ 3.10
* Reinstall dependencies
* Check configs.json syntax

</details>

<details>
<summary>🌐 <b>Connection errors</b></summary>

* Check internet
* Verify proxy list
* Ensure endpoints reachable

</details>

<details>
<summary>🔑 <b>Authentication failures</b></summary>

* Double-check datas.txt
* Try new IP / proxy

</details>

---

## 🔐 Security Recommendations

1. **Keep your data safe**

   * Don’t share `datas.txt` or private configs
   * Use `chmod 600` or Windows ACLs to restrict access

2. **Use trusted proxies only**

   * Avoid public/free proxies
   * Rotate them regularly

3. **Secure Docker**

   ```bash
   docker run -u 1000:1000 pawtato
   ```

---

## 📝 Security Notice

> The script may appear obfuscated to protect logic — **this is normal**.
> No malicious behavior is involved.

---

## 📞 Contact & Support

* 💬 **Author:** [@MeoMunDep](https://t.me/MeoMunDep)
* 👥 **Group:** [Join Support Group](https://t.me/KeoAirDropFreeNe)
* 📢 **Updates Channel:** [View Channel](https://t.me/KeoAirDropFreeNee)
* 💰 **Support / Donate:** [Here](https://t.me/KeoAirDropFreeNe/312/27801)
* 📺 **YouTube:** [@keoairdropfreene](https://www.youtube.com/@keoairdropfreene)
* 📸 **Instagram:** [@meomundep](https://www.instagram.com/meomundep)
* 🎵 **Tiktok:** [@meomundep](https://www.tiktok.com/@meomundep)

---

⚠️ **Disclaimer:**
This tool is provided “as-is”. You’re solely responsible for your usage. Redistribution or resale is **strictly prohibited**.

---

✨ **Thank you for using Pawtato Bot!**
💪 Enjoy automation, save time, and grow faster!

