grammar
frameInfo
	^ frameAddress 
	, (frameSource / frameLocation)
	==> [ :matches | 
		RIRemoteFrameInfo new 
			address: matches first; 
			source: matches second;
			yourself.
		]