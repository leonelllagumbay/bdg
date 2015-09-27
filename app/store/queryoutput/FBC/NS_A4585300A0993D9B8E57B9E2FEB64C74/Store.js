Ext.define('Form.store.queryoutput.FBC.NS_A4585300A0993D9B8E57B9E2FEB64C74.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_A4585300A0993D9B8E57B9E2FEB64C74.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoSave: true,
	autoLoad: true,
	autoSync: true,
	
	sorters: [{ property: 'cin21education-DATEFINISHED', direction: 'ASC'}],
	filters: [{ dataIndex: 'cin21education-DATEBEGIN', type: 'string'}],
	pageSize: 1000,
	
	constructor : function(config) {
		Ext.applyIf(config, {
			proxy  : {
			type: 'direct',
			
			timeout: 300000,
			extraParams: {
				querycode: 'A4585300-A099-3D9B-8E57B9E2FEB64C74',
				extraparams: {}
			},
			paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
			api: {
				create:  Ext.NS_A4585300A0993D9B8E57B9E2FEB64C74.Data.Create,
				read:    Ext.NS_A4585300A0993D9B8E57B9E2FEB64C74.Data.Read,
				update:  Ext.NS_A4585300A0993D9B8E57B9E2FEB64C74.Data.Update,
				destroy: Ext.NS_A4585300A0993D9B8E57B9E2FEB64C74.Data.Destroy
			},
			paramsAsHash: false,
			filterParam: 'filter',
			sortParam: 'sort',
			limitParam: 'limit',
			idParam: 'ID',
			pageParam: 'page',
			reader: {
				root: 'topics',
				totalProperty: 'totalCount'
			}
		}
	});
	this.callParent([config]);
	}
});