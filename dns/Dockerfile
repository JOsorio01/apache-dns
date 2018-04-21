FROM debian:stretch
MAINTAINER joseosorio001@outlook.com
RUN apt-get update && apt-get install -yq apt-utils dnsutils bind9 tcpdump && apt-get clean
EXPOSE 53
COPY dns.sh /dns.sh
CMD ["./dns.sh"]
ENTRYPOINT ["/bin/bash"]
