grammar
frameSourceWithFile
	^ #any asPParser starLazy flatten 
		, $` asPParser
		, #newline asPParser negate starLazy flatten 
		, ' at ' asPParser plus flatten
		, #newline asPParser negate starLazy flatten 
		, $: asPParser
		, #digit asPParser plus flatten
		==> [ :matches | 
			RIRemoteFrameSource new
				module: matches first;
				caller: matches third;
				file: matches fifth;
				lineNumber: matches seventh;
				yourself ]