building presentations
buildBrowser
	browser := GLMTabulator new.
	browser title: 'Remote Inspector'.
	browser column: #list.
	browser transmit
		to: #list;
		andShow: [ :presentation | 
			presentation fastTreeTable
				title: 'Data';
				display: [ :obj | obj associations ];
				column: 'Key' evaluated: [ :each | self keyFor: each ];
				column: 'Value' evaluated: [ :each | self valueFor: each ];
				hasChildren: [ :each | self isObjectWithChildren: each value ];
				children: [ :each | self objectChildren: each value ];
				updateOn: RemoteInspectorDataUpdated from: [ :model | self announcer ] ]