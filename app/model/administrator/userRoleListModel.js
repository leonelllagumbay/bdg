Ext.define('Form.model.administrator.userRoleListModel', {
	extend: 'Ext.data.Model',
	fields: [{
		name: 'USERGRPID',
		type: 'string'
	},{
		name: 'DESCRIPTION',
		type: 'string'
	},{
		name: 'RECDATECREATED',
		type: 'date'
	},{
		name: 'DATELASTUPDATE',
		type: 'date'
	},{
		name: 'USERGRPIDFK',
		type: 'string'
	},{
		name: 'USERGRPMEMBERSIDX',
		type: 'string'
	}]
})