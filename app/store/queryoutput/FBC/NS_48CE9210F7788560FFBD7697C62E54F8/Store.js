Ext.define('Form.store.queryoutput.FBC.NS_48CE9210F7788560FFBD7697C62E54F8.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_48CE9210F7788560FFBD7697C62E54F8.Model',
	remoteFilter: true,
								remoteSort: true,
								simpleSortMode: true,
								autoSave: true,
								autoLoad: true,
								autoSync: true,
								
								sorters: [{ property: 'egintestquery~AFLOAT', direction: 'ASC'}],
								filters: [{"dataIndex":"egintestquery~ADATETIME","type":"date"}],
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
											querycode: '48CE9210-F778-8560-FFBD7697C62E54F8',
											extraparams: {}
										},
										paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
										api: {
											create:  Ext.NS_48CE9210F7788560FFBD7697C62E54F8.Data.Create,
											read:    Ext.NS_48CE9210F7788560FFBD7697C62E54F8.Data.Read,
											update:  Ext.NS_48CE9210F7788560FFBD7697C62E54F8.Data.Update,
											destroy: Ext.NS_48CE9210F7788560FFBD7697C62E54F8.Data.Destroy
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