Ext.define('Form.store.queryoutput.FBC.NS_48D7785FC91A7309FDA64C3B4255E270.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_48D7785FC91A7309FDA64C3B4255E270.Model',
	remoteFilter: true,
								remoteSort: true,
								simpleSortMode: true,
								autoSave: true,
								autoLoad: true,
								autoSync: true,
								
								sorters: [{"property":"egintestquery~TESTID","direction":"ASC"}],
								filters: [{"dataIndex":"egintestquery~TESTID","type":"int"}],
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
											querycode: '48D7785F-C91A-7309-FDA64C3B4255E270',
											extraparams: {}
										},
										paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
										api: {
											create:  Ext.NS_48D7785FC91A7309FDA64C3B4255E270.Data.Create,
											read:    Ext.NS_48D7785FC91A7309FDA64C3B4255E270.Data.Read,
											update:  Ext.NS_48D7785FC91A7309FDA64C3B4255E270.Data.Update,
											destroy: Ext.NS_48D7785FC91A7309FDA64C3B4255E270.Data.Destroy
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