Ext.define('Form.store.queryoutput.FBC.NS_48E84394A2649D06E1034D98E9CD4A63.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_48E84394A2649D06E1034D98E9CD4A63.Model',
	autoLoad: true,
	constructor : function(config) {
		Ext.applyIf(config, {
			proxy  : {
				type: 'direct',
				reader: {
					root: 'topics',
					totalProperty: 'totalCount'
				},
				
				
			extraParams: {
				chartparams: {}
			},
			timeout: 300000,
			paramOrder: ['page','start','limit','chartparams'],
			api: {
				read:    Ext.NS_48E84394A2649D06E1034D98E9CD4A63.Data.Read
		    }
			}
	    });
	this.callParent([config]);
	}
});