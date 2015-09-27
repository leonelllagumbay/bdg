Ext.define('Form.store.queryoutput.FBC.NS_48BE94A2DD9ECDA5486A247307F50D14.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.FBC.NS_48BE94A2DD9ECDA5486A247307F50D14.Model',
	remoteFilter: true,
								remoteSort: true,
								simpleSortMode: true,
								autoSave: true,
								autoLoad: true,
								autoSync: true,
								
								sorters: [{"property":"egintestquery~AFLOAT","direction":"ASC"}],
								filters: [{"dataIndex":"egintestquery~AFLOAT","type":"float"}],
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
											querycode: '48BE94A2-DD9E-CDA5-486A247307F50D14',
											extraparams: {}
										},
										paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
										api: {
											create:  Ext.NS_48BE94A2DD9ECDA5486A247307F50D14.Data.Create,
											read:    Ext.NS_48BE94A2DD9ECDA5486A247307F50D14.Data.Read,
											update:  Ext.NS_48BE94A2DD9ECDA5486A247307F50D14.Data.Update,
											destroy: Ext.NS_48BE94A2DD9ECDA5486A247307F50D14.Data.Destroy
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