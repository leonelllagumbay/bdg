Ext.define('Form.store.queryoutput.FBC.NS_48D56D78AE56BBC908AD2487183EBE46.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_48D56D78AE56BBC908AD2487183EBE46.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"egintestquery-TESTID","direction":"ASC"}],
	filters: [{"dataIndex":"egintestquery-TESTID","type":"int"}],
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
					querycode: '48D56D78-AE56-BBC9-08AD2487183EBE46',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_48D56D78AE56BBC908AD2487183EBE46.Data.Create,
					read:    Ext.NS_48D56D78AE56BBC908AD2487183EBE46.Data.Read,
					update:  Ext.NS_48D56D78AE56BBC908AD2487183EBE46.Data.Update,
					destroy: Ext.NS_48D56D78AE56BBC908AD2487183EBE46.Data.Destroy
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