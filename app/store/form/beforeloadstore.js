Ext.define('Form.store.form.beforeloadstore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.form.filemodel',
	autoLoad: false,
	constructor: function(config){
		Ext.applyIf(config, {
			proxy: {
				type: 'direct',
				timeout: 300000,
				directFn: 'Ext.ss.lookup.getbeforeload',
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
