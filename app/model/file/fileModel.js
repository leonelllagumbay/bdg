Ext.define('Form.model.file.fileModel', {
	extend: 'Ext.data.Model',
	fields: [{
		name: 'FILEID',
		type: 'string'
	},{
		name: 'FILENAME',
		type: 'string'
	},{
		name: 'FILEEXTENSION',
		type: 'string'
	},{
		name: 'FILECAPTION',
		type: 'string'
	},{
		name: 'SORTORDER',
		type: 'int'
	},{
		name: 'OBJECTIDFK',
		type: 'string'
	},{
		name: 'FOLDERIDFK',
		type: 'string'
	},{
		name: 'RECCREATEDBY',
		type: 'string'
	},{
		name: 'RECDATECREATED',
		type: 'date'
	},{
		name: 'DATELASTUPDATE',
		type: 'date'
	},{
		name: 'DATEACTIONWASDONE',
		type: 'date'
	},{
		name: 'PERSONNELIDNO',
		type: 'string'
	},{
		name: 'APPROVED',
		type: 'string'
	},{
		name: 'ACTIONBY',
		type: 'string'
	},{
		name: 'EFORMID',
		type: 'string'
	},{
		name: 'PROCESSID',
		type: 'string'
	},{
		name: 'FOLDERNAME',
		type: 'string'
	},{
		name: 'SHAREDBYNAME',
		type: 'string'
	},{
		name: 'SHAREDBYUSERID',
		type: 'string'
	}]
})