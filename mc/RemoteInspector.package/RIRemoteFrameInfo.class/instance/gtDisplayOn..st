displaying
gtDisplayOn: aStream
	source
		ifNil: [ self printAddressOn: aStream ]
		ifNotNil: [ :src | 
			"self printAddressOn: aStream."
			aStream
				nextPut: Character space;
				nextPutAll: source module greaseString;
				nextPutAll: '::'.
			src caller ifNotNil: [ :clr | 
				aStream nextPutAll: ((clr copyUpTo: $( ) truncateTo: 75 ).
				].
			source file
				ifNotNil: [ :f | 
					aStream
						nextPutAll: ' at ';
						nextPutAll: (f splitOn: Character space) last;
						nextPut: $:;
						nextPutAll: source lineNumber greaseString ] ]