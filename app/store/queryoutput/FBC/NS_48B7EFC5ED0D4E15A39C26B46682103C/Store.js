Ext.define('Form.store.queryoutput.FBC.NS_48B7EFC5ED0D4E15A39C26B46682103C.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_48B7EFC5ED0D4E15A39C26B46682103C.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
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
					querycode: '48B7EFC5-ED0D-4E15-A39C26B46682103C',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_48B7EFC5ED0D4E15A39C26B46682103C.Data.Create,
					read:    Ext.NS_48B7EFC5ED0D4E15A39C26B46682103C.Data.Read,
					update:  Ext.NS_48B7EFC5ED0D4E15A39C26B46682103C.Data.Update,
					destroy: Ext.NS_48B7EFC5ED0D4E15A39C26B46682103C.Data.Destroy
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