building presentations
valueFor: anObj
	^ (self isObjectWithChildren: anObj value)
		ifTrue: [ self valueForCollection: anObj ]
		ifFalse: [ anObj value ]