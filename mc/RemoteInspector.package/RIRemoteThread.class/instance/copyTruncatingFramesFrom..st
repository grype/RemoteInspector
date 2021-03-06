copying
copyTruncatingFramesFrom: aBlock
	| copy |
	copy := self copy.
	copy
		frames:
			(self frames
				detect: aBlock
				ifFound: [ :found | 
					OrderedCollection new
						add: found;
						addAll: (self frames copyUpTo: found);
						yourself ]
				ifNone: [ self frames ]).
	^ copy