# Workshop 2

## Assignment: Time Protocol with Network Sockets

### Description and Requirements

This workshop is concerned with the implementation of a client and a server for the Time Protocol specified in [RFC 868](http://tools.ietf.org/html/rfc868) (STD 026) using the socket application program interface (API).

There are no requirements regarding the programming language (e.g., Perl, C, C++, Java etc.) used to implement the client and server applications. The client and the server are required to run on the Linux machines and must be implemented for the UDP-based service and the TCP-based service. Make sure that your timestamp is compliant with the examples in [RFC 868](http://tools.ietf.org/html/rfc868).

Note, that the virtual nodes comes with a python3.5 and perl5.22 intepreter installed, and that the use of an intepreted language makes it easier to modify the program on the node.

#### Optional and not a mandatory part of the workshop:
The advanced student may want to implement one of the following features in addition to the pure client-server communication.

* Calculate the [clock skew](http://en.wikipedia.org/wiki/Clock_skew) between the server and the client and take action to set client clock to the server clock.
* The timestamp is encrypted by the server and decrypted by the client using a symmetric encryption scheme. The proposed scheme is to use the [XOR bitwise string operator](http://perldoc.perl.org/perlop.html#Bitwise-String-Operators) with a pre-shared key of same size as the timestamp (32 bit).

### Background

The socket concept is a client-server paradigm and a model of the interaction between applications running over a network. The socket API, that applications can use to access the TCP/IP protocols, is described in Comer Chapter 21. The book chapter also includes an example of a client and server implementing the TCP-based whois service specified in [RFC 954](http://tools.ietf.org/html/rfc954). An example of an echo client and server from the book Computer Networks and Internets (also by Comer) written in C is also available for inspiration.

A example of a Perl implementation of a client and a server program is given in an appendix below.

### Interoperability Tests

Each group is required to test their time protocol implementation (i.e., both client and server) against at least two independent implementations made by other groups. Each group must therefore advertise the location of their client and server applications (not the source code) with instructions on how to run it such that they can be executed by the other groups. This informations must be available from the course web pages in Campusnet using the "Student" folder in the File Sharing function.

The client and the server is required to take command-line arguments as specified below:

    tpudpclient <serverhost> <port>

    tptcpclient <serverhost> <port>

    tpudpserver <port>

    tptcpserver <port>

Note, that the time on a Linux system can be changed by issuing the following command with root privileges:

    date -s "01/01/1970 00:00:00"

where the date adn time has been reset to 1st of January 1970 at midnight.

Use Wireshark to identify the exchange of timestamps between the server and the client. Is the payload size in the packet 32 bit (4 bytes) as specified in [RFC 868](http://tools.ietf.org/html/rfc868)?

Possible Perl functions to consider: [localtime](http://perldoc.perl.org/functions/localtime.html), [pack](http://perldoc.perl.org/functions/pack.html), [unpack](http://perldoc.perl.org/functions/unpack.html)

### Reporting

The project must be documented in a short report of no more than two pages (excluding source code). The report should contain the following elements:

* A short overall description of how the implementation has been structured and a description of how to compile (if applicable) and use the programs. Remember to set the appropriate permission on the files.
* A description of how the socket API is used in the implementation.
* A description of how it has been ensured that the implementation conforms to the protocol standard as described in [RFC 868](http://tools.ietf.org/html/rfc868), including a documentation of the conformance testing described in the previous section.
* A description of problems encountered, assumptions and simplifications made (if applicable).
* An appendix containing the source code for the client and the server applications.
Reports should be emailed in pdf or ascii format to rhj@iha.dk.

### References

* Douglas E. Comer, Internetworking with TCP/IP, 5th edition, chapter 20-21.
* J. Postel and K. Harrenstien, Time Protocol, RFC 868, Internet Society, May 1983.
* Simon Cozens, Begining Perl, URL: http://www.perl.org/books/beginning-perl/.
* Perl Programming Documentation (version 5). URL: http://perldoc.perl.org/
* The Perl Cook book, Chapter 17: Sockets. URL: http://docstore.mik.ua/orelly/perl/cookbook/ch17_01.htm.
* Socket Programming Tutorial, URL: http://www.prasannatech.net/2008/07/socket-programming-tutorial.html

## Appendix A: Examples with Network Programming in Perl

Historically, network sockets is a Berkeley UNIX mechanism of creating a virtual duplex connection between processes. This was later ported on to every known operating systems enabling communication between systems across geographical location running on different OS software. If not for the socket, most of the network communication between systems would never ever have happened.

A typical computer system on a network receives and sends information as desired by the various applications running on it. This information is routed to the system, since a unique IP address is designated to it. On the system, this information is given to the relevant applications which listen on different ports. For example a net browser listens on port 80 for information. Also we can write applications which listen and send information on a specific port number.

For now, let's sum up that a socket is an IP address and a port, enabling connection.

Below is a simple client and a simple server program written in Perl. This is followed by a short example on how to use command-line arguments in Perl. The program examples main be found in sharedLAB area. Following each program example a short description of the programs are given.

To explain the socket we will take an example of client-server Programming. To complete a client server architecture we would have to go through the following steps:

### Creating a Server

* Create a socket with socket call.
* Bind the socket to a port address with bind call.
* Listen to the socket at the port address with listen call.
* Accept client connections with accept call.

### Creating a Client

* Create a socket with socket call.
* Connect (the socket) to the remote machine with connect call.

### A simple server

```perl
#! /usr/bin/perl -w
# server0.pl
#--------------------

use strict;
use Socket;

# use port 7890 as default
my $port = shift || 7890;
my $proto = getprotobyname('tcp');

# create a socket, make it reusable
socket(SERVER, PF_INET, SOCK_STREAM, $proto) or die "socket: $!\n";
setsockopt(SERVER, SOL_SOCKET, SO_REUSEADDR, 1) or die "setsock: $!\n";

# grab a port on this machine
my $paddr = sockaddr_in($port, INADDR_ANY);

# bind to a port, then listen
bind(SERVER, $paddr) or die "bind: $!\n";
listen(SERVER, SOMAXCONN) or die "listen: $!\n";
print "SERVER started on port $port.\n";

# accepting a connection
my $client_addr;
while ($client_addr = accept(CLIENT, SERVER))
{

    # find out who connected
    my ($client_port, $client_ip) = sockaddr_in($client_addr);
    my $client_ipnum = inet_ntoa($client_ip);
    my $client_host = gethostbyaddr($client_ip, AF_INET);

    # print who has connected
    print "got a connection from: $client_host","[$client_ipnum] ";

    # send them a message, close connection
    print CLIENT "Smile from the server.\n";
    close CLIENT;
 }
```

#### Analysis

This simple server can run just on one machine that can service only one client program at a time connecting from the same or a different machine. Recall that the steps for creating a server were to create a socket, bind it to a port, listen at the port and accept client connections.

* __Line 1 and 4:__ The Perl script is compiled using strict. This requires all variables to be declared with the "my" function before they are used. Using "my" may be inconvenient, but it can catch common syntactically correct yet logically incorrect programming bugs.
* __Line 7:__ The variable $port is assigned the first command-line argument or port 7890 as the default. When choosing a port for your server, pick one that is unused on your machine.
* __Line 10 and 11:__ The socket is created using the socket function. A socket is like a file handle-it can be read from, written to or both. The function setsockopt is called to ensure that the port will be immediately reusable.
* __Line 13:__ The sockaddr_in function obtains a port on the server. The argument INADDR_ANY chooses one of the server's virtual IP addresses. You could instead decide to bind only one of the virtual IP addresses by replacing INADDR_ANY with inet_aton("192.168.1.1") or gethostbyname ('localhost').
* __Line 15:__ The bind function binds the socket to the port, i.e., plugs the socket into that port.
* __Line 16:__ The listen function causes the server to begin listening at the port. The second argument to the listen function is the maximum queue length or the maximum number of pending client connections. The value SOMAXCONN is the maximum queue length for the machine being used.
* __Line 20:__ Once the server begins listening at the port, it can accept client connections using the accept function. When the client is accepted, a new socket is created named CLIENT which can be used like a file handle. Reading from the socket reads the client's output and printing to the socket sends data to the client. The return value of the accept function is the Internet address of the client in a packed format.
* __Line 24 and 25:__ The function sockaddr_in takes the packed format and returns the client's port number and the client's numeric Internet address in a packed format. The packed numeric Internet address can be converted to a text string representing the numeric IP using inet_ntoa (numeric to ASCII). To convert the packed numeric address to a host name, the function gethostbyaddr is used.

The program is run like this:

    perl -w server0.pl

And the output should look something like this

    SERVER started on port 7890
    The server is now listening at port 7890 on the local host, waiting for clients to connect.

#### Remarks

The function getprotobyname() requires the Linux file /etc/protocols to associate protocol names with numbers. For this workshop the following entries are needed when you use the VNE for testing:

    tcp     6	     TCP		# transmission control protocol
    udp     17	    UDP		# user datagram protocol

In addition, the VNE hosts need to be configured to use the /etc/hosts for name resolution since we do not have a running DNS service. To allow hostname resolution you may configure /etc/host.conf as follows:

    order hosts, bind
    multi on

and /etc/nsswitch.conf

    hosts    files

A /etc/hosts file could look something like the following, but needs of course to be adapted to your test setup.

    127.0.0.1    localhost
    10.0.0.1     theclient
    10.0.0.2     theserver

### A simple client

```perl
#! /usr/bin/perl -w
# client1.pl - a simple client
#----------------

use strict;
use Socket;

# initialize host and port
my $host = shift || 'localhost';
my $port = shift || 7890;

my $proto = getprotobyname('tcp');

# get the port address
my $iaddr = inet_aton($host);
my $paddr = sockaddr_in($port, $iaddr);

# create the socket, connect to the port
socket(SOCKET, PF_INET, SOCK_STREAM, $proto) or die "socket: $!\n";
connect(SOCKET, $paddr) or die "connect: $!\n";

my $line;
while ($line = <SOCKET> )  
{
    print $line;
}
close SOCKET or die "close: $!";
```

#### Analysis

* __Line 7 and 8:___ Takes the command-line arguments of host name and port number or if no arguments are passed initializes variables with the default values.
* __Line 11 and 12:__ The host name and the port number are used to generate the port address using inet_aton (ASCII to numeric) and sockaddr_in.
* __Line 14 and 15:__ A socket is created using socket and the client connects the socket to the port address using connect.
* __Line 17 and 21:__ The while loop then reads the data the server sends to the client until the end-of-file is reached, printing this input to STDOUT. Then the socket is closed.

### Command-line arguments in Perl

The example below shows how to capture command line arguments in Perl.

```perl
#!/usr/bin/perl -w
if ($#ARGV != 1 ) {
    print "usage: serverprogram <server> <port>\n";
    exit;
}

# capture the arguments into variables
$server=$ARGV[0];
$port=$ARGV[1];
```
