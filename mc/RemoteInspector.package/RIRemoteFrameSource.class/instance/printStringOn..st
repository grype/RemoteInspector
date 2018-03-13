printing
printStringOn: aStream
	module ifNotNil: [ :m | aStream nextPutAll: m; nextPut: $` ].
	caller ifNotNil: [ :c | aStream nextPutAll: c ].
	file ifNotNil: [ :f | aStream nextPutAll: ' at '; nextPutAll: f ].
	lineNumber ifNotNil: [ :l | aStream nextPut: $:; nextPutAll: l greaseString ].
	offset ifNotNil: [ :o | aStream nextPutAll: ' + '; nextPutAll: o greaseString ].