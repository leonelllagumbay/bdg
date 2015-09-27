Ext.define('Form.store.queryoutput.FBC.NS_7FE54E13F11CD85369BA5D1AA3D80A43.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_7FE54E13F11CD85369BA5D1AA3D80A43.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"eginpmscomment-COMMENTCODE","direction":"ASC"}],
	filters: [{"dataIndex":"eginpmscomment-COMMENTCODE","type":"int"}],
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
					querycode: '7FE54E13-F11C-D853-69BA5D1AA3D80A43',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_7FE54E13F11CD85369BA5D1AA3D80A43.Data.Create,
					read:    Ext.NS_7FE54E13F11CD85369BA5D1AA3D80A43.Data.Read,
					update:  Ext.NS_7FE54E13F11CD85369BA5D1AA3D80A43.Data.Update,
					destroy: Ext.NS_7FE54E13F11CD85369BA5D1AA3D80A43.Data.Destroy
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