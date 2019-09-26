[![Docker Stars](https://img.shields.io/docker/stars/frolvlad/alpine-java.svg?style=flat-square)](https://hub.docker.com/r/frolvlad/alpine-java/)
[![Docker Pulls](https://img.shields.io/docker/pulls/frolvlad/alpine-java.svg?style=flat-square)](https://hub.docker.com/r/frolvlad/alpine-java/)


Java Docker image
=================

This image is based on Alpine Linux image, which is only a 5MB image, and contains
Java runtime (JRE) and Java development kit (JDK) conveniently packaged into
separate Docker tags.

DEPRECATION DUE TO ORACLE JAVA LICENSING CHANGE
-----------------------------------------------

> Thank you to everyone using images derived from this repo, to everyone who
> inspired and contributed.  After April 2019, due to Oracle Java licensing
> changes, this repo is deprecated, and is now for reference only.  No new
> builds will be published to `frolvlad/alpine-java` repo on Docker Hub from
> this Github repo.

As announced, Java licensing changed, and starting April 2019 commercial usage
of Oracle Java required subscription.  In other words, switch to OpenJDK, or use
older versions of Oracle Java (for reference, pre-built images are available on
[Docker Hub](https://hub.docker.com/r/frolvlad/alpine-java/))

Official OpenJDK images receive regular updates, and are available at
https://hub.docker.com/_/openjdk, including `8-jre-alpine` (85MB),
`8-jdk-alpine` (105MB), `8-jre-slim` (204MB), `8-jdk-slim` (243MB),
`8u212-jre-slim` (204MB), `8u212-jdk-slim` (243MB), etc..

For more details about Oracle Java Licensing, checkout this article:
https://medium.com/@javachampions/java-is-still-free-2-0-0-6b9aa8d6d244

TL;DR

> Oracle JDK 8 is going through the “End of Public Updates” process, which means
> the April 2019 update will restrict commercial use. However, since Java SE 9,
> Oracle is also providing Oracle OpenJDK builds which are free for commercial
> use (but only updated for 6 months). There are also free OpenJDK builds which
> will be updated (including security patches) from other providers like
> AdoptOpenJDK, Amazon, Azul, BellSoft, IBM, jClarity, Red Hat, the Linux
> distros et al.

And many others talking about Oracle Java SE licensing changes ([Google
search](https://www.google.com/search?q=java+oracle+license))

Tags
----

JDK bundle contains lots of unnecessary for Docker image stuff, so it was cleaned up. There are 3
tags: `*-full` (only src tarballs get removed), `*-cleaned` (desktop parts get cleaned), `*-slim`
(everything but compiler and jvm is removed). `master` branch refers to `jdk8-slim` tag, but
`latest` tag points to `jdk8-cleaned`.

`jdk8-slim` (`master` branch) download image size is:

[![](https://images.microbadger.com/badges/image/frolvlad/alpine-java:jdk8-slim.svg)](http://microbadger.com/images/frolvlad/alpine-java:jdk8-slim "Get your own image badge on microbadger.com")

`jdk8-cleaned` (`latest` tag) download image size is:

[![](https://images.microbadger.com/badges/image/frolvlad/alpine-java:jdk8-cleaned.svg)](http://microbadger.com/images/frolvlad/alpine-java:jdk8-cleaned "Get your own image badge on microbadger.com")

`jdk8-full` download image size is:

[![](https://images.microbadger.com/badges/image/frolvlad/alpine-java:jdk8-full.svg)](http://microbadger.com/images/frolvlad/alpine-java:jdk8-full "Get your own image badge on microbadger.com")

Consider using `jre*` tags of this image if you only need JRE (you can run Java applications, but cannot build/compile them):

`jre8-slim` (`master` branch) download image size is:

[![](https://images.microbadger.com/badges/image/frolvlad/alpine-java:jre8-slim.svg)](http://microbadger.com/images/frolvlad/alpine-java:jre8-slim "Get your own image badge on microbadger.com")

`jre8-cleaned` (`latest` tag) download image size is:

[![](https://images.microbadger.com/badges/image/frolvlad/alpine-java:jre8-cleaned.svg)](http://microbadger.com/images/frolvlad/alpine-java:jre8-cleaned "Get your own image badge on microbadger.com")

`jre8-full` download image size is:

[![](https://images.microbadger.com/badges/image/frolvlad/alpine-java:jre8-full.svg)](http://microbadger.com/images/frolvlad/alpine-java:jre8-full "Get your own image badge on microbadger.com")


Usage Example
-------------

```bash
$ echo 'public class Main { public static void main(String[] args) { System.out.println("Hello World"); } }' > Main.java
$ docker run --rm -v "$(pwd)":/mnt --workdir /mnt frolvlad/alpine-java:jdk8-slim sh -c "javac Main.java && java Main"
```

Once you have run this command you will get printed 'Hello World' from Java!

Tips
----

Use [Docker multi-stage builds](https://docs.docker.com/develop/develop-images/multistage-build/)
to slim down your final Docker images:

```Dockerfile
FROM frolvlad/alpine-java:jdk8-slim AS builder

RUN echo 'public class Main { public static void main(String[] args) { System.out.println("Hello World"); } }' > Main.java
RUN javac Main.java

FROM frolvlad/alpine-java:jre8-slim
COPY --from=builder /Main.class /

CMD ["java", "Main"]
```

```
$ docker build -t my-app .
$ docker run --rm my-app
Hello World
```

Your application image is going to be only 119MB on disk.
