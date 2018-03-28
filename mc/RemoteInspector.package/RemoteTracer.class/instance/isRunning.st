querying
isRunning
	^ rpcResponder ifNil: [ false ] ifNotNil: [ :r | r isRunning ]