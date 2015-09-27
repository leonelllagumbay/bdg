Ext.define('Form.store.jobbuilder.JobBuilderStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.jobbuilder.JobBuilderModel',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"clkposition-POSITIONCODE","direction":"ASC"}],
	filters: [{"dataIndex":"clkposition-POSITIONCODE","type":"string"}],
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
					querycode: '7EB34A22-FDC3-09F7-646770F411235A84',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					read:    Ext.jobbuilder.Job.Read,
					destroy: Ext.jobbuilder.Job.Destroy
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