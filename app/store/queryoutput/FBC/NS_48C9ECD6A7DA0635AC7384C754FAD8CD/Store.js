Ext.define('Form.store.queryoutput.FBC.NS_48C9ECD6A7DA0635AC7384C754FAD8CD.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_48C9ECD6A7DA0635AC7384C754FAD8CD.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	groupField: 'egintestquery-ANUMBER',
	sorters: [{"property":"egintestquery-ADATETIME","direction":"ASC"}],
	filters: [{"dataIndex":"egintestquery-ADATETIME","type":"date"}],
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
					querycode: '48C9ECD6-A7DA-0635-AC7384C754FAD8CD',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_48C9ECD6A7DA0635AC7384C754FAD8CD.Data.Create,
					read:    Ext.NS_48C9ECD6A7DA0635AC7384C754FAD8CD.Data.Read,
					update:  Ext.NS_48C9ECD6A7DA0635AC7384C754FAD8CD.Data.Update,
					destroy: Ext.NS_48C9ECD6A7DA0635AC7384C754FAD8CD.Data.Destroy
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