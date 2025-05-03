# Uncategorized Guides and Notes

## Notes

- A more in-depth _diff_ is `vimdiff`.

- To run a command from inside Vim, use `:!<command>`. To refer to the file being currently edited, use `%`. e.g., `:!bash %` runs the current file as a bash script.

## Useful Unix One-liners

- Find all used file extensions in a directory (includes the possibility of avoiding the `.git` directory)
```bash
find <dir> -type f [-not -path "*/.git/*"] | sed -n 's/.*\.\([^.\/]*\)$/\1/p' | sort -u
```

- Print all instances of different commands used (from history, sorted)
```bash
history | awk '{$1=""; sub(/^ /, ""); print}' | sort -u
```
