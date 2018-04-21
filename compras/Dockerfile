FROM debian:stretch
MAINTAINER joseosorio001@outlook.com
RUN apt-get update && apt-get install -yq apt-utils apache2 tcpdump && apt-get clean
EXPOSE 443
COPY compras.sh /compras.sh
CMD ["./compras.sh"]
ENTRYPOINT ["/bin/bash"]
