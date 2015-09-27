Ext.define('Form.store.queryoutput.FBC.NS_816C04EBC2049A9341D34F40AC344F53.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_816C04EBC2049A9341D34F40AC344F53.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"glkcourse-COURSECODE","direction":"ASC"}],
	filters: [{"dataIndex":"glkcourse-COURSECODE","type":"string"}],
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
					querycode: '816C04EB-C204-9A93-41D34F40AC344F53',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_816C04EBC2049A9341D34F40AC344F53.Data.Create,
					read:    Ext.NS_816C04EBC2049A9341D34F40AC344F53.Data.Read,
					update:  Ext.NS_816C04EBC2049A9341D34F40AC344F53.Data.Update,
					destroy: Ext.NS_816C04EBC2049A9341D34F40AC344F53.Data.Destroy
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