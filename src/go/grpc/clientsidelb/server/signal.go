package main

import (
	"context"
	"fmt"
	"os"
	"os/signal"
)

// copied from https://github.com/oklog/run/blob/c7096881717ecba8d86fc591c1cee0940e31ec2a/actors.go

// SignalHandler returns an actor, i.e. an execute and interrupt func, that
// terminates with SignalError when the process receives one of the provided
// signals, or the parent context is canceled.
func signalHandler(ctx context.Context, signals ...os.Signal) (execute func() error, interrupt func(error)) {
	ctx, cancel := context.WithCancel(ctx)
	return func() error {
			c := make(chan os.Signal, 1)
			signal.Notify(c, signals...)
			select {
			case sig := <-c:
				return SignalError{Signal: sig}
			case <-ctx.Done():
				return ctx.Err()
			}
		}, func(error) {
			cancel()
		}
}

// SignalError is returned by the signal handler's execute function
// when it terminates due to a received signal.
type SignalError struct {
	Signal os.Signal
}

// Error implements the error interface.
func (e SignalError) Error() string {
	return fmt.Sprintf("received signal %s", e.Signal)
}
