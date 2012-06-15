#!/usr/bin/env perl
use Mojolicious::Lite;

app->defaults( layout => 'default' );

my @pages = qw(
    index
    presentacio
    recorregut
    perfils-i-controls
    reglament
);

for my $page (@pages) {
    get "/$page" => sub { shift->render($page) };
}

app->start;
