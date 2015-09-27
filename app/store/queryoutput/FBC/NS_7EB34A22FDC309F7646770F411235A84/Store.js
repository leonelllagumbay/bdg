Ext.define('Form.store.queryoutput.FBC.NS_7EB34A22FDC309F7646770F411235A84.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_7EB34A22FDC309F7646770F411235A84.Model',
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
					create:  Ext.NS_7EB34A22FDC309F7646770F411235A84.Data.Create,
					read:    Ext.NS_7EB34A22FDC309F7646770F411235A84.Data.Read,
					update:  Ext.NS_7EB34A22FDC309F7646770F411235A84.Data.Update,
					destroy: Ext.NS_7EB34A22FDC309F7646770F411235A84.Data.Destroy
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