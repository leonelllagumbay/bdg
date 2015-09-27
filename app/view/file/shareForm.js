Ext.define('Form.view.file.shareForm', { 
	extend: 'Ext.grid.Panel',
	alias: 'widget.shareform',
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
 
		this.store = 'file.shareUserRoleStore';
		this.fbar = Ext.create('Ext.toolbar.Paging', {
				        store: 'file.shareUserRoleStore', 
				        displayInfo: true,
				        emptyMsg: "No data to display"
				   });
		
		this.tbar = [{
			xtype: 'combobox',
			allowBlank: false,
			fieldLabel: 'User Role',
			labelWidth: 60,
			displayField: 'rolename',
			valueField: 'rolecode',
			queryMode: 'remote',
			store: 'form.rolestore',
			pageSize: 30,
			minChars: 1,
			width: 270,
			padding: 10,
			name: 'USERROLE' 
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
            width: 50,
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
			text: 'Shared to Group', 
			dataIndex: 'D_DESCRIPTION', 
			flex: 1,
			filterable: true,
			sortable: true
		},{ 
			text: 'C_USERGRPID', 
			dataIndex: 'C_USERGRPID', 
			hidden: true,
			filterable: true,
			sortable: true
		},{
			text: 'C_DATESHARED',
			hidden: true,
			dataIndex: 'C_DATESHARED',
			width: 150
		},{
			text: 'C_USERGRPID',
			hidden: true,
			dataIndex: 'C_USERGRPID',
			width: 150
		}]; 
		this.callParent(arguments);
	}
});