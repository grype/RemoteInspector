grammar
frameLocation
	^ #any asPParser starLazy flatten 
		, $` asPParser
		, #newline asPParser negate starLazy flatten 
		, ($+ asPParser , #space asPParser star) asPParser flatten
		, #digit asPParser plus flatten
		==> [ :matches | 
			RIRemoteFrameSource new
				module: matches first;
				caller: matches third;
				offset: matches fifth;
				yourself ]