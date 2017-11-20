starting/stopping
start
	self isRunning
		ifTrue: [ self stop ].
	responder := LtJsonRpcResponder default initialize.
	responder addHandlerNamed: 'inspect' block: [ :key :val | self inspect: val at: key ].
	responder addHandlerNamed: 'reset' block: [ self reset ].
	responder server start