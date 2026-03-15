FROM oraclelinux:9

COPY LINUX.X64_193000_client_home.zip /tmp/

RUN dnf -y update && \
    dnf -y install libnsl libaio unzip && \
    mkdir -p /opt/oracle/client && \
    unzip /tmp/LINUX.X64_193000_client_home.zip \
          -d /opt/oracle/client && \
    rm /tmp/*.zip

ENV ORACLE_HOME=/opt/oracle/client
ENV PATH=$ORACLE_HOME/bin:$PATH
ENV LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH