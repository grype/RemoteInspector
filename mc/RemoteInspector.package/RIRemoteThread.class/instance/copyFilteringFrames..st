copying
copyFilteringFrames: aBlock
	| copy |
	copy := self copy.
	copy frames: (self frames select: aBlock).
	^ copy