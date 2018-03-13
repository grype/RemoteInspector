displaying
gtDisplayOn: aStream
	source
		ifNil: [ self printAddressOn: aStream ]
		ifNotNil: [ :src | 
			| callerString separators |
			separators := CharacterSet empty
				add: Character space;
				add: $(;
				yourself.
			callerString := src caller copyReplaceAll: Character cr asString with: ''.
			callerString := callerString copyFrom: 1 to: (callerString indexOfAnyOf: separators) - 1.
			aStream
				nextPutAll: src module greaseString;
				nextPut: $`;
				nextPutAll: callerString ]