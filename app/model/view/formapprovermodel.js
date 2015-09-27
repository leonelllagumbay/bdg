Ext.define('Form.model.view.formapprovermodel', {
	extend: 'Ext.data.Model',
	fields: [
		'APPROVERSID',
		'ROUTERIDFK',
		'PROCESSIDFK',
		{
			name: 'APPROVERORDER',
			type: 'int'
		},
		'APPROVERNAME',
		{
			name: 'CANVIEWROUTEMAP',
			type: 'boolean'
		}, 
		{
			name: 'CANOVERRIDE',
			type: 'boolean'
		},
		{
			name: 'USERID',
			type: 'boolean'
		},
		'PERSONNELIDNO',
		'USERGRPID',
		'CONDITIONABOVE',
		'CONDITIONBELOW',
		'APPROVEDVALUE',
		'DISAPPROVEDVALUE',
		'RECCREATEDBY',
		{
			name: 'DATELASTUPDATE',
			type: 'date'
		}
		
	]
});

