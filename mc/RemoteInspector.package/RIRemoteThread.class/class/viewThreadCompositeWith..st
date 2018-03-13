inspecting
viewThreadCompositeWith: aCollectionOfThreads
	| view |
	view := RTMondrian new.
	view shape label text: [ :aFrame |  
		|stream |
		stream := '' writeStream.
		aFrame info gtDisplayOn: stream.
		stream contents. 
		].
	view nodes: (aCollectionOfThreads flatCollectAsSet: #frames ).
	aCollectionOfThreads do: [ :thread | 
		thread frames overlappingPairsDo: [ :a :b | 
			view edges connectFrom: [ :x | b ] to: [ :x | a ].
			]
		].
	view layout tree.
	^ view