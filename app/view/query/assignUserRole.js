Ext.define('Form.view.query.assignUserRole', { 
	extend: 'Ext.grid.Panel',
	alias: 'widget.assignuserrole',
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
				dataIndex: 'C_USERGRPID'
			}]
		}];
		
		this.plugins = [{
			ptype : 'cellediting',
			clicksToEdit : 2
		}];
 
		this.store = 'query.assignUserRoleStore';
		this.fbar = Ext.create('Ext.toolbar.Paging', {
				        store: 'query.assignUserRoleStore', 
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
			text: 'Assign',
			flex: 1,
			action: 'assign'
		},{
			text: 'Remove',
			action: 'undoassign'
		}];
		
		this.columns = [{
            xtype: 'rownumberer',
            width: 60,
            sortable: false
	    },{
			text: 'C_EQRYCODE',
			hidden: true,
			dataIndex: 'C_EQRYCODE',
			width: 150
		},{ 
			text: 'C_USERGRPID',  
			dataIndex: 'C_USERGRPID',
			hidden: true,
			filterable: true,
			sortable: true,
			width: 150
		},{ 
			text: 'Role',  
			dataIndex: 'D_DESCRIPTION',
			filterable: true,
			sortable: true,
			width: 150
		},{ 
			text: 'Print',  
			dataIndex: 'C_SHOWPRINT',
			filterable: true,
			sortable: true,
			editor: 'checkboxfield',
			xtype: 'checkcolumn',
			width: 70
		},{ 
			text: 'Edit',  
			dataIndex: 'C_SHOWEDIT',
			filterable: true,
			sortable: true,
			editor: 'checkboxfield',
			xtype: 'checkcolumn',
			width: 70
		},{ 
			text: 'Delete',  
			dataIndex: 'C_SHOWDELETE',
			filterable: true,
			sortable: true,
			editor: 'checkboxfield',
			xtype: 'checkcolumn',
			width: 70
		},{ 
			text: 'Add',  
			dataIndex: 'C_SHOWADD',
			filterable: true,
			sortable: true,
			editor: 'checkboxfield',
			xtype: 'checkcolumn',
			width: 70
		},{ 
			text: 'Copy',  
			dataIndex: 'C_SHOWCOPY',
			filterable: true,
			sortable: true,
			editor: 'checkboxfield',
			xtype: 'checkcolumn',
			width: 70
		},{ 
			text: 'Export',  
			dataIndex: 'C_SHOWEXPORT',
			filterable: true,
			sortable: true,
			editor: 'checkboxfield',
			xtype: 'checkcolumn',
			width: 70
		},{ 
			text: 'Email',  
			dataIndex: 'C_SHOWEMAIL',
			filterable: true,
			sortable: true,
			editor: 'checkboxfield',
			xtype: 'checkcolumn',
			width: 70
		},{ 
			text: 'View',  
			dataIndex: 'C_SHOWVIEW',
			filterable: true,
			sortable: true,
			editor: 'checkboxfield',
			xtype: 'checkcolumn',
			width: 70
		}]; 
		
		this.callParent(arguments);
	}
});