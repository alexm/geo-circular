#!/usr/bin/env perl

use Modern::Perl 2012;

use Mojolicious::Lite;
use Text::CSV;

my %args = (
    "circular/resultats" => parse_csv('resultats.csv'),
);

app->defaults( layout => 'default' );

chomp( my @pages = do { open my $fd, '<', 'PAGES' or die; <$fd> } );
print STDERR "Rendering... @pages\n";

for my $page (@pages) {
    get "/$page" => sub { shift->render( $page, args => $args{$page} ) };
}

app->start;

sub parse_csv {
    my ($filename) = @_;

    my $csv = Text::CSV->new ( { binary => 1, sep_char => ';' } )  # should set binary attribute.
        or die "Cannot use CSV: ".Text::CSV->error_diag ();

    open my $fh, "<:encoding(utf8)", $filename or die "$filename: $!";
    my $rows_ref = $csv->getline_all($fh);
    close $fh;

    return $rows_ref;
}
