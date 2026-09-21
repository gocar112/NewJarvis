# Jarvis on this PC

Source: https://github.com/FatihMakes/Mark-XXXIX-OR (commit eac6378).

Double-click `Start-Jarvis.cmd` to start. It uses the private Python 3.12
environment in `.venv`, independent of the system Python 3.14.

On first launch, enter your Gemini and OpenRouter API keys in the setup screen,
leave Windows selected, and click **INITIALISE SYSTEMS**.
Keys are stored locally in `config/api_keys.json`, which is excluded from Git.
Get keys from https://aistudio.google.com/api-keys and https://openrouter.ai/keys.
Live voice and AI actions require valid keys, network access, and available API quota.

The upstream project is a Python application; it has no compilation step.
The local installation includes its Python dependencies and Playwright browsers.
`requirements-windows.txt` adds the missing Qt interface and file-processing dependencies.

To recreate the environment from PowerShell in this folder with `uv` installed:

```powershell
$env:UV_PYTHON_INSTALL_DIR = Join-Path $PWD '.python'
$env:UV_CACHE_DIR = Join-Path $PWD '.uv-cache'
$env:PLAYWRIGHT_BROWSERS_PATH = Join-Path $PWD '.playwright'
uv python install 3.12
uv venv --python 3.12 --seed .venv
uv pip install --python .venv\Scripts\python.exe -r requirements-windows.txt
.venv\Scripts\python.exe -m playwright install
```

Optional media conversion actions also require FFmpeg and ffprobe on PATH.
The repository does not include `face.png`; the interface supports its absence.

## Installation verification

- Python 3.12.13; dependency consistency check passed.
- All application modules compile, and the main module imports.
- Qt setup screen and event loop start successfully.
- Gemini Live configuration validates with all 20 tool declarations.
- Windows audio input and output devices are detected.
- FFmpeg and ffprobe are already available on this PC.
- Exact installed package versions are saved in `requirements-lock-windows.txt`.

To reproduce those versions, use the lock file in place of
`requirements-windows.txt` in the install command above.

Live API requests and voice interaction have not been tested: API keys are
required. Upstream still uses the deprecated `google.generativeai` package in
some actions; its startup warning does not prevent the interface from loading.

Playwright browser installation completed, and Chromium passed a headless page smoke test.

## Desktop shortcut and location

Installed at `C:\Users\ghostman\Desktop\AIOS\NewJarvis`.
Double-click the **Jarvis** desktop shortcut to launch.
The Python environment was rebuilt after relocation; UI startup and browser
launch were checked again at the new location.
