Ext.define('Form.store.queryoutput.FBC.NS_48C5C146D7214EC68A1D29DE42066016.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_48C5C146D7214EC68A1D29DE42066016.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoSave: true,
	autoLoad: true,
	autoSync: true,
	groupField: 'egintestquery-ASTRING',
	sorters: [{ property: 'egintestquery-ADATETIME', direction: 'ASC'}],
	filters: [{ dataIndex: 'egintestquery-ASTRING', type: 'string'}],
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
					querycode: '48C5C146-D721-4EC6-8A1D29DE42066016',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_48C5C146D7214EC68A1D29DE42066016.Data.Create,
					read:    Ext.NS_48C5C146D7214EC68A1D29DE42066016.Data.Read,
					update:  Ext.NS_48C5C146D7214EC68A1D29DE42066016.Data.Update,
					destroy: Ext.NS_48C5C146D7214EC68A1D29DE42066016.Data.Destroy
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