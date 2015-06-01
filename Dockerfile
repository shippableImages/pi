FROM ubuntu:14.04

ADD pull.sh /

ENTRYPOINT ["/bin/bash", "/pull.sh"]
