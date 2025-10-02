# 🚀 0xMarvul Discovery

A powerful reconnaissance and information disclosure scanner designed for bug bounty hunting and penetration testing.

![Bash](https://img.shields.io/badge/bash-%23121011.svg?style=flat&logo=gnu-bash&logoColor=white)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

## 📖 Overview

**0xMarvul Discovery** automates the discovery of sensitive files and misconfigurations across web applications by combining subdomain enumeration with intelligent path scanning.

```
==============================================
   🚀 0xMarvul Recon & Info-Disclosure Scanner
==============================================
```

## ✨ Features

- 🔍 **Subdomain Enumeration** - Automatically discovers all subdomains using `subfinder`
- 🎯 **Targeted Path Scanning** - Tests curated lists of sensitive file paths
- ✅ **Live Filtering** - Only shows accessible URLs (HTTP 200) using `httpx`
- 📊 **Categorized Scanning** - Organized checks for different vulnerability types
- 💾 **Automatic Reporting** - Saves all findings to a domain-specific output file

## 🔎 What It Discovers

| Category | Examples |
|----------|----------|
| **Config Files** | `.env`, `config.json`, `firebase.json`, `api_keys.json` |
| **Backups** | `.zip`, `.sql`, `.bak`, `backup.tar.gz` |
| **Git Exposure** | `.git/` directories, `.git-credentials` |
| **API Documentation** | Swagger UI, OpenAPI specs, Postman collections |
| **Log Files** | `debug.log`, `error.log`, `laravel.log` |
| **Miscellaneous** | `robots.txt`, `security.txt` |

## 🛠️ Installation

### Prerequisites

You need to have Go installed on your system.

### Dependencies

This tool requires:
- [subfinder](https://github.com/projectdiscovery/subfinder) - Subdomain discovery
- [httpx](https://github.com/projectdiscovery/httpx) - HTTP toolkit

### Quick Install

```bash
# Clone the repository
git clone https://github.com/0xmarvul/0xmarvul-discovery.git
cd 0xmarvul-discovery

# Make the script executable
chmod +x 0xmarvul_discovery.sh

# Install dependencies (optional helper script)
chmod +x install.sh
./install.sh
```

### Manual Dependency Installation

```bash
# Install subfinder
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Install httpx
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

# Ensure Go bin is in your PATH
export PATH=$PATH:$(go env GOPATH)/bin
```

## 🚀 Usage

### Basic Usage

```bash
./0xmarvul_discovery.sh example.com
```

### Example Output

```
==============================================
   🚀 0xMarvul Recon & Info-Disclosure Scanner
==============================================
Target Domain: example.com
Results will be saved to: discovery_example.com.txt
------------------------------------------------------

[+] Scanning Category: Sensitive Configs
https://app.example.com/.env [200] [Example App - Login]
https://api.example.com/config.json [200] [API Configuration]

[+] Scanning Category: Backups & Old Files
https://old.example.com/backup.zip [200] [Index of /]

[+] Scanning Category: Exposed Git
https://dev.example.com/.git/HEAD [200]

[✓] Done! Check discovery_example.com.txt for full results.
```

## 🎯 Common Vulnerabilities Found

- **CWE-200**: Information Disclosure
- **OWASP A02**: Cryptographic Failures (Sensitive Data Exposure)
- **OWASP A05**: Security Misconfiguration
- **CWE-538**: Insertion of Sensitive Information into Externally-Accessible File

## ⚠️ Legal Disclaimer

**IMPORTANT**: This tool is designed for **authorized security testing only**.

- ✅ Only use on domains you own or have explicit permission to test
- ✅ Respect bug bounty program rules and scope
- ✅ Follow responsible disclosure practices
- ❌ Unauthorized access to computer systems is illegal

**By using this tool, you agree to:**
- Use it only for legal and ethical purposes
- Take full responsibility for your actions
- Comply with all applicable laws and regulations

The author (@0xmarvul) is not responsible for any misuse or damage caused by this tool.

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

**0xMarvul**
- GitHub: [@0xmarvul](https://github.com/0xmarvul)

## 🙏 Acknowledgments

- [ProjectDiscovery](https://github.com/projectdiscovery) for amazing tools (subfinder & httpx)
- The bug bounty and infosec community

## 📞 Support

If you find this tool useful, please consider:
- ⭐ Starring the repository
- 🐛 Reporting bugs or issues
- 💡 Suggesting new features
- 📢 Sharing with the community

## 📫 Contact

Feel free to reach out for collaboration, feedback, or inquiries:

- **Email:** marwankhodair0@gmail.com
- **LinkedIn:** [www.linkedin.com/in/marwan-khodair](https://www.linkedin.com/in/marwan-khodair)

---

**Happy Hunting! 🎯**
