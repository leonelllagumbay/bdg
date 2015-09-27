Ext.define('Form.store.queryoutput.FBC.NS_2DEB4B28CB7237C3F68289B40A6B42F6.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_2DEB4B28CB7237C3F68289B40A6B42F6.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"cin21empawards-REWARDCODE","direction":"ASC"}],
	filters: [{"dataIndex":"cin21empawards-REWARDCODE","type":"string"}],
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
					querycode: '2DEB4B28-CB72-37C3-F68289B40A6B42F6',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_2DEB4B28CB7237C3F68289B40A6B42F6.Data.Create,
					read:    Ext.NS_2DEB4B28CB7237C3F68289B40A6B42F6.Data.Read,
					update:  Ext.NS_2DEB4B28CB7237C3F68289B40A6B42F6.Data.Update,
					destroy: Ext.NS_2DEB4B28CB7237C3F68289B40A6B42F6.Data.Destroy
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