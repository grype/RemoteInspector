grammar
frameLine
	^ #space asPParser star
	, (currentMarker , #space asPParser star) asPParser optional 
	, 'frame ' asPParser 
	, frameNumber 
	, ($: asPParser , #space asPParser star) asPParser flatten
	, frameInfo optional 
	==> [ :matches | 
		RIRemoteFrame new 
			isCurrent: (matches second isNotNil);
			number: matches fourth;
			info: matches last;
			yourself.
		]