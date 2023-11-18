
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    gnupg2 \
    ca-certificates \
    libdbi-perl \
    libdbd-mysql-perl \
    libterm-readkey-perl \
    libio-socket-ssl-perl \
    unzip

# Install Percona Toolkit
RUN wget https://downloads.percona.com/downloads/percona-toolkit/3.5.5/binary/debian/jammy/x86_64/percona-toolkit_3.5.5-1.jammy_amd64.deb && \
    dpkg -i percona-toolkit_3.5.5-1.jammy_amd64.deb && \
    apt-get update && \
    apt-get install -y percona-toolkit

# Install Go
RUN wget https://golang.org/dl/go1.21.4.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.21.4.linux-amd64.tar.gz && \
    export PATH=$PATH:/usr/local/go/bin && \
    echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc

# Install alp
RUN wget https://github.com/tkuchiki/alp/releases/download/v1.0.21/alp_linux_amd64.zip && \
    unzip alp_linux_amd64.zip && \
    mv alp /usr/local/bin/alp

# Install kataribe
RUN wget https://github.com/matsuu/kataribe/releases/download/v0.4.3/kataribe-v0.4.3_linux_amd64.zip && \
    unzip kataribe-v0.4.3_linux_amd64.zip && \
    mv kataribe /usr/local/bin/kataribe

# Cleanup
RUN rm -rf *.deb *.gz *.zip

CMD ["/bin/bash"]
