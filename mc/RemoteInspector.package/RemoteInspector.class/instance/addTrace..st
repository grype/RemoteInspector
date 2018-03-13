methods
addTrace: aString
	self  halt.
	aString isEmptyOrNil ifTrue: [ ^ self ].
	(RILLDBStackTraceParser new parse: aString) ifNotNil: [ :trace | backtraces add: trace ]