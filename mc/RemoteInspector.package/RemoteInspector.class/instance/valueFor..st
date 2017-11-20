building presentations
valueFor: anObj
	^ (self isObjectWithChildren: anObj value)
		ifTrue: [ self valueForCollection: anObj ]
		ifFalse: [ NeoJSONWriter toString: anObj value ]