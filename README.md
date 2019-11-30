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
    * [How do I change the clipboard tool?](#how-do-i-change-the-clipboard-tool)
    * [How do I change the clipboard timeout?](#how-do-i-change-the-clipboard-timeout)
    * [How do I change the password generation pattern?](#how-do-i-change-the-password-generation-pattern)
    * [How do I rename an entry?](#how-do-i-rename-an-entry)
    * [How can I migrate from `pass` to `pash`?](#how-can-i-migrate-from-pass-to-pash)
    * [How can I extend `pash`?](#how-can-i-extend-pash)

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
[t]ree        - List all entries in a tree.

OPTIONS

Using a key pair:  export PASH_KEYID=XXXXXXXX
Password length:   export PASH_LENGTH=50
Password pattern:  export PASH_PATTERN=_A-Z-a-z-0-9
Store location:    export PASH_DIR=~/.local/share/pash
Clipboard tool:    export PASH_CLIP='xclip -sel c'
Clipboard timeout: export PASH_TIMEOUT=15 ('off' to disable)
```

## FAQ

### How does this differ from `pass` or etc?

I was looking for a CLI password manager (*written in shell*) and wasn't happy with the options I had found. They either had multiple instances of `eval` (*on user inputted data*), lots of unsafe shell (*nowhere near being `shellcheck` compliant.*) or they were overly complex. The opposites for what I'd want in a password manager.

I decided to write my own. `pash` is written in POSIX `sh` and the codebase is minimal (*120~ LOC minus blank lines and comments*).

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

### How do I change the clipboard tool?

Set the environment variable `PASH_CLIP` to a command.

```sh
# Default: 'xclip -sel c'.
export PASH_CLIP='xclip -sel c'

# This can also be used as a one-off.
PASH_CLIP='xclip -sel c' pash copy github
```

### How do I change the clipboard timeout?

Set the environment variable `PASH_TIMEOUT` to a valid `sleep` interval or `off` to disable the feature.

```sh
# Default: '15'
export PASH_TIMEOUT=15

# Disable timeout.
export PASH_TIMEOUT=off

# This can also be used as a one-off.
PASH_TIMEOUT=5 pash copy github
```

### How do I change the password generation pattern?

Set the environment variable `PASH_PATTERN` to a valid `tr` string.

```sh
# Default: '_A-Z-a-z-0-9'.
export PASH_PATTERN=_A-Z-a-z-0-9

# This can also be used as a one-off.
PASH_PATTERN=_A-Z-a-z-0-9 pash add hackernews
```

### How do I rename an entry?

It's a file! Standard UNIX utilities can be used here.


### How can I migrate from `pass` to `pash`?

I cannot guarantee 100% compatibility with the stores from `pass` as `pash` wasn't written as a 1:1 replacement, however users have reported that `pash` does in fact work fine with `pass`' store.

Add the following to your `.shellrc` or `.profile`.

```
read -r PASH_KEYID < "$PASH_DIR/.gpg-id"

export PASH_DIR=${PASSWORD_STORE_DIR:-$HOME/.password-store}
export PASH_KEYID
```

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
