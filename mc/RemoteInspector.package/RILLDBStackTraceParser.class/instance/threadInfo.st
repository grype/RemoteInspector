grammar
threadInfo
	^ ($, asPParser , #newline asPParser negate starLazy flatten) asPParser star ==> [ :matches | 
		matches collect: [ :each | each last ]
		]