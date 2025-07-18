---
title: Random Bash Stuff
layout: default
---

# Random Bash Stuff

## Notes

- A more in-depth _diff_ is `vimdiff`.

- To run a command from inside Vim, use `:!<command>`. To refer to the file
  being currently edited, use `%`. e.g., `:!bash %` runs the current file as a
  bash script.

## Useful Unix One-liners

- Print all instances of different commands used (from history, sorted)

  ```bash
  history | awk '{$1=""; sub(/^ /, ""); print}' | sort -u
  ```

- Check the difference of two _cut_ files

  ```bash
  diff -s <(cut <options> file1) <(cut <options> file2)
  ```
