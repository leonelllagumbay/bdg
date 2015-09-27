Ext.define('Form.store.queryoutput.FBC.NS_80933CE1F1D1B408BB3C9333EF00349C.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_80933CE1F1D1B408BB3C9333EF00349C.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"clklabortype-LABORTYPECODE","direction":"ASC"}],
	filters: [{"dataIndex":"clklabortype-LABORTYPECODE","type":"string"}],
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
					querycode: '80933CE1-F1D1-B408-BB3C9333EF00349C',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_80933CE1F1D1B408BB3C9333EF00349C.Data.Create,
					read:    Ext.NS_80933CE1F1D1B408BB3C9333EF00349C.Data.Read,
					update:  Ext.NS_80933CE1F1D1B408BB3C9333EF00349C.Data.Update,
					destroy: Ext.NS_80933CE1F1D1B408BB3C9333EF00349C.Data.Destroy
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