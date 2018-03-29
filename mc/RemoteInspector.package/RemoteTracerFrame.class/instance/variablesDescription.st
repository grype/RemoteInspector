accessing-magritte
variablesDescription
	<magritteDescription>
	^ MAToManyRelationDescription new
		label: 'Variables';
		classes: { RemoteTracerVariable };
		beOrdered;
		accessor: #variables;
		jsonName: #variables;
		yourself
		