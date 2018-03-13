displaying
gtDisplayOn: aStream
	isCurrent
		ifTrue: [ aStream nextPutAll: '* ' ].
	info ifNotNil: [ :i | i gtDisplayOn: aStream ]