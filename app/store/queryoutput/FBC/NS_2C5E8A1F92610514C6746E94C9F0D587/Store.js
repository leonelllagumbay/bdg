Ext.define('Form.store.queryoutput.FBC.NS_2C5E8A1F92610514C6746E94C9F0D587.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_2C5E8A1F92610514C6746E94C9F0D587.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"cin21actualskills-LEVELOFADEPTNESS","direction":"ASC"}],
	filters: [{"dataIndex":"cin21actualskills-LEVELOFADEPTNESS","type":"string"}],
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
					querycode: '2C5E8A1F-9261-0514-C6746E94C9F0D587',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_2C5E8A1F92610514C6746E94C9F0D587.Data.Create,
					read:    Ext.NS_2C5E8A1F92610514C6746E94C9F0D587.Data.Read,
					update:  Ext.NS_2C5E8A1F92610514C6746E94C9F0D587.Data.Update,
					destroy: Ext.NS_2C5E8A1F92610514C6746E94C9F0D587.Data.Destroy
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