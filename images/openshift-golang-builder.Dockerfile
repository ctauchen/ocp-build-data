FROM openshift/ose-base:rhel8.2.els.rhel

ENV SUMMARY="RHEL8 based Go builder image for OpenShift ART" \
    container=oci \
    GOFLAGS='-mod=vendor' \
    GOPATH=/go \
    VERSION="1.13"

LABEL summary="$SUMMARY" \
      description="$SUMMARY" \
      io.k8s.description="$SUMMARY" \
      io.k8s.display-name="Go Builder $VERSION" \
      com.redhat.license_terms="https://www.redhat.com/en/about/red-hat-end-user-license-agreements#UBI" \
      version="$VERSION"

RUN yum install -y --setopt=tsflags=nodocs \
    bc diffutils file findutils gpgme git hostname lsof make rsync socat tar tree util-linux wget which zip \
    "go-toolset-$VERSION.*" goversioninfo openssl openssl-devel systemd-devel gpgme-devel libassuan-devel && \
    mkdir -p /go/src && \
    yum clean all -y
