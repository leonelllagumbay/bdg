Ext.define('Form.model.administrator.userMenuListModel', {
	extend: 'Ext.data.Model',
	fields: [{
		name: 'MENUID',
		type: 'string'
	},{
		name: 'MENUORDER',
		type: 'int'
	},{
		name: 'HIERARCHYLEVEL',
		type: 'int'
	},{
		name: 'MENUNAME',
		type: 'string'
	},{
		name: 'MENUHINT',
		type: 'string'
	},{
		name: 'TABIDFK',
		type: 'string'
	},{
		name: 'FOLDERIDFK',
		type: 'string'
	},{
		name: 'MENULOGO',
		type: 'string'
	},{
		name: 'PARENTMENUID',
		type: 'string'
	},{
		name: 'SOURCELINK',
		type: 'string'
	},{
		name: 'STYLE',
		type: 'string'
	},{
		name: 'EXTRAS',
		type: 'string'
	},{
		name: 'OBJECTIDFK',
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
})