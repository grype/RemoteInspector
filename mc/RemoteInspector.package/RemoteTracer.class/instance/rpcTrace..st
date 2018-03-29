methods
rpcTrace: json
	| frame |
	json isEmptyOrNil
		ifTrue: [ ^ self ].
	frame := RemoteTracerFrame fromJson: json asJson.
	(RemoteTracerStackSignal withStack: {frame}) emit