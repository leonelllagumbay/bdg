Ext.define('Form.store.queryoutput.FBC.NS_7F2DFA1BB35774DAAC0B7E6E560AD435.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_7F2DFA1BB35774DAAC0B7E6E560AD435.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{ property: 'eginpmsempkra-KRACODE', direction: 'ASC'}],
	filters: [{ dataIndex: 'eginpmsempkra-PURPOSEOFPA', type: 'string'}],
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
					querycode: '7F2DFA1B-B357-74DA-AC0B7E6E560AD435',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_7F2DFA1BB35774DAAC0B7E6E560AD435.Data.Create,
					read:    Ext.NS_7F2DFA1BB35774DAAC0B7E6E560AD435.Data.Read,
					update:  Ext.NS_7F2DFA1BB35774DAAC0B7E6E560AD435.Data.Update,
					destroy: Ext.NS_7F2DFA1BB35774DAAC0B7E6E560AD435.Data.Destroy
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