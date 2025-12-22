<div align="center">

# 🌌 CYBERECON
### *Recon Smart. Install Less. Think More.*

[![Bash Version](https://img.shields.io/badge/bash-%3E%3D4.0-antiquewhite?style=flat-square&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Made with Gum](https://img.shields.io/badge/made%20with-gum-7057ff?style=flat-square)](https://github.com/charmbracelet/gum)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![OS: Linux](https://img.shields.io/badge/OS-Linux-blue?style=flat-square&logo=linux&logoColor=white)](https://www.linux.org/)

**A precision-engineered terminal framework for modern web reconnaissance and OSINT.**

---

![CYBERECON Demo](https://raw.githubusercontent.com/<your-username>/cyberecon/main/assets/demo.gif)
*(Replace the URL above with your actual GIF link once uploaded)*

</div>

## 📖 Overview

**CYBERECON** is a terminal-based web reconnaissance framework designed to provide a clean, interactive, and organized interface for accessing commonly used OSINT, reconnaissance, and web security tools.

Inspired by the workflow of frameworks like **Metasploit** and **Recon-ng**, CYBERECON focuses on speed, clarity, and efficiency. It bridges the gap between manual bookmarking and complex automated scanners by putting the right tool in front of you exactly when you need it.

---

## ✨ Features

- ⌨️ **Interactive TUI**: Powered by [Charm Gum](https://github.com/charmbracelet/gum) for a smooth, keyboard-driven experience.
- 🔍 **Curated Intelligence**: Categories covering OSINT, Crypto, Payloads, and Domain Recon.
- 📖 **Contextual Help**: Integrated tool descriptions so you never have to guess a tool's purpose.
- 🚀 **Zero Friction**: Lightweight Bash script with minimal dependencies.
- 📂 **Modular Architecture**: Easy to add your own categories and tools via simple `.txt` and `.desc` files.

---

## 📁 Project Structure

```text
cyberecon/
├── bin/
│   └── cyberecon.sh             # Core execution engine
├── data/
│   └── web-tools/
│       ├── crypto.txt           # Tool URLs
│       ├── ...
│       └── descriptions/
│           ├── crypto.desc      # Tool descriptions
│           └── ...
├── install.sh                   # Automated setup script
├── README.md                    # Project documentation
└── LICENSE                      # Legal permissions
```
## ⚙️ Prerequisites

To enjoy the full interactive experience, ensure you have the following:

 -OS: Linux (Kali Linux, Parrot, or Ubuntu recommended)
 -Shell: Bash (v4+)
 -Browser: Firefox (Default) or any CLI-compatible browser
 -UI Engine: gum by Charm

Install Gum

```Bash
# For Debian/Ubuntu/Kali
sudo mkdir -p /etc/apt/keyrings
curl -fsSL [https://repo.charm.sh/apt/gpg.key](https://repo.charm.sh/apt/gpg.key) | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] [https://repo.charm.sh/apt/](https://repo.charm.sh/apt/) * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install gum
```
## 🚀 Installation & Usage
1. Clone the Repository

```Bash
git clone [https://github.com/](https://github.com/)<your-username>/cyberecon.git
cd cyberecon
```    
2. Run the Installer

```Bash
chmod +x install.sh
./install.sh
```
3. Launch the Framework
   
```Bash
cyberecon
```
## 🎯 Use Cases
    
Web Reconnaissance: Rapidly identify subdomains, tech stacks, and vulnerabilities.
    
 OSINT Collection: Deep-dive into usernames, emails, and social metadata.
    
CTF Preparation: Quickly access encoding/decoding tools and payload generators.
    
Training: An organized library for students to discover industry-standard tools.
    
## 📌 Roadmap
    
-[x] Global Search: Search for any tool across all categories instantly.
    
-[ ] Target Variables: Set a target domain once and pass it to all web tools automatically.
    
-[ ] Clipboard Support: Copy URLs to clipboard instead of just opening the browser.
    
-[ ] Custom Themes: Change the color palette of the UI via a config file.
    
## 🤝 Contributing
    
Contributions make the open-source community an amazing place to learn and create.
    
Fork the Project
    
Create your Feature Branch (git checkout -b feature/AmazingFeature)
    
Commit your Changes (git commit -m 'Add some AmazingFeature')
    
Push to the Branch (git push origin feature/AmazingFeature)
    
Open a Pull Request
    
## ⚠️ Disclaimer
    
[!WARNING] CYBERECON is intended strictly for educational and authorized security testing. The author is not responsible for misuse or illegal activity. Always obtain proper authorization before testing any system.
    
<div align="center"> Built with ❤️ by <b>Shanavas Shafi</b> </div>
