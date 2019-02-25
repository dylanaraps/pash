# pash

A simple password manager using GPG.

<!-- vim-markdown-toc GFM -->

* [Dependencies](#dependencies)
* [Usage](#usage)
* [FAQ](#faq)
        * [Where are passwords stored?](#where-are-passwords-stored)
* [TODO](#todo)

<!-- vim-markdown-toc -->

## Dependencies

- `bash`
- `gpg2`

**Clipboard Support**:

- `xclip` or `tmux`


## Usage

Examples: `pash add web/gmail`, `pash list`, `pash del google`, `pash show github`.

```
SYNOPSIS

pash [ add|del|show|list ] [name] [ -ncqhv ] [ -l length ]

COMMANDS

[a]dd [name]: Create a new entry in the password store.
[d]el [name]: Delete an entry from the password store.
[s]how [name]: Show password from an entry in the password store.
[l]ist: List all entries from the password store.

OPTIONS

−n Limit passwords to alphanumeric characters.
−l Length of generated passwords.
−c Copy password to clipboard.
−q Don't print password to stdout.
−h Show usage and exit.
−v Show version and exit.
```

## FAQ

#### Where are passwords stored?

The passwords are store in GPG encrypted files located at `${XDG_DATA_HOME:=$HOME/.local/share}/pash}`.


## TODO

- [x] Add support for not generating passwords.
- [x] Add support for categories.
- [ ] Add an optional `tree` view.
- [x] Add support for both `gpg` and `gpg2`.
- [x] Man page.
- [x] Setup automatic linting.
- [x] Documentation.
