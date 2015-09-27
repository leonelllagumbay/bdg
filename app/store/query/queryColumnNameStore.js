Ext.define('Form.store.query.queryColumnNameStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.query.queryColumnNameModel',
	pageSize: 50,
	autoLoad: false,
	constructor: function(config){
		Ext.applyIf(config, {
			proxy: {
				type: 'direct',
				timeout: 300000,
				extraParams: {
					equerycode: ''
				},
				directFn: 'Ext.qd.Lookup.getQueryColumnNames',
				paramOrder: ['limit', 'page', 'query', 'start', 'equerycode'],
				reader: {
					root: 'topics',
					totalProperty: 'totalCount'
				}
			}
		});
		this.callParent([config]);
	}
});
