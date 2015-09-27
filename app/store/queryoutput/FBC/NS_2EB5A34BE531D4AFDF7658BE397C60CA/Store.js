Ext.define('Form.store.queryoutput.FBC.NS_2EB5A34BE531D4AFDF7658BE397C60CA.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_2EB5A34BE531D4AFDF7658BE397C60CA.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"cin21evaluations-INTELLRATING","direction":"ASC"}],
	filters: [{"dataIndex":"cin21evaluations-INTELLRATING","type":"float"}],
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
					querycode: '2EB5A34B-E531-D4AF-DF7658BE397C60CA',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_2EB5A34BE531D4AFDF7658BE397C60CA.Data.Create,
					read:    Ext.NS_2EB5A34BE531D4AFDF7658BE397C60CA.Data.Read,
					update:  Ext.NS_2EB5A34BE531D4AFDF7658BE397C60CA.Data.Update,
					destroy: Ext.NS_2EB5A34BE531D4AFDF7658BE397C60CA.Data.Destroy
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