Ext.define('Form.store.queryoutput.FBC.NS_7EFF35F8A5AD502E1796C19F3BD0C458.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_7EFF35F8A5AD502E1796C19F3BD0C458.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{ property: 'eginpmsemp-RECDATECREATED', direction: 'ASC'}],
	filters: [{ dataIndex: 'eginpmsemp-PERSONNELIDNO', type: 'string'}],
	pageSize: 30,
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
					querycode: '7EFF35F8-A5AD-502E-1796C19F3BD0C458',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_7EFF35F8A5AD502E1796C19F3BD0C458.Data.Create,
					read:    Ext.NS_7EFF35F8A5AD502E1796C19F3BD0C458.Data.Read,
					update:  Ext.NS_7EFF35F8A5AD502E1796C19F3BD0C458.Data.Update,
					destroy: Ext.NS_7EFF35F8A5AD502E1796C19F3BD0C458.Data.Destroy
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