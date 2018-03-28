intialization
initializeWithStack: aRemoteContextStack
	super initialize.
	aRemoteContextStack ifNotNil: [ :s | remoteStack := s ]