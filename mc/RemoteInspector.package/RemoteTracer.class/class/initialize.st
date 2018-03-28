class initialization
initialize
	DefaultInstance ifNotNil: [ :inspector | inspector stop ].
	DefaultInstance := self new