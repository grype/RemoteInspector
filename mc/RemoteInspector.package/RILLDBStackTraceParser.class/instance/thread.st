grammar
thread
	^ (threadLine , (#newline asPParser , frameLine) star)
		==> [ :matches | 
			matches first
				frames: matches second;
				yourself ]