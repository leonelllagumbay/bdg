Ext.define('Form.store.queryoutput.FBC.NS_8115E511910BCCE0ABB8BA275E904214.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_8115E511910BCCE0ABB8BA275E904214.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"clkmeasures-MEASURESCODE","direction":"ASC"}],
	filters: [{"dataIndex":"clkmeasures-MEASURESCODE","type":"string"}],
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
					querycode: '8115E511-910B-CCE0-ABB8BA275E904214',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_8115E511910BCCE0ABB8BA275E904214.Data.Create,
					read:    Ext.NS_8115E511910BCCE0ABB8BA275E904214.Data.Read,
					update:  Ext.NS_8115E511910BCCE0ABB8BA275E904214.Data.Update,
					destroy: Ext.NS_8115E511910BCCE0ABB8BA275E904214.Data.Destroy
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