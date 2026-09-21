# 🤖 Jarvis — Personal AI Assistant

### A Real-Time Voice AI That Sees, Hears, and Controls Your Computer

A real-time voice AI that can hear, see, understand, and control your computer — on any OS. Supporting Windows, macOS, and Linux. Local execution. Zero subscriptions. Engineered for total autonomy.

---

## ✨ Overview

Jarvis bridges the gap between your operating system and your intent. Through natural dialogue, it analyzes your screen, processes uploaded documents, and executes complex workflows with an adaptive interface.

It's not just an assistant — it's an extension of your digital life.

---

## 🚀 Capabilities

### Core Features
| Feature | Description |
|---|---|
| 🎙️ Real-time Voice | Ultra-low latency conversation in any language |
| 🖥️ System Control | Launch apps, manage files, execute terminal commands |
| 🧩 Autonomous Tasks | High-level planning for complex, multi-step goals |
| 👁️ Visual Awareness | Real-time screen processing and webcam vision |
| 🧠 Persistent Memory | Deeply remembers your projects, preferences, and personal context |
| ⌨️ Hybrid Input | Seamlessly switch between keyboard typing and voice commands |

---

## 📁 Project Structure

### Core Files

| File | What it does |
|------|-------------|
| `main.py` | **Entry point.** Starts the UI, loads the AI engine, handles API key setup, manages the real-time voice loop and tool dispatch |
| `ui.py` | **Interface.** Qt5 graphical window with animated chat log, file upload area, system status badges, and audio visualization |
| `or_client.py` | **OpenRouter client.** Sends LLM requests to free-tier models via OpenRouter API for action modules |
| `setup.py` | Python package setup configuration |

### Configuration

| File | What it does |
|------|-------------|
| `core/prompt.txt` | **System prompt.** Defines Jarvis's personality, rules, tool selection logic, and language handling |
| `config/` | Stores API keys (`api_keys.json`) — excluded from Git |
| `.gitignore` | Keeps secrets, logs, cache, and virtual environments out of version control |
| `requirements.txt` | Base Python dependencies |
| `requirements-windows.txt` | Windows-specific packages (Qt5, audio, file processing) |
| `requirements-lock-windows.txt` | Pinned exact package versions for reproducibility |
| `LOCAL-SETUP.md` | Step-by-step setup guide for this machine |
| `Start-Jarvis.cmd` | Windows launcher — double-click to start |

### Action Modules (`actions/`)

Each module is a self-contained capability that Jarvis can invoke:

| File | What it does |
|------|-------------|
| `browser_control.py` | Automates web browsing via Playwright — navigate, click, extract data |
| `code_helper.py` | Executes and debugs code, saves output files to Desktop |
| `computer_control.py` | Controls mouse, keyboard, and takes screenshots |
| `computer_settings.py` | Adjusts volume, brightness, display, Wi-Fi, and system shortcuts |
| `desktop.py` | Runs Python code in a sandboxed environment |
| `dev_agent.py` | Builds development projects, generates code structures, analyzes repos |
| `file_controller.py` | Manages files — copy, move, rename, organize |
| `file_processor.py` | Reads and processes uploaded files: PDFs, source code, images |
| `flight_finder.py` | Searches for flights and returns travel options |
| `game_updater.py` | Updates Steam and Epic Games library titles |
| `open_app.py` | Launches applications by name |
| `reminder.py` | Sets reminders and notifications |
| `screen_processor.py` | Analyzes what's on screen using vision — describes, extracts, answers |
| `send_message.py` | Sends emails and messages |
| `web_search.py` | Searches the web and summarizes results |
| `weather_report.py` | Gets current weather for any location |
| `youtube_video.py` | Searches YouTube and summarizes video content |

### Memory (`memory/`)

| File | What it does |
|------|-------------|
| `memory_manager.py` | Extracts user preferences, projects, relationships, and habits from conversations and stores them for future sessions |
| `config_manager.py` | Reads and writes configuration files (API keys, settings) |
| `__init__.py` | Package initialization |

### Other

| File | What it does |
|------|-------------|
| `agent/` | Autonomous agent framework for multi-step planning tasks |
| `logs/` | Runtime logs — excluded from Git |

---

## ⚡ Quick Start

```bash
git clone https://github.com/gocar112/NewJarvis.git
cd NewJarvis
pip install -r requirements.txt
playwright install
python main.py
```

> ⚠️ **Installation Note:** Some OS-specific dependencies are not bundled in `requirements.txt`. If you see a `ModuleNotFoundError`, install the missing package with `pip install <module_name>`.

---

## 📋 Requirements

| Requirement | Details |
|---|---|
| **OS** | Windows 10/11, macOS, or Linux |
| **Python** | 3.11 or 3.12 |
| **Microphone** | Required for voice interaction |
| **API Keys** | Free Gemini API key + Free OpenRouter API key |

Get your keys:
- Gemini: https://aistudio.google.com/api-keys
- OpenRouter: https://openrouter.ai/keys

---

## 🚀 Getting Started

1. Clone the repository
2. Install dependencies: `pip install -r requirements.txt`
3. Install browser drivers: `playwright install`
4. Run: `python main.py`
5. Enter API keys in the setup screen and click **INITIALISE SYSTEMS**

For Windows, double-click **Start-Jarvis.cmd** or see `LOCAL-SETUP.md` for full setup details.
