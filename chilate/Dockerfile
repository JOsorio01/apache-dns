FROM debian:stretch
MAINTAINER joseosorio001@outlook.com
RUN apt-get update && apt-get install -yq apt-utils apache2 tcpdump && apt-get clean
EXPOSE 80
COPY chilate.sh /chilate.sh
CMD ["./chilate.sh"]
ENTRYPOINT ["/bin/bash"]
