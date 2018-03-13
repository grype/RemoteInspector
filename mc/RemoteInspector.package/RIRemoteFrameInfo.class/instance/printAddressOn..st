printing
printAddressOn: aStream
	aStream
		nextPutAll: '0x';
		nextPutAll: ((address printStringRadix: 16) copyReplaceFrom: 1 to: 3 with: '')