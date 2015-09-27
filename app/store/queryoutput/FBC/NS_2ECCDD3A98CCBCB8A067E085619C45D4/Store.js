Ext.define('Form.store.queryoutput.FBC.NS_2ECCDD3A98CCBCB8A067E085619C45D4.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_2ECCDD3A98CCBCB8A067E085619C45D4.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"clkposition-DESCRIPTION","direction":"ASC"}],
	filters: [{"dataIndex":"clkposition-DESCRIPTION","type":"string"}],
	pageSize: 25,
	constructor : function(config) {
		Ext.applyIf(config, {
			proxy  : {
				type: 'direct',
				reader: {
					root: 'topics',
					totalProperty: 'totalCount'
				},
				
				
				timeout: 300000,
				extraParams: {
					querycode: '2ECCDD3A-98CC-BCB8-A067E085619C45D4',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_2ECCDD3A98CCBCB8A067E085619C45D4.Data.Create,
					read:    Ext.NS_2ECCDD3A98CCBCB8A067E085619C45D4.Data.Read,
					update:  Ext.NS_2ECCDD3A98CCBCB8A067E085619C45D4.Data.Update,
					destroy: Ext.NS_2ECCDD3A98CCBCB8A067E085619C45D4.Data.Destroy
				},
				paramsAsHash: false,
				filterParam: 'filter',
				sortParam: 'sort',
				limitParam: 'limit',
				idParam: 'ID',
				pageParam: 'page',
			}
		});
	this.callParent([config]);
	}
});