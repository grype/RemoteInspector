methods
rpcTrace: json
	| stack |
	json isEmptyOrNil
		ifTrue: [ ^ self ].
	stack := RemoteTracerStack fromJson: json asJson.
	(RemoteTracerStackSignal withStack: stack frames) emit