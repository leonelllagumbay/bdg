Ext.define('Form.store.query.outputType', {
	extend: 'Ext.data.Store',
	fields: ['outputtypename','outputtypecode'],
	data: [{
		outputtypename: 'Grid',
		outputtypecode: 'grid'
	},{
		outputtypename: 'Chart',
		outputtypecode: 'chart'
	},{
		outputtypename: 'Tree',
		outputtypecode: 'tree'
	}]	
});
