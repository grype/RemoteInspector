instance creation
parseFromFile: aPath
	^ self new parse: aPath asFileReference readStream contents