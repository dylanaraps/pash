# pash

A simple password manager using GPG.


## Dependencies

- `bash`
- `gpg2`


## Usage

Examples:
    - `pash add web/gmail`,
    - `pash list`,
    - `pash del google`,
    - `pash show github`.

```
pash - simple password manager.
usage: pash [add|del|show|list] [name] [-n,-q,-c] [-l length]

-n          Limit passwords to alphanumeric characters.
-l length   Length of generated passwords.
-c          Copy password to clipboard.
-q          Don't print password to stdout.
-h          Print this message.
-v          Show version.
```

## TODO

- [x] Add support for not generating passwords.
- [x] Add support for categories.
- [ ] Add an optional `tree` view.
- [ ] Add support for both `gpg` and `gpg2`.
- [ ] Man page.
- [ ] Setup automatic linting.
- [ ] Documentation.
