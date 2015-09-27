Ext.define('Form.store.queryoutput.FBC.NS_059477B22606B030507BC2C8BCDA1A2F.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_059477B22606B030507BC2C8BCDA1A2F.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoSave: true,
	autoLoad: true,
	autoSync: true,
	groupField: 'cin21personalinfo~BIRTHPLACE',
	sorters: [{ property: 'cin21personalinfo~BIRTHPLACE', direction: 'ASC'}],
	filters: [{ dataIndex: 'cin21personalinfo~BIRTHPLACE', type: 'string'}],
	pageSize: 10,
	
	constructor : function(config) {
		Ext.applyIf(config, {
			proxy  : {
			type: 'direct',
			
			timeout: 300000,
			extraParams: {
				querycode: '059477B2-2606-B030-507BC2C8BCDA1A2F',
				extraparams: {}
			},
			paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
			api: {
				create:  Ext.NS_059477B22606B030507BC2C8BCDA1A2F.Data.Create,
				read:    Ext.NS_059477B22606B030507BC2C8BCDA1A2F.Data.Read,
				update:  Ext.NS_059477B22606B030507BC2C8BCDA1A2F.Data.Update,
				destroy: Ext.NS_059477B22606B030507BC2C8BCDA1A2F.Data.Destroy
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