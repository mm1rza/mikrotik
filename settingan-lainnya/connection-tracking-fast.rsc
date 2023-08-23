 
/ip firewall connection tracking
set generic-timeout=5m icmp-timeout=5s tcp-close-timeout=1s \
    tcp-close-wait-timeout=5s tcp-established-timeout=10m \
    tcp-fin-wait-timeout=5s tcp-last-ack-timeout=1s tcp-syn-received-timeout=\
    1s tcp-syn-sent-timeout=1s tcp-time-wait-timeout=1s udp-stream-timeout=1m \
    udp-timeout=1s


 