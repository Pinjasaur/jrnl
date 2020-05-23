# jrnl

[![Travis](https://img.shields.io/travis/Pinjasaur/jrnl.svg)](https://travis-ci.org/Pinjasaur/jrnl)

Frictionless journaling from the CLI.

Each day is a discrete plaintext file: `$JRNL_DIR/YYYY/MM/DD.txt`. Each entry
added will auto-prepend the time. Multiple entries in a single day will be
delimitted with Markdown-style `---` notation.

You can choose to add content directly from the CLI or edit an entry in your
preferrered `$EDITOR`.

## Installation

Requires Bash >= 4 (for [`globstar`][globstar]).

Add the [`jrnl` script](/jrnl) to your `$PATH` or create a function similar to:

```bash
jrnl() { 
  /path/to/jrnl "${@}" 
}
```

`jrnl` defaults to writing to `$HOME/Journal`. You can customize this by setting
`$JRNL_DIR` to something else (e.g. `export JRNL_DIR="$HOME/Dropbox/Journal"`).

You'll also want to make sure `$EDITOR` is set to your preferred editor 
(e.g. `export EDITOR='vim'`).

## Usage

Run `jrnl` to start writing. You can list entries with `jrnl --list` and show
the usage info with `jrnl --help`:

```
jrnl [<arguments>]

  Creates a file in $JRNL_DIR/YYYY/MM/DD.txt.

Options:
  -h --help  Show this.
  -l --list  List entries.
  <content>  Populate entry with <content>. If not set, open with $EDITOR.
```

## Related

- [jot] - Create & manage Markdown files from the CLI
- [jt] - Quickly create timestamped notes (simplified version of [jot])

## License

[MIT][license] &copy; Paul Esch-Laurent.

[jot]: https://github.com/Pinjasaur/jot
[jt]: https://github.com/Pinjasaur/jt
[license]: https://pinjasaur.mit-license.org/2020
[globstar]: https://www.linuxjournal.com/content/globstar-new-bash-globbing-option
