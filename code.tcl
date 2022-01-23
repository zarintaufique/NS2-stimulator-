set ns [new Simulator]

set nf [open out.nam w]
$ns namtrace-all $nf

proc finish {} {
        global ns nf
        $ns flush-trace
        close $nf
        exec nam out.nam &
        exit 0
}
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]

$ns duplex-link $n1 $n2 2Mb 10ms DropTail    
$ns duplex-link-op $n1 $n3 orient right-down

$ns duplex-link $n2 $n3 2Mb 10ms DropTail     
$ns duplex-link-op $n2 $n3 orient right-up

$ns duplex-link $n3 $n4 1.7Mb 20ms DropTail     
$ns duplex-link-op $n3 $n4 orient right

$ns queue-limit $n1 $n3 10
$ns queue-limit $n2 $n4 10
$ns queue-limit $n3 $n4 10

set tcp0 [new Agent/TCP]
$tcp0 set fid_ 0

$ns attach-agent $n2 $tcp0        

set sink0 [new Agent/TCPSink]
$ns attach-agent $n4 $sink0

$ns connect $tcp0 $sink0


set udp0 [new Agent/UDP]
$udp0 set fid_ 1

$ns attach-agent $n1 $udp0


set null0 [new Agent/Null]
$ns attach-agent $n4 $null0

$ns connect $udp0 $null0

set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0

set cbr0 [new Application/Traffic/CBR]
$ns at 0.1 "$cbr0 start"
$ns at 4.5 "$cbr0 stop"

$ns at 0.5 "$ftp0 start"
$ns at 4.0 "$ftp0 stop"

$ns at 5.0 "finish"

$ns run
