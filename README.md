[![Docker Stars](https://img.shields.io/docker/stars/frolvlad/alpine-java.svg?style=flat-square)](https://hub.docker.com/r/frolvlad/alpine-java/)
[![Docker Pulls](https://img.shields.io/docker/pulls/frolvlad/alpine-java.svg?style=flat-square)](https://hub.docker.com/r/frolvlad/alpine-java/)


Java Docker image
=================

This image is based on Alpine Linux image, which is only a 5MB image, and contains
Java runtime (JRE) and Java development kit (JDK) conveniently packaged into
separate Docker tags.

You must accept the
[Oracle Binary Code License Agreement for Java SE](http://www.oracle.com/technetwork/java/javase/terms/license/index.html)
to use this image (see [issue #6](https://github.com/frol/docker-alpine-java/issues/6) for details).

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
