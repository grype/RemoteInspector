copying
copyWithFramesMatching: aRegex
	^ self copyFilteringFrames: [ :frame | frame matches: aRegex ]