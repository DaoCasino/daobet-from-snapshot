FROM daocasino/daobet:v2.0.1

WORKDIR /daobet

ADD configs /etc/daobet/configs
ADD entrypoint.sh .

RUN \
  apt-get update && \
  apt install -y python3 python3-pip wget && \
  rm -rf /tmp/prepare /var/lib/apt/lists/* && \
  pip3 install boto3


CMD ["bash", "./entrypoint.sh"]
