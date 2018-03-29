accessing-magritte
nameDescription
	<magritteDescription>
	^ MAStringDescription new
		label: 'Name';
		accessor: #varname;
		jsonName: #name;
		yourself
		