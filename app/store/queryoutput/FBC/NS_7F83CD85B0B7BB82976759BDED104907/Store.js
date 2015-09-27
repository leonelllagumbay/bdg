Ext.define('Form.store.queryoutput.FBC.NS_7F83CD85B0B7BB82976759BDED104907.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_7F83CD85B0B7BB82976759BDED104907.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	groupField: 'eginpmsbehavioralcomp-DGROUP',
	sorters: [{ property: 'eginpmsbehavioralcomp-BCORDER', direction: 'ASC'}],
	filters: [{ dataIndex: 'eginpmsbehavioralcomp-BEHAVIORALCOMP', type: 'string'}],
	pageSize: 300,
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
					querycode: '7F83CD85-B0B7-BB82-976759BDED104907',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_7F83CD85B0B7BB82976759BDED104907.Data.Create,
					read:    Ext.NS_7F83CD85B0B7BB82976759BDED104907.Data.Read,
					update:  Ext.NS_7F83CD85B0B7BB82976759BDED104907.Data.Update,
					destroy: Ext.NS_7F83CD85B0B7BB82976759BDED104907.Data.Destroy
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