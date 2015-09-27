Ext.define('Form.store.queryoutput.FBC.NS_2CA402E29A563C0A77A4E384F62AA72B.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_2CA402E29A563C0A77A4E384F62AA72B.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"cin21chareference-NAME","direction":"ASC"}],
	filters: [{"dataIndex":"cin21chareference-NAME","type":"string"}],
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
					querycode: '2CA402E2-9A56-3C0A-77A4E384F62AA72B',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_2CA402E29A563C0A77A4E384F62AA72B.Data.Create,
					read:    Ext.NS_2CA402E29A563C0A77A4E384F62AA72B.Data.Read,
					update:  Ext.NS_2CA402E29A563C0A77A4E384F62AA72B.Data.Update,
					destroy: Ext.NS_2CA402E29A563C0A77A4E384F62AA72B.Data.Destroy
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