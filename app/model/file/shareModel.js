Ext.define('Form.model.file.shareModel', {
	extend: 'Ext.data.Model',
	fields: [{
		name: 'A_FILEID',
		type: 'string'
	},{
		name: 'A_FILENAME',
		type: 'string'
	},{
		name: 'B_SHARETOUID',
		type: 'string'
	},{
		name: 'B_DATESHARED',
		type: 'date'
	},{
		name: 'C_USERGRPID',
		type: 'string'
	},{
		name: 'C_DATESHARED',
		type: 'date'
	},{
		name: 'D_DESCRIPTION',
		type: 'string'
	}]
})