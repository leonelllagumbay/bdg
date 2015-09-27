Ext.define('Form.store.queryoutput.FBC.NS_7640CD87E6104BF5DE19E74C6011E564.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_7640CD87E6104BF5DE19E74C6011E564.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"cbr201-CASUALMONTHS","direction":"ASC"}],
	filters: [{"dataIndex":"cbr201-CASUALMONTHS","type":"string"}],
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
					querycode: '7640CD87-E610-4BF5-DE19E74C6011E564',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_7640CD87E6104BF5DE19E74C6011E564.Data.Create,
					read:    Ext.NS_7640CD87E6104BF5DE19E74C6011E564.Data.Read,
					update:  Ext.NS_7640CD87E6104BF5DE19E74C6011E564.Data.Update,
					destroy: Ext.NS_7640CD87E6104BF5DE19E74C6011E564.Data.Destroy
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