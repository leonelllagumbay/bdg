Ext.define('Form.store.jobbuilder.OrgDevStore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.jobbuilder.OrgDevModel',
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
					create:  Ext.jobbuilder.OrgDev.Create,
					read:    Ext.jobbuilder.OrgDev.Read,
					update:  Ext.jobbuilder.OrgDev.Update,
					destroy: Ext.jobbuilder.OrgDev.Destroy
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