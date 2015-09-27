Ext.define('Form.store.queryoutput.FBC.NS_80C9F6FC90B74FB7FDF3B78C69508B26.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_80C9F6FC90B74FB7FDF3B78C69508B26.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"eginpmscomment-COMMENTCODE","direction":"ASC"}],
	filters: [{"dataIndex":"eginpmscomment-COMMENTCODE","type":"int"}],
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
					querycode: '80C9F6FC-90B7-4FB7-FDF3B78C69508B26',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_80C9F6FC90B74FB7FDF3B78C69508B26.Data.Create,
					read:    Ext.NS_80C9F6FC90B74FB7FDF3B78C69508B26.Data.Read,
					update:  Ext.NS_80C9F6FC90B74FB7FDF3B78C69508B26.Data.Update,
					destroy: Ext.NS_80C9F6FC90B74FB7FDF3B78C69508B26.Data.Destroy
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