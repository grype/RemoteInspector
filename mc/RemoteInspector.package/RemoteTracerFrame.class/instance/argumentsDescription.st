accessing-magritte
argumentsDescription
	<magritteDescription>
	^ MAToManyRelationDescription new
		label: 'Arguments';
		beOrdered;
		accessor: #arguments;
		jsonName: #arguments;
		yourself
		