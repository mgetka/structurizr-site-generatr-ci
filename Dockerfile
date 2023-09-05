FROM ghcr.io/avisi-cloud/structurizr-site-generatr

USER root

RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash
RUN ln -s /opt/structurizr-site-generatr/bin/structurizr-site-generatr /bin/structurizr-site-generatr

USER generatr
ENTRYPOINT []
