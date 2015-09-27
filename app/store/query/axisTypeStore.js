Ext.define('Form.store.query.axisTypeStore', {
	extend: 'Ext.data.Store',
	fields: ['axistypecode','axistypename'],
	data: [{
		axistypecode: 'Numeric',
		axistypename: 'Numeric'
	},{
		axistypecode: 'Category',
		axistypename: 'Category'
	},{
		axistypecode: 'gauge',
		axistypename: 'Gauge'
	},{
		axistypecode: 'Time',
		axistypename: 'Time'
	},{
		axistypecode: 'Radial',
		axistypename: 'Radial'
	}]	
});
