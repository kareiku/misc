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

## Rebasing

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

The correct way to enforce LF on certain files or kinds of files is with the following format:

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
