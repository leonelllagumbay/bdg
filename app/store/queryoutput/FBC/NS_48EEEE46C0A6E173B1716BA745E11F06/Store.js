Ext.define('Form.store.queryoutput.FBC.NS_48EEEE46C0A6E173B1716BA745E11F06.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_48EEEE46C0A6E173B1716BA745E11F06.Model',
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
				read:    Ext.NS_48EEEE46C0A6E173B1716BA745E11F06.Data.Read
		    }
			}
	    });
	this.callParent([config]);
	}
});