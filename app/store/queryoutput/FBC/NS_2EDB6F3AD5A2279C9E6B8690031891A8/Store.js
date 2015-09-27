Ext.define('Form.store.queryoutput.FBC.NS_2EDB6F3AD5A2279C9E6B8690031891A8.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_2EDB6F3AD5A2279C9E6B8690031891A8.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"cin21training-TOPIC","direction":"ASC"}],
	filters: [{"dataIndex":"cin21training-TOPIC","type":"string"}],
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
					querycode: '2EDB6F3A-D5A2-279C-9E6B8690031891A8',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_2EDB6F3AD5A2279C9E6B8690031891A8.Data.Create,
					read:    Ext.NS_2EDB6F3AD5A2279C9E6B8690031891A8.Data.Read,
					update:  Ext.NS_2EDB6F3AD5A2279C9E6B8690031891A8.Data.Update,
					destroy: Ext.NS_2EDB6F3AD5A2279C9E6B8690031891A8.Data.Destroy
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