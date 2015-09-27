Ext.define('Form.store.queryoutput.FBC.NS_2ED4C4E3EDF50F1325EB61EAD366F0BC.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_2ED4C4E3EDF50F1325EB61EAD366F0BC.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"cin21relative-NAME","direction":"ASC"}],
	filters: [{"dataIndex":"cin21relative-NAME","type":"string"}],
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
					querycode: '2ED4C4E3-EDF5-0F13-25EB61EAD366F0BC',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_2ED4C4E3EDF50F1325EB61EAD366F0BC.Data.Create,
					read:    Ext.NS_2ED4C4E3EDF50F1325EB61EAD366F0BC.Data.Read,
					update:  Ext.NS_2ED4C4E3EDF50F1325EB61EAD366F0BC.Data.Update,
					destroy: Ext.NS_2ED4C4E3EDF50F1325EB61EAD366F0BC.Data.Destroy
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