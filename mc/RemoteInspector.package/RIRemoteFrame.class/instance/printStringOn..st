printing
printStringOn: aStream
	isCurrent ifTrue: [ aStream nextPutAll: '* ' ].
	aStream nextPutAll: 'frame #'; nextPutAll: number greaseString; nextPutAll: ': '.
	info ifNotNil: [ :i |
		aStream nextPutAll: i printString.
		].