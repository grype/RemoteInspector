grammar
threadLine
	^ currentMarker optional 
	, #space asPParser star flatten
	, 'thread ' asPParser
	, frameNumber 
	, threadInfo optional 
	==> [ :matches | 
		| thread |
		thread := RIRemoteThread new.
		matches first ifNotNil: [ :current | thread isCurrent: true ].
		matches fourth ifNotNil: [ :num | thread number: num ].
		matches fifth ifNotNil: [ :attrs | thread attributes addAll: attrs ].
		thread
		]