grammar
threadLine
	^ (currentMarker optional , #space asPParser star) asPParser flatten
	, 'thread ' asPParser
	, frameNumber 
	, threadInfo optional 
	==> [ :matches | 
		| thread |
		thread := RIRemoteThread new.
		matches first ifNotNil: [ :current | thread isCurrent: true ].
		matches third ifNotNil: [ :num | thread number: num ].
		thread
		]