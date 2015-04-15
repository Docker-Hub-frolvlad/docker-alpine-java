OracleJDK 8 Docker image
========================

This image is based on Alpine Linux image, which is only a 5MB image, and contains
[OracleJDK 8](http://www.oracle.com/technetwork/java/javase/overview/index.html).

Total size of this image is 352MB!


Usage Example
-------------

```bash
$ echo -e 'public class Main { public static void main(String[] args) { System.out.println("Hello World"); } }' > Main.java
$ docker run --rm -v `pwd`:/tmp --workdir /tmp frolvlad/alpine-oraclejdk8 sh -c 'javac Main.java && java Main'
```

Once you have run this command you will get printed 'Hello World' from Java!
