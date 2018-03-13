initialization
initialize
	super initialize.
	data := Dictionary new.
	announcer := Announcer new.
	backtraces := OrderedCollection new