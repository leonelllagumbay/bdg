Ext.define('Form.store.queryoutput.FBC.NS_2CDB0EB8D75A2A5C8FE1D92B9D9F29C9.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_2CDB0EB8D75A2A5C8FE1D92B9D9F29C9.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"glkschool-SCHOOLNAME","direction":"ASC"}],
	filters: [{"dataIndex":"glkschool-SCHOOLNAME","type":"string"}],
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
					querycode: '2CDB0EB8-D75A-2A5C-8FE1D92B9D9F29C9',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_2CDB0EB8D75A2A5C8FE1D92B9D9F29C9.Data.Create,
					read:    Ext.NS_2CDB0EB8D75A2A5C8FE1D92B9D9F29C9.Data.Read,
					update:  Ext.NS_2CDB0EB8D75A2A5C8FE1D92B9D9F29C9.Data.Update,
					destroy: Ext.NS_2CDB0EB8D75A2A5C8FE1D92B9D9F29C9.Data.Destroy
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