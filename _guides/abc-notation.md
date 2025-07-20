---
title: ABC Notation Summary
layout: default
---

# ABC Notation Summary

The ABC notation is a plain text musical notation for use in computers.

## Information Fields

- `X:` &#x2014; (uint) The reference number in a tunebook.
- `T:` &#x2014; (string) The sheet title.
- `C:` &#x2014; (string) The composer.
- `M:` &#x2014; (uint/uint) The meter. Appart from standard meters, e.g.
  `M:3/4`, complex meters like `M:(2+3+2)/8` are perfectly valid.
- `L:` &#x2014; (uint | uint/uint) The unit note length. 1/4 &#x2261; crotchet.
- `Q:` &#x2014; (\[ string \] uint/uint=uint) The tempo.
- `Z:` &#x2014; (string) The name of the transcriptor.
- `K:` &#x2014; ({ A | B | ... \[ # | b \] \[ major | minor | lydian | ... \] })
  The key.
- `V:` &#x2014; (uint 'clef='string) The voice. First element is the identifier,
  next is the clef. e.g. `V:1 clef=bass`.

Out of these, it's recommended to have, at least, X, T, M, L and K.

These are not the only existing fields. Check the standard for more info.

## The Tune Body

To place the notes and other elements (like bars or accidentals) the following
notation is used.

### Pitch

- `A-G` for the lower octave.
- `a-g` for the higher octave.
- `,` after a note to go even lower.
- `'` after a note to go even higher.

### Accidentals

- `^` for sharp (`^^` for double sharp).
- `=` for natural.
- `_` for flat (`__` for double flat).

### Note Lengths

When writing a note, the default length will be the one set in the `L:`.

For other lengths, add a division or multiplication after the note. e.g. `A/2`
is half the `L:` duration, `A/4` a fourth, and `A3/2` is half but dotted, `A2`
is double the length.

### Rests

Rests can be indicated by using `zn`, where n: uint. e.g. `z2` is a rest of
double the `L:` length. Lengths are applied the same way as in notes.

### Bars

From the standard:

| Symbol | Meaning                              |
|--------|--------------------------------------|
| `|`    | bar line                             |
| `|]`   | thin-thick double bar line           |
| `||`   | thin-thin double bar line            |
| `[|`   | thick-thin double bar line           |
| `|:`   | start of repeated section            |
| `:|`   | end of repeated section              |
| `::`   | start & end of two repeated sections |

### Ties and Slurs

By placing multiple notes between parentheses, these will appear tied.

## Sheet Example

```
X:1
T:Happy birthday to you
M:3/4
L:1/4
Q:1/4=120
K:G
D3/4D/4 | E D G | F2 D3/4D/4 | E D A | G2 D3/4D/4 |
d B G | (F HE) c3/4c/4 | B G A | G2 |]
```

## Sources & Useful Resources

- [Wikipedia article on ABC notation](https://en.wikipedia.org/wiki/ABC_notation)
- ["ABC 1.6 in BNF format", by Henrik Norbeck. Article stored in the Wayback Machine](https://web.archive.org/web/20080309023424/http://www.norbeck.nu/abc/abcbnf.htm)
- [abc\:standard\:v2.1](https://abcnotation.com/wiki/abc:standard:v2.1)
- [Wikipedia article listing musical symbols](https://en.wikipedia.org/wiki/List_of_musical_symbols)
- [abcjs quick editor](https://editor.drawthedots.com/)
