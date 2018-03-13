printing
printStringOn: aStream
	address ifNotNil: [ :addr | self printAddressOn: aStream ].
	source ifNotNil: [ :src | aStream nextPutAll: src printString ]