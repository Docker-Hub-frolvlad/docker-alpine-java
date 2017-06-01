[![Docker Stars](https://img.shields.io/docker/stars/frolvlad/alpine-oraclejdk8.svg?style=flat-square)](https://hub.docker.com/r/frolvlad/alpine-oraclejdk8/)
[![Docker Pulls](https://img.shields.io/docker/pulls/frolvlad/alpine-oraclejdk8.svg?style=flat-square)](https://hub.docker.com/r/frolvlad/alpine-oraclejdk8/)


OracleJDK 8 Docker image
========================

This image is based on Alpine Linux image, which is only a 5MB image, and contains
[OracleJDK 8](http://www.oracle.com/technetwork/java/javase/overview/index.html).

You must accept the
[Oracle Binary Code License Agreement for Java SE](http://www.oracle.com/technetwork/java/javase/terms/license/index.html)
to use this image (see #6 for details).

JDK bundle contains lots of unnecessary for Docker image stuff, so it was cleaned up. There are 3
tags: `full` (only src tarballs get removed), `cleaned` (desktop parts get cleaned), `slim`
(everything but compiler and jvm is removed). `master` branch refers to `slim` tag, but `latest`
tag points to `cleaned`.

`slim` (`master` branch) download image size is:

[![](https://images.microbadger.com/badges/image/frolvlad/alpine-oraclejdk8:slim.svg)](http://microbadger.com/images/frolvlad/alpine-oraclejdk8:slim "Get your own image badge on microbadger.com")

`cleaned` (`latest` tag) download image size is:

[![](https://images.microbadger.com/badges/image/frolvlad/alpine-oraclejdk8:cleaned.svg)](http://microbadger.com/images/frolvlad/alpine-oraclejdk8:cleaned "Get your own image badge on microbadger.com")

`full` download image size is:

[![](https://images.microbadger.com/badges/image/frolvlad/alpine-oraclejdk8:full.svg)](http://microbadger.com/images/frolvlad/alpine-oraclejdk8:full "Get your own image badge on microbadger.com")


Consider using `develar/java` image (~120MB) if you only need JRE (you can run
java applications, but cannot build/compile them).


Usage Example
-------------

```bash
$ echo 'public class Main { public static void main(String[] args) { System.out.println("Hello World"); } }' > Main.java
$ docker run --rm -v "$(pwd)":/mnt --workdir /mnt frolvlad/alpine-oraclejdk8:slim sh -c "javac Main.java && java Main"
```

Once you have run this command you will get printed 'Hello World' from Java!
