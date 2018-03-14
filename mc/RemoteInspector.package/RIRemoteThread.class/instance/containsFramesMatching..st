testing
containsFramesMatching: aRegex
	^ self frames detect: [ :frame | frame matches: aRegex ] ifFound: [ :found | true ] ifNone: [ false ]