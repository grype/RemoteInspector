displaying
gtDisplayOn: aStream
	source
		ifNil: [ self printAddressOn: aStream ]
		ifNotNil: [ :src | 
			self printAddressOn: aStream.
			aStream
				nextPut: Character space;
				nextPutAll: source module greaseString.
			source file
				ifNotNil: [ :f | 
					aStream
						nextPutAll: f;
						nextPut: $:;
						nextPutAll: source lineNumber greaseString ] ]