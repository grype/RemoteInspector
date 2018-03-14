testing
matches: aRegex
	module
		ifNotNil: [ :m | 
			(aRegex search: m)
				ifTrue: [ ^ true ] ].
	file
		ifNotNil: [ :f | 
			(aRegex search: f)
				ifTrue: [ ^ true ] ].
	caller
		ifNotNil: [ :c | 
			(aRegex search: c)
				ifTrue: [ ^ true ] ].
	^ false