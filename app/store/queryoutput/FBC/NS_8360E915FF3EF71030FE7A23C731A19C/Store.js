Ext.define('Form.store.queryoutput.FBC.NS_8360E915FF3EF71030FE7A23C731A19C.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_8360E915FF3EF71030FE7A23C731A19C.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"clkposition-POSITIONCODE","direction":"ASC"}],
	filters: [{"dataIndex":"clkposition-POSITIONCODE","type":"string"}],
	pageSize: 200000,
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
					querycode: '8360E915-FF3E-F710-30FE7A23C731A19C',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_8360E915FF3EF71030FE7A23C731A19C.Data.Create,
					read:    Ext.NS_8360E915FF3EF71030FE7A23C731A19C.Data.Read,
					update:  Ext.NS_8360E915FF3EF71030FE7A23C731A19C.Data.Update,
					destroy: Ext.NS_8360E915FF3EF71030FE7A23C731A19C.Data.Destroy
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