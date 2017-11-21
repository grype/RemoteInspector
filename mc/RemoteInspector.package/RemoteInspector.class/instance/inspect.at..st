methods
inspect: anObj at: inspectorKey
	data at: inspectorKey put: anObj.
	self updateAndShow.