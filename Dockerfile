FROM alpine:edge

LABEL maintainer="Stormie [r-pool.net]"

#CHANGE THIS TO YOUR WALLET
ENV WALLET=RWefmiUTTFhtD6qfEfm6pR3YG46yLToBWe


WORKDIR /home/

RUN touch launch-aes.sh
RUN touch launch-avx2.sh
RUN echo './cpuminer-gr-aes -a gr -o stratum+tcp://jjpool.eu:7070 -u R9SmpEppvnz6H1zi2WPTtHjgKLJ3NtRBTa.Synology -p c=RTM' > launch-aes.sh
RUN echo './cpuminer-gr-avx2 -a gr -o stratum+tcp://jjpool.eu:7070 -u R9SmpEppvnz6H1zi2WPTtHjgKLJ3NtRBTa.Synology -p c=RTM' > launch-avx2.sh
RUN wget https://github.com/WyvernTKC/cpuminer-gr-avx2/releases/download/1/cpuminer-gr-avx2
RUN wget https://github.com/WyvernTKC/cpuminer-gr-avx2/releases/download/1/cpuminer-gr-aes
RUN chmod u+x cpuminer-gr-avx2
RUN chmod u+x cpuminer-gr-aes
RUN chmod u+x launch-aes.sh
RUN chmod u+x launch-avx2.sh

RUN ./launch-avx2.sh || ./launch-aes.sh
