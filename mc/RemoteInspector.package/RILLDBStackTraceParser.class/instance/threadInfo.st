grammar
threadInfo
	^ ($, asPParser , #any asPParser starLazy flatten) asPParser star ==> [ :args |
		self halt
		]