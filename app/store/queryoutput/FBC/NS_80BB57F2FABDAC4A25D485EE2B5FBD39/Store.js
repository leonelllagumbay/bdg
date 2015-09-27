Ext.define('Form.store.queryoutput.FBC.NS_80BB57F2FABDAC4A25D485EE2B5FBD39.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_80BB57F2FABDAC4A25D485EE2B5FBD39.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"clkdepartment-DEPARTMENTCODE","direction":"ASC"}],
	filters: [{"dataIndex":"clkdepartment-DEPARTMENTCODE","type":"string"}],
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
					querycode: '80BB57F2-FABD-AC4A-25D485EE2B5FBD39',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_80BB57F2FABDAC4A25D485EE2B5FBD39.Data.Create,
					read:    Ext.NS_80BB57F2FABDAC4A25D485EE2B5FBD39.Data.Read,
					update:  Ext.NS_80BB57F2FABDAC4A25D485EE2B5FBD39.Data.Update,
					destroy: Ext.NS_80BB57F2FABDAC4A25D485EE2B5FBD39.Data.Destroy
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