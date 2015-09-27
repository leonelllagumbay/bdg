Ext.define('Form.store.queryoutput.FBC.NS_3B8AC320D422A32320F7F38055D13E42.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_3B8AC320D422A32320F7F38055D13E42.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoSave: true,
	autoLoad: true,
	autoSync: true,
	
	sorters: [{"direction":"ASC","property":"cin21achievements~AWARDTITLE"}],
	filters: [{"dataIndex":"cin21achievements~AWARDTITLE","type":"string"}],
	pageSize: 25,
	
	constructor : function(config) {
		Ext.applyIf(config, {
			proxy  : {
			type: 'direct',
			
			timeout: 300000,
			extraParams: {
				querycode: '3B8AC320-D422-A323-20F7F38055D13E42',
				extraparams: {}
			},
			paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
			api: {
				create:  Ext.NS_3B8AC320D422A32320F7F38055D13E42.Data.Create,
				read:    Ext.NS_3B8AC320D422A32320F7F38055D13E42.Data.Read,
				update:  Ext.NS_3B8AC320D422A32320F7F38055D13E42.Data.Update,
				destroy: Ext.NS_3B8AC320D422A32320F7F38055D13E42.Data.Destroy
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