package WebSocketFull::Socket;

sub socket {
    my $self = shift;
    # $self->inactivity_timeout(3600);

    $self->on(message => sub { 
        my @alphabet = ('A'..'F', '0'..'9');
        $self->events->emit(colornew => "#" . (join '', map $alphabet[rand @alphabet], 0..5)) 
      });

    my $cb = $self->events->on(colornew => sub { $self->send(pop) });
}

1;
