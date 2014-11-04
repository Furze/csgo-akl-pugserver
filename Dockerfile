FROM ubuntu:14.04

MAINTAINER Troy Cornwall docker@troycornwall.net

RUN apt-get update &&\
	 install -y lib32gcc1


USER steam


##STEAMCMD
RUN mkdir /home/steam/steamcmd
WORKDIR /steamcmd

RUN wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
RUN tar -xvzf steamcmd_linux.tar.gz

RUN mkdir /home/steam/csgo
RUN ./steamcmd.sh \ 
	+login annymous \
	+force_install_dir ../csgo \
	+app_update 740 validate \ 
	+quit


##METAMOD
WORKDIR /home/steam/csgo
RUN wget http://cdn.probablyaserver.com/sourcemod/mmsource-1.10.3.tar.gz
RUN tar -xvzf mmsource-1.10.3.tar.gz


EXPOSE 27015
