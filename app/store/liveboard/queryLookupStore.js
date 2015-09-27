Ext.define('Form.store.liveboard.queryLookupStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.liveboard.queryLookupModel',
	autoLoad: true,
	constructor: function(config) {
		Ext.applyIf(config, {
			proxy: {
				type: 'direct',
				timeout: 300000,
				directFn: 'Ext.liveboard.Lookup.getQuery',
				paramOrder: ['limit', 'page', 'query', 'start'],
				reader: {
					root: 'topics',
					totalProperty: 'totalCount'
				}
			}
		});
		this.callParent([config]);
	}
});
