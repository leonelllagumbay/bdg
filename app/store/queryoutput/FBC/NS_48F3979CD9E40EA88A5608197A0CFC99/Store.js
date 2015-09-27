Ext.define('Form.store.queryoutput.FBC.NS_48F3979CD9E40EA88A5608197A0CFC99.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_48F3979CD9E40EA88A5608197A0CFC99.Model',
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
				read:    Ext.NS_48F3979CD9E40EA88A5608197A0CFC99.Data.Read
		    }
			}
	    });
	this.callParent([config]);
	}
});