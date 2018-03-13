comparing
= anObject 
	anObject isRemoteThreadFrame ifFalse: [ ^ false ].
	^ self info address = anObject info address