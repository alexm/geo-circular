#!/usr/bin/env perl
use Mojolicious::Lite;

app->defaults( layout => 'default' );

get '/' => sub { shift->render('index') };

app->start;
