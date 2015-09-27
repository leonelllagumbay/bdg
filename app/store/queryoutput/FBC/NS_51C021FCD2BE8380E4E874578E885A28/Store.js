Ext.define('Form.store.queryoutput.FBC.NS_51C021FCD2BE8380E4E874578E885A28.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_51C021FCD2BE8380E4E874578E885A28.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"cin21miscinfo1-SPECIALTALENTS","direction":"ASC"}],
	filters: [{"dataIndex":"cin21miscinfo1-SPECIALTALENTS","type":"string"}],
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
					querycode: '51C021FC-D2BE-8380-E4E874578E885A28',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_51C021FCD2BE8380E4E874578E885A28.Data.Create,
					read:    Ext.NS_51C021FCD2BE8380E4E874578E885A28.Data.Read,
					update:  Ext.NS_51C021FCD2BE8380E4E874578E885A28.Data.Update,
					destroy: Ext.NS_51C021FCD2BE8380E4E874578E885A28.Data.Destroy
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