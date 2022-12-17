FROM ubuntu:jammy

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install lib32gcc-s1 ca-certificates -y

RUN useradd -m steam
USER steam
WORKDIR /home/steam

ADD --chown=steam:steam https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz /home/steam/
RUN tar -xvf steamcmd_linux.tar.gz

COPY --chown=steam:steam install.cfg /home/steam/
RUN ./steamcmd.sh +runscript install.cfg

COPY --chown=steam:steam entry.sh /home/steam/

EXPOSE 27015/udp
ENTRYPOINT [ "/home/steam/entry.sh" ]