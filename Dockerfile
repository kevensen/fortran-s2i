# fortran-s2i
FROM openshift/base-centos7

LABEL maintainer="Kenneth Evensen <kdevensen@gmail.com>"

ENV BUILDER_VERSION 1.0

LABEL io.k8s.description="Platform for building Fortran apps" \
      io.k8s.display-name="builder 1.0.0" \
      io.openshift.tags="fortran"


RUN yum install -y gcc-gfortran && \
    yum clean all && \
    rm -rf /var/cache/yum/*

COPY ./s2i/bin/ /usr/libexec/s2i

RUN chown -R 1001:1001 /opt/app-root

USER 1001

CMD ["/usr/libexec/s2i/usage"]
