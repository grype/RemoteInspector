grammar
thread
	^ threadLine 
	, frameLine star
		==> [ :matches | 
			matches first
				frames: matches second;
				yourself ]