grammar
frameLine
	^ #space asPParser star flatten
	, (currentMarker , #space asPParser) optional 
	, 'frame ' asPParser 
	, frameNumber 
	, frameInfo optional 
	==> [ :matches | 
		| frame |
		frame := RIRemoteFrame new.
		matches third ifNotNil: [ :current | frame isCurrent: true ].
		frame
		]