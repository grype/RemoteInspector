building presentations
updateAndShow
	browser ifNil: [ self buildBrowser ].
	self isBrowserOpen
		ifTrue: [ announcer announce: RemoteInspectorDataUpdated new ]
		ifFalse: [ browserWindow := browser
				openOn:
					(Dictionary new
						at: 'data' put: self data;
						yourself) ]