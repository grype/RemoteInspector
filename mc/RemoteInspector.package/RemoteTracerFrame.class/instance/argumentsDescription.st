accessing-magritte
argumentsDescription
	<magritteDescription>
	^ MAToManyRelationDescription new
		label: 'Arguments';
		classes: { RemoteTracerVariable };
		beOrdered;
		accessor: #arguments;
		jsonName: #arguments;
		yourself
		