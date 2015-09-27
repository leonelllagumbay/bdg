Ext.define('Form.store.file.folderStore', {
	extend: 'Ext.data.TreeStore',
	model: 'Form.model.file.folderModel',
	defaultRootProperty: 'children',
	defaultRootText: 'root',
	defaultSortDirection: 'ASC',
	folderSort: true,
	remoteFilter: true,
	remoteSort: true,
	sorters: [{
        property: 'FOLDERORDER',
        direction: 'DESC'
	}],
	filters: [{
			type: 'string',
	        dataIndex: 'FOLDERNAME'  
	}],
	
	listeners: {
		beforeload: function(dstore, doperation) {
			if(doperation.id != "root") {
				return false;
			}
		}
	},
	
	constructor : function(config) {
	
	

    Ext.applyIf(config, {
        proxy: {
			type: 'direct',
			timeout: 300000,
			extraParams: {
				dquery: '',
				dorder: '',
				dorderdirection: ''
			},
			paramOrder: ['dquery','dorder','dorderdirection'],
			api: {
		        read:    Ext.file.File.readMyFolder
		    },
			paramsAsHash: false,
			reader: {
				type: 'json',
	            root: 'children'
	        }
		}
    });

    this.callParent([config]);
}
	
	
});