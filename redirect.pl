#!/usr/bin/env perl
use strict;
use warnings;
use FCGI;
use sigtrap qw(handler death);

my $socket_uri = "/tmp/redirect.sock";
my %req_params;

unlink $socket_uri;
my $socket = FCGI::OpenSocket($socket_uri, 10);

sub death {
        FCGI::CloseSocket($socket);
        unlink $socket_uri;
}

my $request = FCGI::Request(\*STDIN, \*STDOUT, \*STDERR, \%req_params, $socket);

while ($request->Accept() >= 0) {
        if (substr($req_params{'REQUEST_URI'}, 0, 2) eq "/?") {
                print "$req_params{'SERVER_PROTOCOL'} 302 Found\r\n";
                print "Status: 302 Found\r\n";
                print "Location: " . substr($req_params{'REQUEST_URI'}, 2) . "\r\n";
                print "\r\n";
        } else {
                print "$req_params{'SERVER_PROTOCOL'} 200 OK\r\n";
                print "Content-type: text/html; charset=UTF-8\r\n";
                print "\r\n";

                print <<"END";
<html>
        <head>
                <title>Redirect!</title>
                <meta charset="utf-8" />
                <link rel="stylesheet" type="text/css" href="/style.css" />
        </head>
        <body>
                <h1>Redirect!</h1>
                <p>What is this, you might ask. It's a simple redirector.</p>
                <p>You use it by specifying something such as <a href="http://redirect.grpnx.org/?http://example.com"><code>http://redirect.grpnx.org/?http://example.com</code></a> and you are redirected to <a href="http://example.com"><code>http://example.com</code></a> with a 302 redirect.</p>
                <p>A CNAME for <code>redirect.grpnx.org</code> is <code>theredirector.github.io</code>.</p>
        </body>
</html>
END
        }
}
