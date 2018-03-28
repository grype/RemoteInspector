methods
rpcTrace: aString
	self halt.
	aString isEmptyOrNil ifTrue: [ ^ self ].
	RemoteTracerStackSignal withStack: aString