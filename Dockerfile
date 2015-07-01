FROM ubuntu:14.04

RUN echo "================= Adding gcloud binaries ============"
RUN apt-get update
RUN apt-get install -yy python-dev
RUN mkdir -p /opt/gcloud
ADD google-cloud-sdk /opt/gcloud/google-cloud-sdk
RUN cd /opt/gcloud/google-cloud-sdk && ./install.sh --usage-reporting=false --bash-completion=true --path-update=true
ENV PATH $PATH:/opt/gcloud/google-cloud-sdk/bin
RUN gcloud components update preview

ADD pull.sh /

ENTRYPOINT ["/bin/bash", "/pull.sh"]
