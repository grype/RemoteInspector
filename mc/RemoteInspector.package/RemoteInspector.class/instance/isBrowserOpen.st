querying
isBrowserOpen
	^ browserWindow isNotNil and: [ browserWindow owner isNotNil  ]