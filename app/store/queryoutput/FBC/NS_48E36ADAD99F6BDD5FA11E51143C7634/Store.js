Ext.define('Form.store.queryoutput.FBC.NS_48E36ADAD99F6BDD5FA11E51143C7634.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_48E36ADAD99F6BDD5FA11E51143C7634.Model',
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
				read:    Ext.NS_48E36ADAD99F6BDD5FA11E51143C7634.Data.Read
		    }
			}
	    });
	this.callParent([config]);
	}
});