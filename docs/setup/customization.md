# Customizing Termux (termux.properties)

**What is this file?**

`~/.termux/termux.properties` is Termux's personal config file. It controls how the terminal looks and behaves — things like cursor style, what the extra keys row shows, whether the volume button acts as a shortcut key, and more.

Most users never touch it, but even a few small changes make Termux much more comfortable to use daily.

**Step 1 — Open or create the file:**
```bash
# Create the config directory if it doesn't exist yet
mkdir -p ~/.termux

# Open the file in a text editor
nano ~/.termux/termux.properties
```

**Step 2 — Apply changes:**

After saving the file, changes don't apply instantly. Either:
```bash
# Option A: Kill and restart Termux from the recents screen
# Option B: Run this to reload without closing
termux-reload-settings
```

---

## Font & Display

Change font size in the terminal with a two-finger pinch gesture when using a touch keyboard, or use **Ctrl+Alt+Plus/Minus** with a hardware keyboard. Font size is not set through `termux.properties`.

```properties
# Scrollback lines — how far you can scroll up (default 2000)
terminal-transcript-rows = 5000

# Cursor style: block | underline | bar
terminal-cursor-style = bar

# Cursor blink speed in ms (0 = no blink)
terminal-cursor-blink-rate = 600

# Force full-screen terminal (hides Android status bar)
fullscreen = true
```

---

## Keyboard & Button Behaviour

```properties
# What the back button does:
# "back"   = normal Android back navigation (default)
# "escape" = sends Escape key (useful for vim/neovim users)
back-key = escape

# What the volume keys do:
# "volume"  = normal volume control
# "virtual" = special-key behavior (default: Volume Down as Ctrl, Volume Up for shortcuts)
volume-keys = virtual

# Use this if your keyboard input feels laggy or doubled
enforce-char-based-input = true
```

---

## Extra Keys Row

The extra keys row is the strip of special keys above the keyboard (Ctrl, Alt, Tab, arrows, etc.). This is the most useful thing to customise.

```properties
# Format: a two-dimensional array; commas separate rows and keys within each row
# Each key can be a label string or a special key name

# Simple row (one row of common keys):
extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]

# Two rows:
extra-keys = [['ESC','TAB','CTRL','ALT','DEL','BKSP'],['UP','DOWN','LEFT','RIGHT','HOME','END']]

# Row with custom labels and special characters:
extra-keys = [['ESC','|','/','BACKSLASH','~','[',']'],['CTRL','ALT','TAB','LEFT','DOWN','UP','RIGHT']]
```

**Available key names:**
`CTRL`, `ALT`, `SHIFT`, `FN`, `ESC`, `TAB`, `HOME`, `END`, `PGUP`, `PGDN`, `UP`, `DOWN`, `LEFT`, `RIGHT`, `DEL`, `BKSP`, `ENTER`, `BACKSLASH`, `SPACE`

---

## Shell Customisation — Switch to zsh

Termux uses bash by default. zsh (with oh-my-zsh) gives you better autocomplete, history search, and a more informative prompt.

**Step 1 — Install zsh:**
```bash
pkg install zsh
```

**Step 2 — Install oh-my-zsh (adds themes and plugins):**
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
When it asks if you want to change your default shell, say **yes**.

**Step 3 — Verify zsh is your default:**
```bash
echo $SHELL
# Should show: /data/data/com.termux/files/usr/bin/zsh
```

**Step 4 — Switch manually any time:**
```bash
# Switch back to bash
bash

# Switch to zsh
zsh
```

**Useful zsh shortcuts once installed:**
- Type the start of a previous command → press **↑** to autocomplete from history
- Press **Tab** twice to see all options for any command
- `cd -` to jump to the previous directory

**Optional — Starship prompt (fast cross-shell prompt):**
```bash
# Install via cargo (requires rust to be installed)
cargo install starship

# Or via the install script
curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir $PREFIX/bin

# Add to ~/.zshrc or ~/.bashrc:
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
```

---
