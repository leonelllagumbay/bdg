Ext.define('Form.model.liveboard.liveboardlistModel', {
	extend: 'Ext.data.Model',
	fields: [{
		name: 'LIVEBOARDCODE',
		type: 'string'
	},{
		name: 'TABLECOLUMNS',
		type: 'int'
	},{
		name: 'LBTITLE',
		type: 'string'
	},{
		name: 'LBSTATUS',
		type: 'string'
	},{
		name: 'LIVEBOARDDESC',
		type: 'string'
	},{
		name: 'WIDTH',
		type: 'int'
	},{
		name: 'HEIGHT',
		type: 'int'
	},{
		name: 'RECDATECREATED',
		type: 'date'
	},{
		name: 'RECCREATEDBY',
		type: 'string'
	}]
})