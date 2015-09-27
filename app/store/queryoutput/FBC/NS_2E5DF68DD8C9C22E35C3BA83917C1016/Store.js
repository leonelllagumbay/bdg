Ext.define('Form.store.queryoutput.FBC.NS_2E5DF68DD8C9C22E35C3BA83917C1016.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_2E5DF68DD8C9C22E35C3BA83917C1016.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"cin21empextra-ORGANIZATION","direction":"ASC"}],
	filters: [{"dataIndex":"cin21empextra-ORGANIZATION","type":"string"}],
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
					querycode: '2E5DF68D-D8C9-C22E-35C3BA83917C1016',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_2E5DF68DD8C9C22E35C3BA83917C1016.Data.Create,
					read:    Ext.NS_2E5DF68DD8C9C22E35C3BA83917C1016.Data.Read,
					update:  Ext.NS_2E5DF68DD8C9C22E35C3BA83917C1016.Data.Update,
					destroy: Ext.NS_2E5DF68DD8C9C22E35C3BA83917C1016.Data.Destroy
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