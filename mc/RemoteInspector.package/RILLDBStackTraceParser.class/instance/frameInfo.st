grammar
frameInfo
	^ frameAddress 
	, (#any asPParser starLazy flatten) 
	, ' at ' asPParser 
	, #any asPParser plus 
	, $: asPParser 
	, (#digit asPParser plus) 
	==> [ :arg | 
		self halt.
		]