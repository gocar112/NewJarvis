# 🤖 Jarvis — Personal AI Assistant

> A real-time voice AI that hears, sees, and controls your computer.  
> Windows · macOS · Linux · Local execution · Zero subscriptions.

---

## 📖 Table of Contents

1. [How It Works](#how-it-works)
2. [Project Tree](#project-tree)
3. [Quick Start](#quick-start)
4. [Requirements](#requirements)
5. [API Keys](#api-keys)
6. [Features](#features)

---

## How It Works

Jarvis is built on two AI engines that work together in real time.

```
You speak  →  Microphone  →  Gemini Live  →  Jarvis responds / calls a tool
                                                        ↓
                                              Tool runs (weather, browser, code...)
                                                        ↓
                                              Result sent back to Gemini Live
                                                        ↓
                                              Jarvis speaks the answer
```

### 1 — Real-Time Voice Loop (Gemini Live)

`main.py` opens a **persistent WebSocket connection** to Google's Gemini Live model (`gemini-2.5-flash-native-audio-preview`). Four async tasks run simultaneously:

| Task | What it does |
|------|-------------|
| `_listen_audio` | Captures microphone input at 16 kHz and streams it to Gemini |
| `_send_realtime` | Forwards audio/text chunks through the live session |
| `_receive_audio` | Receives Gemini's response — audio chunks or tool calls |
| `_play_audio` | Plays back Gemini's voice reply at 24 kHz through speakers |

When Gemini decides to call a tool, `_receive_audio` catches the `FunctionCall`, routes it to the right action module, and sends back a `FunctionResponse` so Gemini can continue the conversation.

### 2 — Action Modules (OpenRouter)

Heavy or specialist tasks (web search, file processing, screen vision, flights, etc.) are handled by 17 standalone modules in `actions/`. Each module makes its own LLM call through `or_client.py`, which routes to **free-tier OpenRouter models** — keeping the Gemini quota free for live voice.

```
Gemini Live calls tool "web_search"
      ↓
actions/web_search.py runs
      ↓
or_client.py → OpenRouter API → free LLM (Llama, Nemotron, etc.)
      ↓
Result returned to Gemini → spoken to user
```

### 3 — Memory

After every exchange, Jarvis checks whether the conversation contained anything worth remembering (your name, preferences, projects, relationships). If so, it silently calls `extract_memory()` via OpenRouter and writes the data to `memory/long_term.json`. This file is loaded at startup and injected into the system prompt — so Jarvis always knows who you are.

```
Conversation ends
      ↓
should_extract_memory() → quick LLM check (is this worth saving?)
      ↓ yes
extract_memory() → structured JSON (category, key, value)
      ↓
long_term.json updated
      ↓
Next session: memory injected into prompt → Jarvis remembers you
```

### 4 — User Interface

`ui.py` is a **Qt5 window** running in the main thread. It shows:
- Animated chat log with per-speaker colour coding
- Live status badge: `LISTENING` / `THINKING` / `SPEAKING`
- File drop area for uploading documents
- Mute toggle and keyboard input field

---

## Project Tree

```
NewJarvis/
│
├── Jarvis.cmd                  ← Windows launcher (double-click to start)
├── main.py                     ← Entry point: voice loop, tool dispatch, Gemini Live
├── ui.py                       ← Qt5 interface: chat window, badges, file upload
├── or_client.py                ← OpenRouter API client (free-tier LLM calls)
├── setup.py                    ← Python package configuration
│
├── core/
│   └── prompt.txt              ← Jarvis system prompt: personality, rules, tool guide
│
├── config/                     ← NOT in Git
│   └── api_keys.json           ← Your Gemini + OpenRouter keys (created on first run)
│
├── memory/
│   ├── memory_manager.py       ← Extract, store, load user long-term memory
│   ├── config_manager.py       ← Read/write config files
│   └── long_term.json          ← NOT in Git — your personal memory store
│
├── actions/                    ← 17 self-contained capability modules
│   ├── browser_control.py      ← Web browser automation (Playwright)
│   ├── code_helper.py          ← Run and debug code, save output to Desktop
│   ├── computer_control.py     ← Mouse, keyboard, screenshots
│   ├── computer_settings.py    ← Volume, brightness, Wi-Fi, display
│   ├── desktop.py              ← Sandboxed Python code execution
│   ├── dev_agent.py            ← Generate projects, analyze repos, write code
│   ├── file_controller.py      ← Copy, move, rename, organize files
│   ├── file_processor.py       ← Process uploads: PDF, DOCX, CSV, image, audio, video
│   ├── flight_finder.py        ← Search flights and travel options
│   ├── game_updater.py         ← Update Steam / Epic Games library
│   ├── open_app.py             ← Launch any application by name
│   ├── reminder.py             ← Set reminders and notifications
│   ├── screen_processor.py     ← Vision: describe, read, answer questions about screen
│   ├── send_message.py         ← Send emails and messages
│   ├── weather_report.py       ← Get current weather for any city
│   ├── web_search.py           ← Web search + summarise results
│   └── youtube_video.py        ← Search YouTube, summarise videos
│
├── agent/                      ← Multi-step autonomous task planner
│   ├── planner.py              ← Breaks complex goals into sub-tasks
│   ├── executor.py             ← Runs each sub-task in sequence
│   ├── task_queue.py           ← Manages task ordering and state
│   └── error_handler.py        ← Retries and fallback logic
│
├── requirements.txt            ← Base Python dependencies
├── requirements-windows.txt    ← Windows extras (Qt5, audio, file libs)
├── requirements-lock-windows.txt ← Pinned exact versions for this machine
├── .gitignore                  ← Excludes keys, logs, venv, cache
└── LOCAL-SETUP.md              ← Full setup guide for this Windows install
```

---

## Quick Start

### Step 1 — Get the code

```bash
git clone https://github.com/gocar112/NewJarvis.git
cd NewJarvis
```

### Step 2 — Install dependencies

```bash
pip install -r requirements.txt
```

> **Windows users:** use `requirements-windows.txt` for Qt5, audio, and file processing:
> ```bash
> pip install -r requirements-windows.txt
> ```

### Step 3 — Install browser drivers

```bash
playwright install
```

> Only needed for `browser_control` (web automation). Safe to skip if you don't need it.

### Step 4 — Get your API keys (free)

| Key | Where to get it |
|-----|----------------|
| **Gemini** | https://aistudio.google.com/api-keys |
| **OpenRouter** | https://openrouter.ai/keys |

Both are **free**. Gemini Free tier gives you access to the Live voice model. OpenRouter free tier covers all action modules.

### Step 5 — Run Jarvis

```bash
python main.py
```

**Windows:** double-click **`Jarvis.cmd`** instead.

### Step 6 — Enter your keys

On first launch a setup screen appears. Paste your Gemini and OpenRouter keys, select **Windows / macOS / Linux**, then click **INITIALISE SYSTEMS**.

Keys are saved to `config/api_keys.json` on your machine — they never leave your computer and are excluded from Git.

### Step 7 — Talk to Jarvis

The window shows **LISTENING** when Jarvis is ready. Speak naturally:

```
"What's the weather in Istanbul?"
"Search the web for the latest Python 3.14 features"
"Take a screenshot and describe what's on my screen"
"Open Spotify"
"Update my Steam games"
"Create a Python web scraper project"
```

---

## Requirements

| Requirement | Details |
|---|---|
| **OS** | Windows 10/11, macOS, or Linux |
| **Python** | 3.11 or 3.12 recommended (3.13+ may have audio issues) |
| **Microphone** | Required for voice input |
| **Speakers** | Required for voice output |
| **Internet** | Required for Gemini Live and OpenRouter calls |
| **API Keys** | Gemini (free) + OpenRouter (free) |

> ⚠️ Some OS-specific packages are not in `requirements.txt`.  
> If you see `ModuleNotFoundError`, run: `pip install <module_name>`

---

## API Keys

Jarvis uses two free APIs:

**Gemini** — powers the live voice conversation and tool-calling  
→ https://aistudio.google.com/api-keys

**OpenRouter** — routes LLM calls for action modules (web search, memory, vision, etc.)  
→ https://openrouter.ai/keys

Keys are stored locally in `config/api_keys.json` and never committed to Git.

---

## Features

| Feature | How |
|---------|-----|
| 🎙️ Real-time voice | Gemini Live WebSocket — ultra-low latency |
| 🖥️ System control | `computer_settings`, `computer_control` |
| 🧩 Autonomous tasks | `agent/` planner + `dev_agent` |
| 👁️ Screen vision | `screen_processor` — sees and describes your screen |
| 🧠 Persistent memory | `memory/` — remembers you across sessions |
| 📂 File processing | `file_processor` — PDF, DOCX, CSV, image, audio, video |
| 🌐 Web browsing | `browser_control` — Playwright automation |
| 🔍 Web search | `web_search` — search + summarise |
| 🎮 Game updates | `game_updater` — Steam and Epic |
| ✈️ Flight search | `flight_finder` |
| ☀️ Weather | `weather_report` |
| 🎬 YouTube | `youtube_video` — search + summarise |
| 📧 Messaging | `send_message` — email and messages |
| ⌨️ Hybrid input | Voice or type — switch anytime |
| 🌍 Multilingual | Responds in the language you speak |
