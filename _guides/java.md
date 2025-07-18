---
title: Interesting and Useful Stuff to do in Java
layout: default
---

# Interesting and Useful Stuff to do in Java

## Reading Files With Key-value Pairs, Using _ResourceBundle_

In a Maven Archetype project, create `.properties` files, with the format `MyBundle_myLocale.properties`. They will be
treated as locales for the bundle, but it works for any kind of key-value pairs.

To use them in the code, use the following statements:

```java
ResourceBundle myBundle = ResourceBundle.getBundle("MyBundle", new Locale("myLocale"));
String string = myBundle.getString("key");
```

Resource bundles get bundled in fat JARs without issues.

## Reaching Relative Paths Outside the JAR in a Portable Way

For those files that can't or shouldn't be bundled in the JAR, like *.log* or *.db* files, relative pathing is
_absolutely_ necessary.

Let's say our objective file path is `$HOME/directory/file.txt`, where `$HOME` represents our absolute path to home, in
Unix notation. To get such path, we could use the following statement:

```java
Path path = Paths.get(System.getProperty("user.home"), "directory", "file.txt");
```

Thanks to system properties, read and handled by the JVM, Paths can't fail to make a correct path for the current
system, given that it uses the property `file.separator`.

Note: Files bundled inside a JAR shan't ever be other than read-only and security vulnerable. Id est, any files to be
modifed, or those storing important information in them must never be kept inside a compiled application.

## Formatting Any Object With its Overriden _toString_ Method

By using `java.lang.reflect`, dynamic downcasting is possible, in a runtime-safe way.

Downcasting requires knowing, previous to executing the cast, the inheritor class. Otherwise, a `ClassCastException` is
very foreseeable.

To avoid such problems, we delegate the system to do so like this:

```java
String aMethod(Object obj) {
    Class<?> clazz = obj.getClass();
    Object o = clazz.cast(obj);
    String str = o.toString();
    return str;
}
```

This way, we ensure the `Object::toString` method ran just before the return statement returns the correctly formatted
string, for any kind of object. And it works for captures of `?`, too.

Of course, we can make this in a one-liner, and it will work as intended:

```java
String anotherMethod(Object obj) {
    return obj.getClass().cast(obj).toString();
}
```

## File Reading and Writing

With the addition of `java.nio` in verison 9 of the JDK, writing and reading requires low-to-no effort at all. By using
the classes `Files`, `Paths` and `Path`, the methods they offer allow for path checking, directory and file creation and
deletion, as well as writing in text-based files too easy. Other interesting classes are `OpenOption` and
`StandardOpenOption`, for file opening options. Below are shown some of the most useful resources.

### Static Methods

```java
Path.of(String first, String... more);

Paths.get(String first, String... more);

Files.createDirectories(Path dir, FileAttribute<?>... attrs);

Files.createFile(Path path, FileAttribute<?>... attrs);

Files.deleteIfExists(Path path);

Files.exists(Path path, LinkOption... options);

Files.isDirectory(Path path, LinkOption... options);

Files.isRegularFile(Path path, LinkOption... options);

Files.lines(Path path);

Files.list(Path dir);

Files.notExists(Path path, LinkOption... options);

Files.readAllLines(Path path);

Files.writeString(Path path, CharSequence csq, OpenOption... options);
```

### Instance Methods

```java
Path path = new Path();

path.getParent();

path.toString(); // Overriden by Path, returns the string representation of the path
```

### Enum Constants

```java
StandardOpenOptions.APPEND;

StandardOpenOptions.CREATE;

StandardOpenOptions.DELETE_ON_CLOSE;

StandardOpenOptions.READ;

StandardOpenOptions.SYNC;

StandardOpenOptions.WRITE;
```
