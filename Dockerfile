From debian:wheezy

RUN sed -i -e 's/$/ contrib non-free/' /etc/apt/sources.list
RUN apt-get update && apt-get install --no-install-recommends -y \
    dynamips \
    dynagen \
    telnet \
    tcpdump \
    screen \
    git \
    subversion \
    vim-tiny \
    openssh-server \
    pwgen \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/sshd

ADD run.sh /run.sh
RUN chmod +x /run.sh
RUN useradd -s /bin/bash -m docker

EXPOSE 22
CMD ["/run.sh"]
