# Vim Cheatsheet

## Modes
| Mode | How to enter | What it does |
|------|-------------|--------------|
| Normal | `Esc` | Navigate and run commands |
| Insert | `i` | Type and edit text |
| Visual | `v` | Select text |
| Command | `:` | Run vim commands |

## Opening & Closing
```bash

vim file.txt        # Open file
vim +50 file.txt    # Open at line 50
:w                  # Save
:q                  # Quit
:wq                 # Save and quit
:q!                 # Quit without saving
:x                  # Save and quit (shorter)
ZZ                  # Save and quit (fastest)

## Navigation (Normal Mode)
| Key | What it does |
|-----|-------------|
| `h` | Move left |
| `l` | Move right |
| `j` | Move down |
| `k` | Move up |
| `w` | Jump forward one word |
| `b` | Jump backward one word |
| `0` | Go to start of line |
| `$` | Go to end of line |
| `gg` | Go to first line |
| `G` | Go to last line |
| `50G` | Go to line 50 |
| `Ctrl+f` | Page down |
| `Ctrl+b` | Page up |

## Editing (Normal Mode)
| Key | What it does |
|-----|-------------|
| `i` | Insert before cursor |
| `a` | Insert after cursor |
| `o` | New line below |
| `O` | New line above |
| `x` | Delete character |
| `dd` | Delete line |
| `5dd` | Delete 5 lines |
| `yy` | Copy line |
| `5yy` | Copy 5 lines |
| `p` | Paste after |
| `P` | Paste before |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `r` | Replace one character |
| `cw` | Change word |

## Search & Replace
```bash


/word           # Search forward for word
?word           # Search backward for word
n               # Next match
N               # Previous match
:%s/old/new/g   # Replace all in file
:%s/old/new/gc  # Replace all with confirmation
:5,10s/old/new/g # Replace in lines 5-10

## Visual Mode
| Key | What it does |
|-----|-------------|
| `v` | Select characters |
| `V` | Select lines |
| `Ctrl+v` | Select block |
| `y` | Copy selection |
| `d` | Delete selection |
| `>` | Indent selection |
| `<` | Unindent selection |

## Useful Commands
```bash
:set number         # Show line numbers
:set nonumber       # Hide line numbers
:set hlsearch       # Highlight search results
:syntax on          # Enable syntax highlighting
:50                 # Go to line 50
:%y                 # Copy entire file
:r file.txt         # Insert file contents here
