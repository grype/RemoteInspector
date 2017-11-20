building presentations
keyFor: anObj
	^ (anObj respondsTo: #key)
		ifTrue: [ anObj key ]
		ifFalse: [ '' ]