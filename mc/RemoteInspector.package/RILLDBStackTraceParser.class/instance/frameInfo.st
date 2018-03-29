grammar
frameInfo
	^ frameAddress 
	, (frameSourceWithFile / frameLocation / frameSource)
	==> [ :matches | 
		RIRemoteFrameInfo new 
			address: matches first; 
			source: matches second;
			yourself.
		]