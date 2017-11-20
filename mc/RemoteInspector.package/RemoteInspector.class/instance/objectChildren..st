building presentations
objectChildren: anObject
	(anObject isKindOf: Dictionary)
		ifTrue: [ ^ anObject associations ].
	((anObject isKindOf: SequenceableCollection) and: [ anObject isString not ])
		ifTrue: [ ^ anObject collectWithIndex: [ :val :index | index -> val ] ].
	^ anObject