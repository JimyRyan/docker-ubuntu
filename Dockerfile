FROM ubuntu:xenial

MAINTAINER JimyRyan <JimyRyan@gmail.com>

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

# Set locale and timezone
ARG local_lang=fr_FR.UTF-8
ARG local_tz=Europe/Paris
ENV LANGUAGE ${local_lang} \
ENV LANG ${local_lang} \
ENV LC_ALL ${local_lang} \
ENV LANG ${local_lang} \
ENV TZ ${local_tz}

RUN set -eux \
	&& apt-get update -yqq \
	&& apt-get install -y --no-install-recommends \
		git \
		ca-certificates \
		net-tools \
		vi \
		curl \
		wget \
    && apt-get -y dist-upgrade \
    && apt-get autoremove -y \
    # remove apt cache from image
    && apt-get clean all

# Define working directory.
WORKDIR /

# Define default command.
CMD ["bash"]
