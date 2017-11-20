methods
inspect: anObj at: inspectorKey
	data at: inspectorKey put: (NeoJSONReader fromString: anObj).
	self updateAndShow.