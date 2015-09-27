Ext.define('Form.store.queryoutput.FBC.NS_8042B445DA9830A56B12EF3924EFF604.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_8042B445DA9830A56B12EF3924EFF604.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"clkjobclasscode-JOBCLASSCODE","direction":"ASC"}],
	filters: [{"dataIndex":"clkjobclasscode-JOBCLASSCODE","type":"string"}],
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
					querycode: '8042B445-DA98-30A5-6B12EF3924EFF604',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_8042B445DA9830A56B12EF3924EFF604.Data.Create,
					read:    Ext.NS_8042B445DA9830A56B12EF3924EFF604.Data.Read,
					update:  Ext.NS_8042B445DA9830A56B12EF3924EFF604.Data.Update,
					destroy: Ext.NS_8042B445DA9830A56B12EF3924EFF604.Data.Destroy
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