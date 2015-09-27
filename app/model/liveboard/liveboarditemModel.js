Ext.define('Form.model.liveboard.liveboarditemModel', {
	extend: 'Ext.data.Model',
	fields: [{
		name: 'LIVEBOARDITEMCODE',
		type: 'string'
	},{
		name: 'LIVEBOARDCODE',
		type: 'string'
	},{
		name: 'XTYPE',
		type: 'string'
	},{
		name: 'XTYPETITLE',
		type: 'string'
	},{
		name: 'ROWSPAN',
		type: 'int'
	},{
		name: 'COLSPAN',
		type: 'int'
	},{
		name: 'BODYSTYLE',
		type: 'string'
	},{
		name: 'CELLCLS',
		type: 'string'
	},{
		name: 'HTML',
		type: 'string'
	},{
		name: 'ITEMORDER',
		type: 'int'
	},{
		name: 'LIVEBOARDITEMEXTRA',
		type: 'string'
	}] 
})