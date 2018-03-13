printing
printString
	| stream |
	stream := '' writeStream.
	self printStringOn: stream.
	^ stream contents