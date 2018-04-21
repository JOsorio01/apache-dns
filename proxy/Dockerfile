FROM debian:stretch
MAINTAINER joseosorio001@outlook.com
RUN apt-get update && apt-get install -yq apt-utils apache2 tcpdump && apt-get clean
EXPOSE 80
EXPOSE 443
COPY proxy.sh /proxy.sh
CMD ["./proxy.sh"]
ENTRYPOINT ["/bin/bash"]
