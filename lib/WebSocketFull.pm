package WebSocketFull;
use Mojo::Base 'Mojolicious';
use Mojo::EventEmitter;
use utf8;

sub startup {
    my $self = shift;
    $self->plugin('PODRenderer');
    my $r = $self->routes;  
    $self->helper(presses => sub { state $presses = Mojo::EventEmitter->new }); 

    $r->get('/')           -> to('client#client');
    $r->get('/1')          -> to('server#server');
    $r->get('/2')          -> to('client#client');
    $r->websocket('/test') -> to('socket#socket');
}


1;
