querying
isRunning
	^ responder ifNil: [ false ] ifNotNil: [ :r | r isRunning ]