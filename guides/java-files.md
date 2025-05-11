# Accessing Files In Java

## Files for key-value pairs

In a Maven Archetype project, create *.properties* files, with the format `MyBundle_myLocale.properties`. They will be treated as locales for the bundle, but it works for any kind of key-value pairs.

To use them in the code, use the following statements:

```java
ResourceBundle myBundle = ResourceBundle.getBundle("MyBundle", new Locale("myLocale"));
String string = myBundle.getString("key");
```

Resource bundles get bundled in fat JARs without issues.

## Reaching paths relatively, the good way

For those files that can't or shouldn't be bundled in the JAR, like *.log* or *.db* files, relative pathing is _absolutely_ necessary.

With the following statements, you can consider a good relative access, so long as you know the system's structure:

```java
/* Lets say we want to reach a file someText.txt, found under a directory, dirA, found under the user's home directory
 * We can use the property user.home to find our root directory and append them with Paths
 */

String path = Paths.get(System.getProperty("user.home"), "dirA", "someText.txt").toString();
```

Because Paths checks for the system, not even forward slashes nor backslashes can make us mishandle the resulting path.
