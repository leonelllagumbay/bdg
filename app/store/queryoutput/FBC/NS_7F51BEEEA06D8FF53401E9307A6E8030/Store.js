Ext.define('Form.store.queryoutput.FBC.NS_7F51BEEEA06D8FF53401E9307A6E8030.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_7F51BEEEA06D8FF53401E9307A6E8030.Model',
	remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: false,
	autoSave: true,
	autoSync: true,
	
	sorters: [{ property: 'eginpmsempkra-ASSESSMENTPERIODFROM', direction: 'ASC'}],
	filters: [{ dataIndex: 'eginpmsempkraitems-COMMENTS', type: 'string'}],
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
					querycode: '7F51BEEE-A06D-8FF5-3401E9307A6E8030',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.NS_7F51BEEEA06D8FF53401E9307A6E8030.Data.Create,
					read:    Ext.NS_7F51BEEEA06D8FF53401E9307A6E8030.Data.Read,
					update:  Ext.NS_7F51BEEEA06D8FF53401E9307A6E8030.Data.Update,
					destroy: Ext.NS_7F51BEEEA06D8FF53401E9307A6E8030.Data.Destroy
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