Ext.define('Form.store.queryoutput.FBC.NS_81A4916208042E18C7C9BA871218F408.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_81A4916208042E18C7C9BA871218F408.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"glkeduclevel-EDUCLEVEL","direction":"ASC"}],
	filters: [{"dataIndex":"glkeduclevel-EDUCLEVEL","type":"string"}],
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
					querycode: '81A49162-0804-2E18-C7C9BA871218F408',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_81A4916208042E18C7C9BA871218F408.Data.Create,
					read:    Ext.NS_81A4916208042E18C7C9BA871218F408.Data.Read,
					update:  Ext.NS_81A4916208042E18C7C9BA871218F408.Data.Update,
					destroy: Ext.NS_81A4916208042E18C7C9BA871218F408.Data.Destroy
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