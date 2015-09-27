Ext.define('Form.model.administrator.userAppListModel', {
	extend: 'Ext.data.Model',
	fields: [{
		name: 'APPID',
		type: 'string'
	},{
		name: 'FOLDERIDFK',
		type: 'string'
	},{
		name: 'TABIDFK',
		type: 'string'
	},{
		name: 'OBJECTIDFK',
		type: 'string'
	},{
		name: 'SCRIPTREQUIRES',
		type: 'string'
	},{
		name: 'NAMEORTITLE',
		type: 'string'
	},{
		name: 'APPORDER',
		type: 'int'
	},{
		name: 'EXTNAMESPACE',
		type: 'string'
	},{
		name: 'EXTCONTROLLERS',
		type: 'string'
	},{
		name: 'URLIFNOTEXT',
		type: 'string'
	},{
		name: 'APISCRIPTSOURCE',
		type: 'string'
	},{
		name: 'APPICON',
		type: 'string'
	},{
		name: 'EXTRACSS',
		type: 'string'
	},{
		name: 'EXTRACODE',
		type: 'string'
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
		name: 'DATELASTUPDATE',
		type: 'date'
	},{
		name: 'DATEACTIONWASDONE',
		type: 'date'
	},{
		name: 'RECDATECREATED',
		type: 'date'
	}]
});