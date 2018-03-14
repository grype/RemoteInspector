testing
matches: aRegex
	address
		ifNotNil: [ :a | 
			(aRegex search: address greaseString)
				ifTrue: [ ^ true ] ].
	^ source ifNil: [ false ] ifNotNil: [ :s | source matches: aRegex ]