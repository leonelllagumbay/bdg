Ext.define('Form.store.queryoutput.FBC.NS_48B2EBE0C7002A9E1FF596E5398F02A8.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_48B2EBE0C7002A9E1FF596E5398F02A8.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{ property: 'ecrgboard-DATELASTUPDATE', direction: 'ASC'}],
	filters: [{ dataIndex: 'ecrgboard-DESCRIPTION', type: 'string'}],
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
					querycode: '48B2EBE0-C700-2A9E-1FF596E5398F02A8',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_48B2EBE0C7002A9E1FF596E5398F02A8.Data.Create,
					read:    Ext.NS_48B2EBE0C7002A9E1FF596E5398F02A8.Data.Read,
					update:  Ext.NS_48B2EBE0C7002A9E1FF596E5398F02A8.Data.Update,
					destroy: Ext.NS_48B2EBE0C7002A9E1FF596E5398F02A8.Data.Destroy
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