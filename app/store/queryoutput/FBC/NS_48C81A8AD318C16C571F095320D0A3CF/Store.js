Ext.define('Form.store.queryoutput.FBC.NS_48C81A8AD318C16C571F095320D0A3CF.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_48C81A8AD318C16C571F095320D0A3CF.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoSave: true,
	autoLoad: true,
	autoSync: true,
	
	sorters: [{"property":"egintestquery-ADATETIME","direction":"ASC"}],
	filters: [{"dataIndex":"egintestquery-ADATETIME","type":"date"}],
	pageSize: 7,
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
					querycode: '48C81A8A-D318-C16C-571F095320D0A3CF',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_48C81A8AD318C16C571F095320D0A3CF.Data.Create,
					read:    Ext.NS_48C81A8AD318C16C571F095320D0A3CF.Data.Read,
					update:  Ext.NS_48C81A8AD318C16C571F095320D0A3CF.Data.Update,
					destroy: Ext.NS_48C81A8AD318C16C571F095320D0A3CF.Data.Destroy
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