package App::URIInfoUtils;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

our %SPEC;

$SPEC{uri_info} = {
    v => 1.1,
    summary => 'Extract information from one or more URIs',
    args => {
        uris => {
            'x.name.is_plural' => 1,
            'x.name.singular' => 'uri',
            schema => ['array*', of=>'str*'], # XXX uri
            req => 1,
            cmdline_src => 'stdin_or_args',
        },
        # XXX include_plugins
        # XXX exclude_plugins
    },
};
sub uri_info {
    require URI::Info;

    my %args = @_;

    my $ui = URI::Info->new(
        # include_plugins => ...
        # exclude_plugins => ...
    );

    my @rows;
    for my $uri (@{$args{uris}}) {
        my $res = $ui->info($uri);
        push @rows, $res;
    }
    [200, "OK", \@rows];
}

1;
#ABSTRACT: Utilities related to URI::Info

=head1 DESCRIPTION

This distributions provides the following command-line utilities:

# INSERT_EXECS_LIST


=head1 SEE ALSO

L<URI::Info>

=cut
