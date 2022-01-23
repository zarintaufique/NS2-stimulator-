# NS2-stimulator

1.	This network consists of 4 nodes (n0, n1, n2, n3)
2.	The duplex links between n0 and n2, and n1 and n2 have 2 Mbps of bandwidth and 10 ms of delay.
3.	 The duplex link between n2 and n3 has 1.7 Mbps of bandwidth and 20 ms of delay.
4.	 Each node uses a DropTail queue, of which the maximum size is 10. You will have to orient the nodes as shown in the diagram below. 
5.	A "tcp" agent is attached to n1, and a connection is established to a tcp "sink" agent attached to n3.
6.	 A tcp "sink" agent generates and sends ACK packets to the sender (tcp agent) and frees the received packets. 
7.	A "udp" agent that is attached to n0 is connected to a "null" agent attached to n3. A "null" agent just frees the packets received.
8.	A "ftp" and a "cbr" traffic generator are attached to "tcp" and "udp" agents respectively, and the "cbr" is configured to generate packets having size of 1 Kbytesat the rate of 100 packets per second. 
9.	FTP will control the traffic automatically according to the throttle mechanism in TCP.
10.	The traffic flow of UDP must be colored red and traffic flow of TCP must be colored blue.
11.	The "cbr" is set to start at 0.1 sec and stop at 4.5 sec,
12.	 "ftp" is set to start at 0.5 sec and stop at 4.0 sec.

