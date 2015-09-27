Ext.define('Form.store.query.summarytype', {
	extend: 'Ext.data.Store',
	fields: ['summarytypename','summarytypecode'],
	data: [{
		summarytypename: 'count',
		summarytypecode: 'count'
	},{
		summarytypename: 'sum',
		summarytypecode: 'sum'
	},{
		summarytypename: 'min',
		summarytypecode: 'min'
	},{
		summarytypename: 'max',
		summarytypecode: 'max'
	},{
		summarytypename: 'average',
		summarytypecode: 'average'
	}]	
});
