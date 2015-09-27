Ext.define('Form.store.queryoutput.FBC.NS_81BD6282D2719B46D04E84B10725A3DF.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_81BD6282D2719B46D04E84B10725A3DF.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"glkdegree-DEGREECODE","direction":"ASC"}],
	filters: [{"dataIndex":"glkdegree-DEGREECODE","type":"string"}],
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
					querycode: '81BD6282-D271-9B46-D04E84B10725A3DF',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_81BD6282D2719B46D04E84B10725A3DF.Data.Create,
					read:    Ext.NS_81BD6282D2719B46D04E84B10725A3DF.Data.Read,
					update:  Ext.NS_81BD6282D2719B46D04E84B10725A3DF.Data.Update,
					destroy: Ext.NS_81BD6282D2719B46D04E84B10725A3DF.Data.Destroy
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