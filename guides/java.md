# Interesting And Useful Things Done In Java

## Reading files with key-value pairs, using ResourceBundle

In a Maven Archetype project, create *.properties* files, with the format `MyBundle_myLocale.properties`. They will be treated as locales for the bundle, but it works for any kind of key-value pairs.

To use them in the code, use the following statements:

```java
ResourceBundle myBundle = ResourceBundle.getBundle("MyBundle", new Locale("myLocale"));
String string = myBundle.getString("key");
```

Resource bundles get bundled in fat JARs without issues.

## Reaching relative paths outside the JAR in a portable way

For those files that can't or shouldn't be bundled in the JAR, like *.log* or *.db* files, relative pathing is _absolutely_ necessary.

With the following statements, you can consider a good relative access, so long as you know the system's structure:

```java
/* Lets say we want to reach a file someText.txt, found under a directory, dirA, found under the user's home directory
 * We can use the property user.home to find our root directory and append the rest with Paths
 */

String path = Paths.get(System.getProperty("user.home"), "dirA", "someText.txt").toString();
```

Because Paths checks for the system, not even forward slashes nor backslashes can make us mishandle the resulting path.

## Formatting any object with its overriden toString method

By using java.lang.reflect, dynamic downcasting is possible, in a runtime-safe way.

Downcasting requires knowing, previous to executing the cast, the inheritor class. Otherwise, a _ClassCastException_ is very foreseeable.

To avoid such problems, we delegate the system to do so like this:

```java
String aMethod(Object obj) {
    Class<?> clazz = obj.getClass();
    Object o = clazz.cast(obj);
    String str = o.toString();
    return str;
}
```

This way, we ensure the `Object::toString` method ran just before the return statement returns the correctly formatted string, for any kind of object. And it works for captures of ?, too.

Of course, we can make this in a one-liner, and it will work as intended:

```java
String anotherMethod(Object obj) {
    return obj.getClass().cast(obj).toString();
}
```
