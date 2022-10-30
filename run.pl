use strict;

use Cwd            qw( abs_path );
use File::Basename qw( dirname );
use lib dirname( abs_path($0) );

use HeaderNode;

my $REGEX = '^\s*#include\s+<(.+)>';

my %walked = ();

sub get_headers {
    my $file    = shift;
    my $handle  = undef;
    my @headers = qw//;
    open( $handle, "<", $file ) or return \@headers;
    while (<$handle>) {
        push( @headers, $1 ) if /$REGEX/;
    }
    return \@headers;
}

sub walk_file {
    my $node    = shift;
    my $headers = get_headers( $node->get_file() );
    my $header  = '';
    foreach $header (@$headers) {
        my $dep_node = HeaderNode->new( { filepath => $header } );
        next if $walked{$header};
        $walked{$header} = 1;
        walk_file($dep_node);
        $node->add_dependency($dep_node);
    }
}

sub main {
	my $root = HeaderNode->new( { filepath => shift } );
	walk_file($root);
	print($root->to_string(), "\n");
}

main @ARGV;
