Ext.define('Form.store.queryoutput.FBC.NS_7F90DFD609223C063FAAD035CB569681.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_7F90DFD609223C063FAAD035CB569681.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"eginpmsempcp-CPCODE","direction":"ASC"}],
	filters: [{"dataIndex":"eginpmsempcp-CPCODE","type":"string"}],
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
					querycode: '7F90DFD6-0922-3C06-3FAAD035CB569681',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_7F90DFD609223C063FAAD035CB569681.Data.Create,
					read:    Ext.NS_7F90DFD609223C063FAAD035CB569681.Data.Read,
					update:  Ext.NS_7F90DFD609223C063FAAD035CB569681.Data.Update,
					destroy: Ext.NS_7F90DFD609223C063FAAD035CB569681.Data.Destroy
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