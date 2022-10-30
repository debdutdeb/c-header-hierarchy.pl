package HeaderNode;

use strict;
use warnings;

sub new {
    my ( $class, $args ) = @_;

    # deps is supposed to be more HeaderNode refs
    my $self = bless { filepath => $args->{"filepath"}, deps => undef }, $class;
    return $self;
}

sub add_dependency {
    my $self = shift;
    my $node = shift;
    push( @{ $self->{"deps"} }, $node );
}

sub get_file {
    return shift->{"filepath"};
}

sub get_deps {
    return shift->{"deps"};
}

sub to_string {
    my $self       = shift;
    my $_to_string = undef;
    my $delim      = " => ";
    my @string     = ( $self->{'filepath'} );
    $_to_string = sub {
        my $node          = shift;
        my $indent_length = shift;
        my $dep           = undef;
        return unless defined( $node->{"deps"} );
        foreach $dep ( @{ $node->{"deps"} } ) {
            push( @string, " " x $indent_length . $delim . $dep->{"filepath"} );

            #$_to_string->( $dep, length( $string[-1] ) );
            $_to_string->( $dep, $indent_length + 2 );
        }
    };

    #&$_to_string( $self, length( $string[-1] ) );
    &$_to_string( $self, 2 );
    return join( "\n", @string );
}

return 1;
