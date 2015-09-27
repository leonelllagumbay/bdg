Ext.define('Form.store.queryoutput.FBC.NS_48E5A919C621E9A46869283C82751148.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_48E5A919C621E9A46869283C82751148.Model',
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
				read:    Ext.NS_48E5A919C621E9A46869283C82751148.Data.Read
		    }
			}
	    });
	this.callParent([config]);
	}
});