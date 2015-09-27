Ext.define('Form.view.file.shareGrid', { 
	extend: 'Ext.grid.Panel',
	alias: 'widget.sharegrid',
	width: 400, 
	height: '100%',
	multiSelect: true,
	selModel: Ext.create('Ext.selection.CheckboxModel'),
	autoScroll: true,
	
	initComponent: function() {  
		
		this.features = [{
			ftype: 'filters',
			encode: true,
			local: false, 
			filters: [{
				type: 'string',
				dataIndex: 'FILENAME'
			}]
		}];
 
		this.store = 'file.shareStore';
		this.fbar = Ext.create('Ext.toolbar.Paging', {
				        store: 'file.shareStore', 
				        displayInfo: true,
				        emptyMsg: "No data to display"
				   });
		
		this.tbar = [{
			xtype: 'combobox',
			allowBlank: false,
			fieldLabel: 'User',
			labelWidth: 60,
			forceSelection: true,
			displayField: 'username',
			valueField: 'usercode',
			queryMode: 'remote',
			store: 'file.userStore',
			pageSize: 30,
			minChars: 1,
			width: 270,
			padding: 10,
			name: 'USERNAME' 
		},{
			text: 'Share',
			flex: 1,
			action: 'share'
		},{
			text: 'Remove',
			action: 'undoshare'
		}];
		this.columns = [{
            xtype: 'rownumberer',
            width: 60,
            sortable: false
	    },{
			text: 'FILEID',
			hidden: true,
			dataIndex: 'A_FILEID',
			width: 150
		},{ 
			text: 'Name',  
			dataIndex: 'A_FILENAME',
			filterable: true,
			sortable: true,
			flex: 1
		},{ 
			text: 'Shared to User', 
			dataIndex: 'D_DESCRIPTION', 
			flex: 1,
			filterable: true,
			sortable: true
		},{
			text: 'B_DATESHARED',
			hidden: true,
			dataIndex: 'B_DATESHARED',
			width: 150
		},{
			text: 'B_SHARETOUID',
			hidden: true,
			dataIndex: 'B_SHARETOUID',
			width: 150
		}]; 
		this.callParent(arguments);
	}
});