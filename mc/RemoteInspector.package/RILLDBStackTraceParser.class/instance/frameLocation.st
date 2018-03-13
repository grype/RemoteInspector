grammar
frameLocation
	^ #any asPParser starLazy flatten 
		, $` asPParser
		, #any asPParser starLazy flatten 
		, ($+ asPParser , #space asPParser star) asPParser flatten
		, #digit asPParser plus flatten
		==> [ :matches | 
			RIRemoteFrameSource new
				module: matches first;
				caller: matches third;
				offset: matches fifth;
				yourself ]