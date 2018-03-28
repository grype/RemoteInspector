starting/stopping
start
	self isRunning
		ifTrue: [ ^ self ].
	super start.
	rpcResponder := LtJsonRpcResponder default initialize.
	rpcResponder addHandlerNamed: 'trace' block: [ :trace | self rpcTrace: trace ].
	rpcResponder server start