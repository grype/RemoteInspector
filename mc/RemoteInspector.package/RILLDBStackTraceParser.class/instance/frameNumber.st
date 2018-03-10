grammar
frameNumber
	^ $# asPParser , #digit asPParser plus flatten ==> [ :matches | matches last asInteger ]