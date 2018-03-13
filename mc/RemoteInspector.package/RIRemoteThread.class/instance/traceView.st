inspecting
traceView
	| view |
	view := RTMondrian new.
	view shape label
		text: [ :aFrame | 
			| stream |
			stream := '' writeStream.
			aFrame gtDisplayOn: stream.
			stream contents ].
	view nodes: self frames asSet.
	self frames overlappingPairsDo: [ :a :b | view edges connectFrom: [ :x | b ] to: [ :x | a ] ].
	view layout tree.
	^ view