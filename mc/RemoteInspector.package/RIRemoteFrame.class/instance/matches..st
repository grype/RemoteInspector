testing
matches: aRegex
	^ info ifNil: [ false ] ifNotNil: [ info matches: aRegex ]