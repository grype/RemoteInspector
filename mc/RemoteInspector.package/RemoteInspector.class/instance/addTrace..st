methods
addTrace: aString
	aString isEmptyOrNil ifTrue: [ ^ self ].
	(RILLDBStackTraceParser new parse: aString) ifNotNil: [ :trace | backtraces add: trace ]