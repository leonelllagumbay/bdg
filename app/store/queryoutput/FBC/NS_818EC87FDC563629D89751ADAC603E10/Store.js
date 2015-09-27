Ext.define('Form.store.queryoutput.FBC.NS_818EC87FDC563629D89751ADAC603E10.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_818EC87FDC563629D89751ADAC603E10.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"glkschool-SCHOOLCODE","direction":"ASC"}],
	filters: [{"dataIndex":"glkschool-SCHOOLCODE","type":"string"}],
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
					querycode: '818EC87F-DC56-3629-D89751ADAC603E10',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_818EC87FDC563629D89751ADAC603E10.Data.Create,
					read:    Ext.NS_818EC87FDC563629D89751ADAC603E10.Data.Read,
					update:  Ext.NS_818EC87FDC563629D89751ADAC603E10.Data.Update,
					destroy: Ext.NS_818EC87FDC563629D89751ADAC603E10.Data.Destroy
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