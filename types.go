// Copyright (C) 2014 Jakob Borg and Contributors (see the CONTRIBUTORS file).

package main

// Cannot reuse discover type, as generating XDR fails.
type relay struct {
	address string
	latency int32 // milliseconds
}

type address struct {
	address string
	seen    int64 // epoch seconds
}

type addressList struct {
	addresses []address
	relays    []relay
}
