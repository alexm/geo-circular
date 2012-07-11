#!/usr/bin/env perl
use Mojolicious::Lite;

app->defaults( layout => 'default' );

chomp( my @pages = do { open my $fd, '<', 'PAGES' or die; <$fd> } );
print STDERR "Rendering... @pages\n";

for my $page (@pages) {
    get "/$page" => sub { shift->render($page) };
}

app->start;
