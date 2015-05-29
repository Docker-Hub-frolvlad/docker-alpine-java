OracleJDK 8 Docker image
========================

This image is based on Alpine Linux image, which is only a 5MB image, and contains
[OracleJDK 8](http://www.oracle.com/technetwork/java/javase/overview/index.html).

JDK bundle contains lots of unnecessary for Docker image stuff, so it was cleaned up. There are 3
tags: `full` (only src tarballs get removed), `cleaned` (desktop parts get cleaned), `slim`
(everything but compiler and jvm is removed). `master` branch refers to `slim` tag, but `latest`
tag points to `cleaned`.

`slim` (`master` branch) image size is:

[![](https://badge.imagelayers.io/frolvlad/alpine-oraclejdk8:slim.svg)](https://imagelayers.io/?images=frolvlad/alpine-oraclejdk8:slim 'Get your own badge on imagelayers.io')

`cleaned` (`latest` tag) image size is:

[![](https://badge.imagelayers.io/frolvlad/alpine-oraclejdk8:cleaned.svg)](https://imagelayers.io/?images=frolvlad/alpine-oraclejdk8:cleaned 'Get your own badge on imagelayers.io')

`full` image size is:

[![](https://badge.imagelayers.io/frolvlad/alpine-oraclejdk8:full.svg)](https://imagelayers.io/?images=frolvlad/alpine-oraclejdk8:full 'Get your own badge on imagelayers.io')


Consider using `develar/java` image (~120MB) if you only need JRE (you can run
java applications, but cannot build/compile them).


Usage Example
-------------

```bash
$ echo -e 'public class Main { public static void main(String[] args) { System.out.println("Hello World"); } }' > Main.java
$ docker run --rm -v `pwd`:/tmp --workdir /tmp frolvlad/alpine-oraclejdk8 sh -c 'javac Main.java && java Main'
```

Once you have run this command you will get printed 'Hello World' from Java!
