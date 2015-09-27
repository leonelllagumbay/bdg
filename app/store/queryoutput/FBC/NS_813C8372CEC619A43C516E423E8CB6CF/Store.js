Ext.define('Form.store.queryoutput.FBC.NS_813C8372CEC619A43C516E423E8CB6CF.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_813C8372CEC619A43C516E423E8CB6CF.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{"property":"clkskill-SKILLCODE","direction":"ASC"}],
	filters: [{"dataIndex":"clkskill-SKILLCODE","type":"string"}],
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
					querycode: '813C8372-CEC6-19A4-3C516E423E8CB6CF',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_813C8372CEC619A43C516E423E8CB6CF.Data.Create,
					read:    Ext.NS_813C8372CEC619A43C516E423E8CB6CF.Data.Read,
					update:  Ext.NS_813C8372CEC619A43C516E423E8CB6CF.Data.Update,
					destroy: Ext.NS_813C8372CEC619A43C516E423E8CB6CF.Data.Destroy
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