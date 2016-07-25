package WebSocketFull::Socket;
use base 'Mojolicious::Controller';
use Mojo::EventEmitter;
use utf8;

sub socket {
    my $c = shift;
    $c->on(message => sub { 
        my @alphabet = ('A'..'F', '0'..'9');
        $c->presses->emit(colornew => "#" . (join '', map $alphabet[rand @alphabet], 0..5)) 
      });
    my $cb = $c->app->presses->on(colornew => sub { $c->send(pop) });
}

1;
