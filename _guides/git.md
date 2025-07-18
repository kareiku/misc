---
title: Git Quick Summary/Guide
layout: default
---

# Git Quick Summary/Guide

## Pulling and Fetching Changes

The sole difference between _pulling_ and _fetching_ is that the later doesn't involve applying changes automatically,
while the first does.

The commands are rather straight forward:

```bash
git fetch
git pull
```

## Updating From Remote Without Losing Local Changes

```bash
git stash
git pull origin <branch>
git stash pop
```

If there are conflicts, Git will allow for manual resolving.

## Downgrade a Selection of Files to a Previous Version

```bash
git checkout <commit-sha> -- /path/to/file
```

## Branching

### Creating a Branch

```bash
git branch <branch>
```

OR

```bash
git checkout -b <branch>
```

### Switching Branches

```bash
git checkout <branch>
```

OR

```bash
git switch <branch>
```

### Deleting a Branch From Local

```bash
git branch -d [-f] <branch>
```

### Deleting a Branch From Remote

```bash
git push -d <remote-name> <branch>
```

Note: The default `<remote-name>` is usually `origin`.

## Cherry-picking

The following sequence of commands allow for cherry-picking (copying) some commits from a branch into another (not
removing them from the source branch).

1. `git checkout <branch-dest>`
2. `git log <branch-src>`
3. `git cherry-pick <commit-sha> [commit-sha...]`
4. `git cherry-pick --continue`
5. `git push <remote-name> <branch-dest>`

## Rebasing

Rebasing is the _art_ of organizing your past commits by changing their messages, deleting them, or merging them with
others.

The following statements can be used to rebase commits:

1. `git rebase -i  <commit-sha | HEAD~N | --root>`
    - Where `-i` means interactive,
    - "sha" is the hash of the lower bound commit you want to start with,
    - "N" is the number of commits behind HEAD you want to start with,
    - and `--root` is the initial commit of the repository.
2. By using the interactive rebase editor:
    - `p` or `pick` means "use commit, as-is";
    - `r` or `reword` means "use commit, but edit the commit message";
    - `s` or `squash` means "use commit, but meld it into the previous one";
    - `f` or `fixup` means the same as `squash`, but discarding this commit's message;
    - `d` or `drop` means "remove this commit".
3. `git push --force`

## Merging

Merging is a process where two independent commits (in the same working tree but different branches) are melded into
another commit. When finished, the branch from where the commit was started will point to the _merged_ commit.

Main commands used when merging are the following:

```bash
git checkout <branch-1> # To ensure we're merging other branches into branch-1
git merge <branch-2>
git merge --abort
git merge --help
git merge -X ours <branch-2> # Resolve conflicts with our branch's changes
git merge -X theirs <branch-2> # Resolve conflicts with their branch's changes
```

See the [official documentation](https://git-scm.com/docs/git-merge) for more information,
and [this official guide](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging) for better
understanding of what branch merging is.

### "Merging" Files from a Branch Into Another

If, for some reason, branches are disjoint and merging can't be done correctly, copying everything from a branch into
another can be done with:

```bash
git checkout <branch-1>
git checkout <branch-2> -- .
```

## File Excluding (Using .gitignore)

Statements are read, line by line, from first to last. However, precedence is given by the last affecting statement. For
instance, for a `.gitignore` with the following statements:

```
a
b
a'
```

where a and a' represent statements that affect the same files and b an statement that affects other files,
`a'` will have precedence over `a`, but not over `b`. The same way, `b` won't change `a`, and won't affect `a'` because
of it being previously loaded, independently of the files it changes.

Note: File ignoring rules won't affect those files already being tracked by git. To remove those, use `git rm` and
committing.

For patterns and more, please refer
to [this cheatsheet](https://gist.github.com/jstnlvns/ebaa046fae16543cc9efc7f24bcd0e31).

## Attributes (Using .gitattributes)

Attributes can help with following standards in a project. They're mainly used to enforce one kind of line ending when
uploading to the repository, which is what will be explained in here.

### Enforcing LF/CRLF

The best way to ensure a certain line ending on files by extension is by using the following format:

```
*.ext1  text eol=lf
*.ext2  text eol=crlf
file1   text eol=lf

*.ext3  binary
file2   binary
```

**Enforcing a format to all files in your project can break them.** Be careful with binaries.

However, a simpler way, with low error rate, for ensuring correct file endings in shared repositories is:

```
* text=auto
```

This will enforce LF on all of those files known to Git to be text-based (binary detection is really good in current
Git) on commit, and system default line endings (LF on Unix-based systems, CRLF on Windows) on checkout.

## Sources

- [Official Git Documentation](https://git-scm.com/docs)
