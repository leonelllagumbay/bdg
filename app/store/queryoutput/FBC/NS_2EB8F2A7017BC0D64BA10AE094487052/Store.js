Ext.define('Form.store.queryoutput.FBC.NS_2EB8F2A7017BC0D64BA10AE094487052.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_2EB8F2A7017BC0D64BA10AE094487052.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"cin21familybkgrnd-NAME","direction":"ASC"}],
	filters: [{"dataIndex":"cin21familybkgrnd-NAME","type":"string"}],
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
					querycode: '2EB8F2A7-017B-C0D6-4BA10AE094487052',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_2EB8F2A7017BC0D64BA10AE094487052.Data.Create,
					read:    Ext.NS_2EB8F2A7017BC0D64BA10AE094487052.Data.Read,
					update:  Ext.NS_2EB8F2A7017BC0D64BA10AE094487052.Data.Update,
					destroy: Ext.NS_2EB8F2A7017BC0D64BA10AE094487052.Data.Destroy
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