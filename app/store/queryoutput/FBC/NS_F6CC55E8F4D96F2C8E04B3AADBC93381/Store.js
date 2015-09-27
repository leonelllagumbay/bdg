Ext.define('Form.store.queryoutput.FBC.NS_F6CC55E8F4D96F2C8E04B3AADBC93381.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_F6CC55E8F4D96F2C8E04B3AADBC93381.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"eglkpmskeyresultarea-KEYRESULTAREACODE","direction":"ASC"}],
	filters: [{"dataIndex":"eglkpmskeyresultarea-KEYRESULTAREACODE","type":"string"}],
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
					querycode: 'F6CC55E8-F4D9-6F2C-8E04B3AADBC93381',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_F6CC55E8F4D96F2C8E04B3AADBC93381.Data.Create,
					read:    Ext.NS_F6CC55E8F4D96F2C8E04B3AADBC93381.Data.Read,
					update:  Ext.NS_F6CC55E8F4D96F2C8E04B3AADBC93381.Data.Update,
					destroy: Ext.NS_F6CC55E8F4D96F2C8E04B3AADBC93381.Data.Destroy
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