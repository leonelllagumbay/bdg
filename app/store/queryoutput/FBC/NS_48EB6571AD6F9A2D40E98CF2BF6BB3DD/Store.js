Ext.define('Form.store.queryoutput.FBC.NS_48EB6571AD6F9A2D40E98CF2BF6BB3DD.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_48EB6571AD6F9A2D40E98CF2BF6BB3DD.Model',
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
				read:    Ext.NS_48EB6571AD6F9A2D40E98CF2BF6BB3DD.Data.Read
		    }
			}
	    });
	this.callParent([config]);
	}
});