#!/usr/bin/env perl
use Mojolicious::Lite;

app->defaults( layout => 'default' );

my @pages = qw(
    index
    presentacio
    recorregut
    perfil-i-controls
    reglament
    inscripcions
);

for my $page (@pages) {
    get "/$page" => sub { shift->render($page) };
}

app->start;
