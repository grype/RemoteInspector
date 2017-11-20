building presentations
valueForCollection: aCollection
	^ aCollection value class asString , ' with '
		, (self objectChildren: aCollection value) size asString , ' items'