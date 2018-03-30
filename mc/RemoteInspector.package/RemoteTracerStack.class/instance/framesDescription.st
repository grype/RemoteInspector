accessing-magritte
framesDescription
	<magritteDescription>
	^ MAToManyRelationDescription new
		label: 'Frames';
		classes: { RemoteTracerFrame };
		beOrdered;
		accessor: #frames;
		jsonName: #frames;
		yourself
		