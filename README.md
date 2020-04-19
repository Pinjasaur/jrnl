# jrnl

[![Travis](https://img.shields.io/travis/Pinjasaur/jrnl.svg)](https://travis-ci.org/Pinjasaur/jrnl)

TODO

## Installation

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

TODO

## Related

- [jot] - Manage Markdown files from the CLI
- [jt] - Creates timestamped notes (simplified version of [jot])

## License

[MIT][license] &copy; Paul Esch-Laurent.

[jot]: https://github.com/Pinjasaur/jot
[jt]: https://github.com/Pinjasaur/jt
[license]: https://pinjasaur.mit-license.org/2020
