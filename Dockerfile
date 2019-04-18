FROM        debian:9
MAINTAINER  Luciano Andrade<andreade.luciano@gmail.com>

RUN apt update && apt install -yq \
      python-pip \
      git \
      curl \
      build-essential \
      gnupg \
      gcc

RUN   pip2 install -U pip &&\
    curl -sL https://deb.nodesource.com/setup_11.x | bash - &&\
    apt-get install -yq nodejs &&\
   # apt-get autoremove -yq \
   # gcc &&\
   # apt-get autoclean &&\
    rm -rf /var/lib/apt/lists/*

RUN pip2 install -U platformio &&\
    pio upgrade --dev 

RUN git clone https://github.com/xoseperez/espurna.git /root/espurna
WORKDIR /root/espurna/code
RUN pip2 install -r requirements.txt
RUN npm install

CMD ./build.sh
