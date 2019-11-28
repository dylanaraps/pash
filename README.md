# pash

A simple password manager using GPG written in POSIX `sh`.

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
    * [How can I use a public key?](#how-can-i-use-a-public-key)
    * [How do I set the password length?](#how-do-i-set-the-password-length)
    * [How do I change the password store location?](#how-do-i-change-the-password-store-location)
    * [How do I rename an entry?](#how-do-i-rename-an-entry)
    * [How can I extend `pash`?](#how-can-i-extend-pash)
    * [How do I change the clipboard tool?](#how-do-i-change-the-clipboard-tool)

<!-- vim-markdown-toc -->

## Dependencies

- `gpg` or `gpg2`

**Clipboard Support**:

- `xclip` (*can be customized through `PASH_CLIP`*).


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

I was looking for a CLI password manager (*written in shell*) and wasn't happy with the options I had found. They either had multiple instances of `eval` (*on user inputted data*), lots of unsafe `bash` (*nowhere near being `shellcheck` compliant.*) or they were overly complex. The opposites for what I'd want in a password manager.

I decided to write my own. `pash` is written in POSIX `sh` and the codebase is minimal (*100~ lines*). `gpg` is used to generate passwords and store them in encrypted files.

### Where are passwords stored?

The passwords are stored in GPG encrypted files located at `${XDG_DATA_HOME:=$HOME/.local/share}/pash}`.


### How can I use a public key?

Set the environment variable `PASH_KEYID` to the ID of the key you'd like to encrypt and decrypt passwords with.

Example:

```sh
# Default: 'unset'.
export PASH_KEYID=XXXXXXXX

# This can also be an email.
export PASH_KEYID=dylan.araps@gmail.com

# This can also be used as a one-off.
PASH_KEYID=XXXXXXXX pash add github
```

### How do I set the password length?

Set the environment variable `PASH_LENGTH` to a valid integer.

Example:

```sh
# Default: '50'.
export PASH_LENGTH=50

# This can also be used as a one-off.
PASH_LENGTH=10 pash add github
```

### How do I change the password store location?

Set the environment variable `PASH_DIR` to a directory.

```sh
# Default: '~/.local/share/pash'.
export PASH_DIR=~/.local/share/pash

# This can also be used as a one-off.
PASH_DIR=/mnt/drive/pash pash list
```

### How do I rename an entry?

It's a file! Standard UNIX utilities can be used here.

### How can I extend `pash`?

A shell function can be used to add new commands and functionality to `pash`. The following example adds `pash git` to execute `git` commands on the password store.

```sh
pash() {
    case $1 in
        g*)
            cd "${PASH_DIR:=${XDG_DATA_HOME:=$HOME/.local/share}/pash}"
            shift
            git "$@"
        ;;

        *)
            command pash "$@"
        ;;
    esac
}
```

### How do I change the clipboard tool?

Set the environment variable `PASH_CLIP` to a command.

```sh
# Default: 'xclip -selection clipboard'.
export PASH_DIR='xclip -selection clipboard'
```
