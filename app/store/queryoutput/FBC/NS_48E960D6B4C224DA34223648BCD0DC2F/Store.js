Ext.define('Form.store.queryoutput.FBC.NS_48E960D6B4C224DA34223648BCD0DC2F.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_48E960D6B4C224DA34223648BCD0DC2F.Model',
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
				read:    Ext.NS_48E960D6B4C224DA34223648BCD0DC2F.Data.Read
		    }
			}
	    });
	this.callParent([config]);
	}
});