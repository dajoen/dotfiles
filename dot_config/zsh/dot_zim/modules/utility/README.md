utility
=======

Utility aliases and functions.

Adds colour to `ls`, `grep` and `less`.

If file `${HOME}/.dir_colors` exists, then its configuration will be set using
`dircolors` (GNU only).

Aliases
-------

### ls

  * `ls` lists directories first (GNU only) and with colour (applies to all aliases below).
  * `ll` lists with long format and human-readable sizes (applies to all aliases below).
  * `l`  lists all files.
  * `lm` lists all files using pager.
  * `lr` lists recursively.
  * `lx` lists sorted by extension (GNU only).
  * `lk` lists sorted by largest file size last.
  * `lt` lists sorted by newest modification time last.
  * `lc` lists sorted by newest status change (ctime) last.

### File downloads

  * `get` downloads from the given URL using `aria2c`, `axel`, `wget` or `curl`.

### Resource usage

  * `df` reports file system disk usage with human-readable sizes.
  * `du` reports file disk usage with human-readable sizes.

### Condoms

  * `chmod` changes file mode verbosely, not operating from `/` (GNU only).
  * `chown` changes file owner verbosely, not operating from `/` (GNU only).
  * `rm` uses `safe-rm` if available.

Functions
---------

  * `mkcd` creates and changes to the given directory.
  * `mkpw` generates a random password with the given length and set of characters.
    The default parameters are equivalent to `mkpw 32 0-9A-Za-z`.
