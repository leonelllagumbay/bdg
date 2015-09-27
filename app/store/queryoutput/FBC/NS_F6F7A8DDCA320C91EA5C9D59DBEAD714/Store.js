Ext.define('Form.store.queryoutput.FBC.NS_F6F7A8DDCA320C91EA5C9D59DBEAD714.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_F6F7A8DDCA320C91EA5C9D59DBEAD714.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: true,
	autoSave: true,
	autoSync: true,
	
	sorters: [{ property: 'eginpmsbehavioralcomp-BCORDER', direction: 'ASC'}],
	filters: [{ dataIndex: 'eginpmsbehavioralcomp-BEHAVIORALCOMP', type: 'string'}],
	pageSize: 30,
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
					querycode: 'F6F7A8DD-CA32-0C91-EA5C9D59DBEAD714',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_F6F7A8DDCA320C91EA5C9D59DBEAD714.Data.Create,
					read:    Ext.NS_F6F7A8DDCA320C91EA5C9D59DBEAD714.Data.Read,
					update:  Ext.NS_F6F7A8DDCA320C91EA5C9D59DBEAD714.Data.Update,
					destroy: Ext.NS_F6F7A8DDCA320C91EA5C9D59DBEAD714.Data.Destroy
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