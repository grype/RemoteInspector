grammar
frameSource
	^ #any asPParser starLazy flatten 
		, $` asPParser
		, #newline asPParser negate star flatten 
		==> [ :matches | 
			RIRemoteFrameSource new
				module: matches first;
				caller: matches third;
				yourself ]