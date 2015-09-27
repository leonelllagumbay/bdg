Ext.define('Form.store.queryoutput.FBC.NS_48CC09B3FAFB581153784CDEFB17F719.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_48CC09B3FAFB581153784CDEFB17F719.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	groupField: 'egintestquery~ASTRING',
	sorters: [{"property":"egintestquery-ADATETIME","direction":"ASC"}],
	filters: [{"dataIndex":"egintestquery-ADATETIME","type":"date"}],
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
					querycode: '48CC09B3-FAFB-5811-53784CDEFB17F719',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_48CC09B3FAFB581153784CDEFB17F719.Data.Create,
					read:    Ext.NS_48CC09B3FAFB581153784CDEFB17F719.Data.Read,
					update:  Ext.NS_48CC09B3FAFB581153784CDEFB17F719.Data.Update,
					destroy: Ext.NS_48CC09B3FAFB581153784CDEFB17F719.Data.Destroy
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