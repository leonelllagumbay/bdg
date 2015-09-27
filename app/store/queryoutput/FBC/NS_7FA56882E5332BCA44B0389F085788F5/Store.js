Ext.define('Form.store.queryoutput.FBC.NS_7FA56882E5332BCA44B0389F085788F5.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_7FA56882E5332BCA44B0389F085788F5.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"eginpmsempcpitems-CPITEMCODE","direction":"ASC"}],
	filters: [{"dataIndex":"eginpmsempcpitems-CPITEMCODE","type":"int"}],
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
					querycode: '7FA56882-E533-2BCA-44B0389F085788F5',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_7FA56882E5332BCA44B0389F085788F5.Data.Create,
					read:    Ext.NS_7FA56882E5332BCA44B0389F085788F5.Data.Read,
					update:  Ext.NS_7FA56882E5332BCA44B0389F085788F5.Data.Update,
					destroy: Ext.NS_7FA56882E5332BCA44B0389F085788F5.Data.Destroy
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