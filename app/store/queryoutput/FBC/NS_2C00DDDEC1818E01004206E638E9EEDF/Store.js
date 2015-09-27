Ext.define('Form.store.queryoutput.FBC.NS_2C00DDDEC1818E01004206E638E9EEDF.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_2C00DDDEC1818E01004206E638E9EEDF.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"cin21achievements-AWARDTITLE","direction":"ASC"}],
	filters: [{"dataIndex":"cin21achievements-AWARDTITLE","type":"string"}],
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
					querycode: '2C00DDDE-C181-8E01-004206E638E9EEDF',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_2C00DDDEC1818E01004206E638E9EEDF.Data.Create,
					read:    Ext.NS_2C00DDDEC1818E01004206E638E9EEDF.Data.Read,
					update:  Ext.NS_2C00DDDEC1818E01004206E638E9EEDF.Data.Update,
					destroy: Ext.NS_2C00DDDEC1818E01004206E638E9EEDF.Data.Destroy
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