Ext.define('Form.store.queryoutput.FBC.NS_2EDD7067BEAD092F217F5D4E0CE400B4.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_2EDD7067BEAD092F217F5D4E0CE400B4.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"cin21workhistory-ENTITYCODE","direction":"ASC"}],
	filters: [{"dataIndex":"cin21workhistory-ENTITYCODE","type":"string"}],
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
					querycode: '2EDD7067-BEAD-092F-217F5D4E0CE400B4',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_2EDD7067BEAD092F217F5D4E0CE400B4.Data.Create,
					read:    Ext.NS_2EDD7067BEAD092F217F5D4E0CE400B4.Data.Read,
					update:  Ext.NS_2EDD7067BEAD092F217F5D4E0CE400B4.Data.Update,
					destroy: Ext.NS_2EDD7067BEAD092F217F5D4E0CE400B4.Data.Destroy
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