# Uncategorized Guides and Notes

## Notes

- A more in-depth _diff_ is `vimdiff`.

## Useful Unix One-liners

- Find all used file extensions in a directory (includes the possibility of avoiding the `.git` directory)
```bash
find <dir> -type f [-not -path "*/.git/*"] | sed -n 's/.*\.\([^.\/]*\)$/\1/p' | sort -u
```

- Print all instances of different commands used (from history, sorted)
```bash
history | awk '{$1=""; sub(/^ /, ""); print}' | sort -u
```
