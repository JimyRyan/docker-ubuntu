FROM ubuntu:xenial

MAINTAINER JimyRyan <JimyRyan@gmail.com>

# disable interactive functions
ONBUILD ENV DEBIAN_FRONTEND noninteractive

# Set locale and timezone
ONBUILD ARG local_lang=fr_FR.UTF-8
ONBUILD ARG local_tz=Europe/Paris
ONBUILD ENV LANGUAGE ${local_lang} \
ONBUILD ENV LANG ${local_lang} \
ONBUILD ENV LC_ALL ${local_lang} \
ONBUILD ENV LANG ${local_lang} \
ONBUILD ENV TZ ${local_tz}

ONBUILD RUN apt-get update -yqq \
	&& apt-get install -y --no-install-recommends git ca-certificates \
    && apt-get -y dist-upgrade \
    && apt-get autoremove -y \
    # remove apt cache from image
    && apt-get clean all

# Define working directory.
WORKDIR /

# Define default command.
CMD ["bash"]
