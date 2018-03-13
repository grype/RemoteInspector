grammar
frameSource
	^ #any asPParser starLazy flatten 
		, $` asPParser
		, (#newline asPParser negate starLazy flatten , ' at ' asPParser) asPParser plus flatten
		, #newline asPParser negate starLazy flatten 
		, $: asPParser
		, #digit asPParser plus flatten
		==> [ :matches | 
			RIRemoteFrameSource new
				module: matches first;
				caller: matches third;
				file: matches fourth;
				lineNumber: matches sixth;
				yourself ]