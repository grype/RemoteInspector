printing
printStringOn: aStream
	isCurrent
		ifTrue: [ aStream nextPutAll: '* ' ].
	aStream
		nextPutAll: 'thread #';
		nextPutAll: number greaseString.
	attributes isEmptyOrNil
		ifFalse: [ aStream
				nextPut: $,;
				nextPutAll: (attributes joinUsing: ', ') ]