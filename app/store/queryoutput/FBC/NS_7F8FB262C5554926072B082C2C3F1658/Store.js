Ext.define('Form.store.queryoutput.FBC.NS_7F8FB262C5554926072B082C2C3F1658.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_7F8FB262C5554926072B082C2C3F1658.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"clkjobgrade-JOBGRADECODE","direction":"ASC"}],
	filters: [{"dataIndex":"clkjobgrade-JOBGRADECODE","type":"string"}],
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
					querycode: '7F8FB262-C555-4926-072B082C2C3F1658',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_7F8FB262C5554926072B082C2C3F1658.Data.Create,
					read:    Ext.NS_7F8FB262C5554926072B082C2C3F1658.Data.Read,
					update:  Ext.NS_7F8FB262C5554926072B082C2C3F1658.Data.Update,
					destroy: Ext.NS_7F8FB262C5554926072B082C2C3F1658.Data.Destroy
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