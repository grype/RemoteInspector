displaying
gtDisplayOn: aStream
	source ifNil: [ self printAddressOn: aStream ] ifNotNil: [ :src | src gtDisplayOn: aStream ]