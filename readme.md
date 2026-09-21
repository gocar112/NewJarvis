# 🤖 Personal AI Assistant

### The Ultimate Cross-Platform Voice-Driven AI

A real-time voice AI that can hear, see, understand, and control your computer — on any OS. Supporting Windows, macOS, and Linux. Local execution. Zero subscriptions. Engineered for total autonomy.

---

## ✨ Overview

This AI assistant represents a flexible and robust system for bridging the gap between your operating system and your intent. Through natural dialogue, it analyzes your screen, processes uploaded documents, and executes complex workflows with an adaptive interface.

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

## ✨ Features

- 📂 **Advanced File Handling** — Direct file uploads. Drop PDFs, source code, or images into the assistant to have them analyzed, summarized, or edited instantly.
- 🎨 **Adaptive & Flexible UI** — Fully resizable and responsive interface with transparency controls and customizable layouts to fit your workspace.
- 🐧🍎 **Cross-Platform Stability** — Optimized for Windows, macOS, and Linux. Core system actions are consistent across all three operating systems.
- ⚡ **Optimized Core Engine** — Significant performance boost in tool-calling logic and response generation.
- 🔀 **OpenRouter Integration** — Action modules (web search, memory, flight finder, desktop control, and more) route their LLM calls through OpenRouter's free-tier models for increased request limits.

---

## ⚡ Quick Start

```bash
git clone https://github.com/gocar112/NewJarvis.git
cd NewJarvis
pip install -r requirements.txt
playwright install
python main.py
```

> ⚠️ **Installation Note:** To keep the repository lightweight, some OS-specific dependencies are not bundled in `requirements.txt`. If you run into a `ModuleNotFoundError`, simply install the missing package via `pip install <module_name>` for your specific system.

---

## 📋 Requirements

| Requirement | Details |
|---|---|
| **OS** | Windows 10/11, macOS, or Linux |
| **Python** | 3.11 or 3.12 |
| **Microphone** | Required for voice interaction |
| **API Keys** | Free Gemini API key + Free OpenRouter API key |

---

## 🚀 Getting Started

1. Clone the repository
2. Install dependencies: `pip install -r requirements.txt`
3. Install browser drivers: `playwright install`
4. Add your API keys to `config/api_keys.json`
5. Run: `python main.py`

For detailed setup instructions, see `LOCAL-SETUP.md`.
