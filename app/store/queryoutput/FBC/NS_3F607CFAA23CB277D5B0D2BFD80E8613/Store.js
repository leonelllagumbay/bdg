Ext.define('Form.store.queryoutput.FBC.NS_3F607CFAA23CB277D5B0D2BFD80E8613.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_3F607CFAA23CB277D5B0D2BFD80E8613.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{ property: 'eginpms-RECDATECREATED', direction: 'ASC'}],
	filters: [{ dataIndex: 'eginpms-PMSNAME', type: 'string'}],
	pageSize: 10,
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
					querycode: '3F607CFA-A23C-B277-D5B0D2BFD80E8613',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_3F607CFAA23CB277D5B0D2BFD80E8613.Data.Create,
					read:    Ext.NS_3F607CFAA23CB277D5B0D2BFD80E8613.Data.Read,
					update:  Ext.NS_3F607CFAA23CB277D5B0D2BFD80E8613.Data.Update,
					destroy: Ext.NS_3F607CFAA23CB277D5B0D2BFD80E8613.Data.Destroy
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