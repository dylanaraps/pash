# pash

A simple password manager using GPG.

```
pash
├─ dev/
│  ├─ github
├─ internet/
│  ├─ graalians
│  ├─ pixeljoint
│  ├─ nixers
└──┘
```

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [Dependencies](#dependencies)
* [Usage](#usage)
* [FAQ](#faq)
    * [How does this differ from `pass` or etc?](#how-does-this-differ-from-pass-or-etc)
    * [Where are passwords stored?](#where-are-passwords-stored)
* [TODO](#todo)

<!-- vim-markdown-toc -->

## Dependencies

- `bash 4+`
- `gpg` or `gpg2`

**Clipboard Support**:

- `xclip` or `tmux`


## Usage

Examples: `pash add web/gmail`, `pash list`, `pash del google`, `pash show github`, `pash copy github`.

```
SYNOPSIS

pash [ add|del|show|list|copy ] [name]

COMMANDS

[a]dd  [name] - Create a new password entry.
[c]opy [name] - Copy entry to the clipboard.
[d]el  [name] - Delete a password entry.
[l]ist        - List all entries.
[s]how [name] - Show password for an entry.
```

## FAQ

### How does this differ from `pass` or etc?

I was looking for a CLI password manager (*written in `bash`*) and wasn't happy with the options I had found. They either had multiple instances of `eval` (*on user inputted data*), lots of unsafe `bash` (*no where near being `shellcheck` compliant.*) or they were overly complex. The opposites for what I'd want in a password manager.

I decided to write my own. `pash` is written in pure `bash` (*minus `gpg`, `mkdir` and optionally `xclip`.*) and the codebase is minimal (*100~ lines*). `gpg` is used to generate passwords and store the generated passwords in encrypted files.

### Where are passwords stored?

The passwords are store in GPG encrypted files located at `${XDG_DATA_HOME:=$HOME/.local/share}/pash}`.


## TODO

- [x] Add support for not generating passwords.
- [x] Add support for categories.
- [x] Add an optional `tree` view.
- [x] Add support for both `gpg` and `gpg2`.
- [x] Man page.
- [x] Setup automatic linting.
- [x] Documentation.
- [ ] ~~Add support for using a public key.~~
