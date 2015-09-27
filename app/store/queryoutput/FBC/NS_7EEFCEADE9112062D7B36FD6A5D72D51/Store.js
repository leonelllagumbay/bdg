Ext.define('Form.store.queryoutput.FBC.NS_7EEFCEADE9112062D7B36FD6A5D72D51.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_7EEFCEADE9112062D7B36FD6A5D72D51.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{ property: 'gmfpeople-FIRSTNAME', direction: 'ASC'}],
	filters: [{ dataIndex: 'gmfpeople-FIRSTNAME', type: 'string'}],
	pageSize: 30,
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
					querycode: '7EEFCEAD-E911-2062-D7B36FD6A5D72D51',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_7EEFCEADE9112062D7B36FD6A5D72D51.Data.Create,
					read:    Ext.NS_7EEFCEADE9112062D7B36FD6A5D72D51.Data.Read,
					update:  Ext.NS_7EEFCEADE9112062D7B36FD6A5D72D51.Data.Update,
					destroy: Ext.NS_7EEFCEADE9112062D7B36FD6A5D72D51.Data.Destroy
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