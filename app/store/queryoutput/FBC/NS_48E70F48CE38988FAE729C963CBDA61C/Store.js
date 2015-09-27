Ext.define('Form.store.queryoutput.FBC.NS_48E70F48CE38988FAE729C963CBDA61C.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_48E70F48CE38988FAE729C963CBDA61C.Model',
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
				read:    Ext.NS_48E70F48CE38988FAE729C963CBDA61C.Data.Read
		    }
			}
	    });
	this.callParent([config]);
	}
});