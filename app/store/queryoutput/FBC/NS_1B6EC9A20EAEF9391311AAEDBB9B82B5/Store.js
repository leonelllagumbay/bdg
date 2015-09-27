Ext.define('Form.store.queryoutput.FBC.NS_1B6EC9A20EAEF9391311AAEDBB9B82B5.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_1B6EC9A20EAEF9391311AAEDBB9B82B5.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"cmfpa-PERSONNELIDNO","direction":"ASC"}],
	filters: [{"dataIndex":"cmfpa-PERSONNELIDNO","type":"string"}],
	pageSize: 1,
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
					querycode: '1B6EC9A2-0EAE-F939-1311AAEDBB9B82B5',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_1B6EC9A20EAEF9391311AAEDBB9B82B5.Data.Create,
					read:    Ext.NS_1B6EC9A20EAEF9391311AAEDBB9B82B5.Data.Read,
					update:  Ext.NS_1B6EC9A20EAEF9391311AAEDBB9B82B5.Data.Update,
					destroy: Ext.NS_1B6EC9A20EAEF9391311AAEDBB9B82B5.Data.Destroy
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