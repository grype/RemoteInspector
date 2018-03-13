*RemoteInspector
newline
"	^ PP2NewLineNode new"
	^ PP2PredicateObjectNode new
		predicate: (PP2CharSetPredicate on: [ :char | char = Character cr or: [ char = Character lf ] ]);
		predicateMessage: 'letter expected';
		negated: (PP2CharSetPredicate on: [ :char | char ~= Character cr and: [ char ~= Character lf ] ]);
		negatedMessage: 'letter not expected';
		yourself