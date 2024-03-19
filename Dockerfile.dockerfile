FROM ubuntu:24.04
RUN apt-get update \
&& apt-get dist-upgrade -y\
&& apt-get autoremove -y \
&& apt-get autoclean -y \
&& apt-get install -y \
sudo \
nano \
wget \
curl

RUN useradd -G sudo -m -d /home/martin -s /bin/bash -p "$(openssl 
passwd -1 kultpassord)" martin

USER martin
WORKDIR /home/martin
RUN mkdir hacking \
&& cd hacking \
&& curl -SL
https://raw.githubusercontent.com/uia-worker/is105misc/master/sem01v2
4/pawned.sh > pawned.sh \
&& chmod 764 pawned.sh \
&& cd ..

RUN git config --global user.email "gullmartin@yahoo.no"
\
&& git config --global user.name "Martin Brådland" \
&& git config --global url."https://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:@github.com/".insteadOf
"https://github.com" \
&& mkdir -p github.com/martib18

USER root
RUN curl -SL https://go.dev/dl/go1.21.7.linux-arm64.tar.gz \
| tar xvz -C /usr/local

USER martin
SHELL ["/bin/bash", "-c"]
RUN mkdir -p $HOME/go/{src,bin}
ENV GOPATH="/home/martin/go"
ENV PATH="${PATH}:${GOPATH}/bin:/usr/local/go/bin"