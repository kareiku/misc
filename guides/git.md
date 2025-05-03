# Git

## Branching

### Creating a branch

```bash
git branch <branch_name>

OR

git checkout -b <branch_name>
```

### Changing between branches

```bash
git checkout <branch_name>
```

### Deleting a branch from local

```bash
git branch -d [-f] <branch_name>
```

### Deleting a branch from remote

```bash
git push -d <remote_name> <branch_name>
```

Note: The default `<remote_name>` is usually `origin`.

## Cherry-picking

The following sequence of commands allow for cherry-picking (copying) some commits from a branch into another (not removing them from the source branch).

1. `git checkout <dest>`
2. `git log <src>`
3. `git cherry-pick <sha> [sha...]`
4. `git cherry-pick --continue`
5. `git push <remote_name> <dest>`

## Rebasing

Rebasing is the _art_ of organizing your past commits by changing their messages, deleting them, or merging them with others.
The following can be used to rebase commits:

1. `git rebase -i  <sha | HEAD~N | --root>`
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

## File Ignoring (using .gitignore)

Statements are read, line by line, from first to last.
However, precedence is given by the last affecting statement.
For instance, for a `.gitignore` with the following statements:

```
a
b
a'
```

where a and a' represent statements that affect the same files and b an statement that affects other files,
`a'` will have precedence over `a`, but not over `b`.
The same way, `b` won't change `a`, and won't affect `a'` because of it being previously loaded, independently of the files it changes.

Note: File ignoring rules won't affect those files already being tracked by git. To remove those, use `git rm` and committing.

For patterns and more, please refer to [this cheatsheet](https://gist.github.com/jstnlvns/ebaa046fae16543cc9efc7f24bcd0e31).

## Attributes (using .gitattributes)

Attributes can help with following standards in a project.
They're mainly used to enforce one kind of line ending when uploading to the repository, which is what will be explained in here.

### Enforcing LF/CRLF

The correct way to enforce a line ending on certain files or kinds of files is with the following format:

```
*.ext1  text eol=lf
*.ext2  text eol=crlf
file1   text eol=lf

*.ext3  binary
file2   binary
```

**Enforcing a format to all files in your project can break them.** Be careful with binaries.

## Sources

- [Official Git Documentation](https://git-scm.com/docs)
