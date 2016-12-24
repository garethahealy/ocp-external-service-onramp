FROM garethahealy/centos-pod-pause:1.0
MAINTAINER garethahealy (https://github.com/garethahealy/)

LABEL Name="ocp-external-service-onramp" \
    Vendor="com.garethahealy" \
    Version="1.0.0" \
    License="Apache License, Version 2.0"

ADD run.sh /run.sh

# Tools to configure routing rules at runtime
RUN yum install -y iptables-services net-tools  && \
    yum clean all

ENTRYPOINT ["/run.sh"]



