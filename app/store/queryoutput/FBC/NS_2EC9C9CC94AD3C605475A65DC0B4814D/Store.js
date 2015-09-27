Ext.define('Form.store.queryoutput.FBC.NS_2EC9C9CC94AD3C605475A65DC0B4814D.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_2EC9C9CC94AD3C605475A65DC0B4814D.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"cin21personalinfo-BIRTHDAY","direction":"ASC"}],
	filters: [{"dataIndex":"cin21personalinfo-BIRTHDAY","type":"date"}],
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
					querycode: '2EC9C9CC-94AD-3C60-5475A65DC0B4814D',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_2EC9C9CC94AD3C605475A65DC0B4814D.Data.Create,
					read:    Ext.NS_2EC9C9CC94AD3C605475A65DC0B4814D.Data.Read,
					update:  Ext.NS_2EC9C9CC94AD3C605475A65DC0B4814D.Data.Update,
					destroy: Ext.NS_2EC9C9CC94AD3C605475A65DC0B4814D.Data.Destroy
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