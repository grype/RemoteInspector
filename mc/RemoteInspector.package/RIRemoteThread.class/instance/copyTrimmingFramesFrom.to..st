copying
copyTrimmingFramesFrom: aFromBlock to: aToBlock
	| copy newFrames |
	copy := self copy.
	newFrames := frames copy.
	
	newFrames := newFrames
		detect: aFromBlock
		ifFound: [ :found | 
			OrderedCollection new
				addAll: (newFrames copyFrom: found);
				yourself ]
		ifNone: [ newFrames ].

	newFrames := newFrames reversed
		detect: aToBlock
		ifFound: [ :found |
			OrderedCollection new
				addAll: (newFrames copyUpToLast: found);
				add: found;
				yourself ]
		ifNone: [ newFrames ].

	copy frames: newFrames.

	^ copy