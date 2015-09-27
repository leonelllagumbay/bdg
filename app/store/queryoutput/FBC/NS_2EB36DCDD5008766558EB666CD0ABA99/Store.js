Ext.define('Form.store.queryoutput.FBC.NS_2EB36DCDD5008766558EB666CD0ABA99.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_2EB36DCDD5008766558EB666CD0ABA99.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"cin21exampass-TYPEOFEXAM","direction":"ASC"}],
	filters: [{"dataIndex":"cin21exampass-TYPEOFEXAM","type":"string"}],
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
					querycode: '2EB36DCD-D500-8766-558EB666CD0ABA99',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_2EB36DCDD5008766558EB666CD0ABA99.Data.Create,
					read:    Ext.NS_2EB36DCDD5008766558EB666CD0ABA99.Data.Read,
					update:  Ext.NS_2EB36DCDD5008766558EB666CD0ABA99.Data.Update,
					destroy: Ext.NS_2EB36DCDD5008766558EB666CD0ABA99.Data.Destroy
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