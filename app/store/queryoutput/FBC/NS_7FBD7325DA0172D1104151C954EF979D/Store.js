Ext.define('Form.store.queryoutput.FBC.NS_7FBD7325DA0172D1104151C954EF979D.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_7FBD7325DA0172D1104151C954EF979D.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"eginpmsempopr-OPRCODE","direction":"ASC"}],
	filters: [{"dataIndex":"eginpmsempopr-OPRCODE","type":"string"}],
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
					querycode: '7FBD7325-DA01-72D1-104151C954EF979D',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_7FBD7325DA0172D1104151C954EF979D.Data.Create,
					read:    Ext.NS_7FBD7325DA0172D1104151C954EF979D.Data.Read,
					update:  Ext.NS_7FBD7325DA0172D1104151C954EF979D.Data.Update,
					destroy: Ext.NS_7FBD7325DA0172D1104151C954EF979D.Data.Destroy
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