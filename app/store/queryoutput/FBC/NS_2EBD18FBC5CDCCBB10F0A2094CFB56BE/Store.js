Ext.define('Form.store.queryoutput.FBC.NS_2EBD18FBC5CDCCBB10F0A2094CFB56BE.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_2EBD18FBC5CDCCBB10F0A2094CFB56BE.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"cin21medhistory-ALLERGIES","direction":"ASC"}],
	filters: [{"dataIndex":"cin21medhistory-ALLERGIES","type":"string"}],
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
					querycode: '2EBD18FB-C5CD-CCBB-10F0A2094CFB56BE',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_2EBD18FBC5CDCCBB10F0A2094CFB56BE.Data.Create,
					read:    Ext.NS_2EBD18FBC5CDCCBB10F0A2094CFB56BE.Data.Read,
					update:  Ext.NS_2EBD18FBC5CDCCBB10F0A2094CFB56BE.Data.Update,
					destroy: Ext.NS_2EBD18FBC5CDCCBB10F0A2094CFB56BE.Data.Destroy
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