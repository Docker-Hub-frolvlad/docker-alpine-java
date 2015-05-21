FROM alpine:3.1

ENV JAVA_VERSION=8 \
    JAVA_UPDATE=45 \
    JAVA_BUILD=14

RUN apk add --update wget ca-certificates && \
    cd /tmp && \
    wget "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk" && \
    apk add --allow-untrusted glibc-2.21-r2.apk && \
    wget "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-bin-2.21-r2.apk" && \
    apk add --allow-untrusted glibc-bin-2.21-r2.apk && \
    /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib && \
    wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
        "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}u${JAVA_UPDATE}-b${JAVA_BUILD}/jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz" && \
    tar xzf "jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz" && \
    mkdir -p /usr/lib/jvm && \
    mv "/tmp/jdk1.${JAVA_VERSION}.0_${JAVA_UPDATE}" "/usr/lib/jvm/java-${JAVA_VERSION}-oracle" && \
    ln -s "java-${JAVA_VERSION}-oracle" /usr/lib/jvm/default-jvm && \
    ln -s /usr/lib/jvm/default-jvm/bin/java /usr/bin/java && \
    ln -s /usr/lib/jvm/default-jvm/bin/javac /usr/bin/javac && \
    apk del wget ca-certificates && \
    rm /tmp/* /var/cache/apk/*

# Alpine Linux doesn't use pam, which means that there is no /etc/nsswitch.conf,
# but Java relies on /etc/nsswitch.conf to check the order of DNS resolving
# (i.e. check /etc/hosts first and then lookup DNS-servers).
# To fix this we just create /etc/nsswitch.conf and add the following line:
RUN echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf
