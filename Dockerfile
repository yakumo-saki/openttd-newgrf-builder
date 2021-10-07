# syntax=docker/dockerfile:1.3-labs
FROM python:3.6
RUN apt-get update && \
apt-get install -y git && \
pip install Pillow chameleon nml==0.5.3 markdown

# FIRS (XIS)
# nml > 0.6.0 causes error. need 0.5.3
# nmlc ERROR: "generated/firs.nml", line 7394: Temporary registers from 128 to 255 are reserved for NML's internal calculations.

ENV GIT_REPO=NONE
ENV GIT_BRANCH=NONE

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
