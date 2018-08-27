FROM garethahealy/centos-pod-pause:1.0

LABEL Name="ocp-external-service-onramp" \
    Vendor="com.garethahealy" \
    Maintainer="garethahealy (https://github.com/garethahealy/)" \
    Version="1.0.1" \
    License="Apache License, Version 2.0"

USER root

ADD run.sh /run.sh
RUN chmod 775 /run.sh

# Tools to configure routing rules at runtime
RUN yum install -y iptables-services iproute && \
    yum clean all

ENTRYPOINT ["/run.sh"]



