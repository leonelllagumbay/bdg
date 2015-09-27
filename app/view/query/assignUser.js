Ext.define('Form.view.query.assignUser', { 
	extend: 'Ext.grid.Panel',
	alias: 'widget.assignuser',
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
				dataIndex: 'A_USERID'
			}]
		}];
		
		this.plugins = [{
			ptype : 'cellediting',
			clicksToEdit : 2
		}];
 
		this.store = 'query.assignUserStore';
		this.fbar = Ext.create('Ext.toolbar.Paging', {
				        store: 'query.assignUserStore', 
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
			text: 'EQRYCODE',
			hidden: true,
			dataIndex: 'A_EQRYCODE',
			width: 150
		},{ 
			text: 'USERID',  
			dataIndex: 'A_USERID',
			filterable: true,
			sortable: true,
			hidden: true,
			width: 150
		},{ 
			text: 'First Name',  
			dataIndex: 'B_FIRSTNAME',
			filterable: true,
			sortable: true,
			width: 150
		},{ 
			text: 'Last Name',  
			dataIndex: 'B_LASTNAME',
			filterable: true,
			sortable: true,
			width: 150
		},{ 
			text: 'Print',  
			dataIndex: 'A_SHOWPRINT',
			filterable: true,
			sortable: true,
			editor: 'checkboxfield',
			xtype: 'checkcolumn',
			width: 70
		},{ 
			text: 'Edit',  
			dataIndex: 'A_SHOWEDIT',
			filterable: true,
			sortable: true,
			editor: 'checkboxfield',
			xtype: 'checkcolumn',
			width: 70
		},{ 
			text: 'Delete',  
			dataIndex: 'A_SHOWDELETE',
			filterable: true,
			sortable: true,
			editor: 'checkboxfield',
			xtype: 'checkcolumn',
			width: 70
		},{ 
			text: 'Add',  
			dataIndex: 'A_SHOWADD',
			filterable: true,
			sortable: true,
			editor: 'checkboxfield',
			xtype: 'checkcolumn',
			width: 70
		},{ 
			text: 'Copy',  
			dataIndex: 'A_SHOWCOPY',
			filterable: true,
			sortable: true,
			editor: 'checkboxfield',
			xtype: 'checkcolumn',
			width: 70
		},{ 
			text: 'Export',  
			dataIndex: 'A_SHOWEXPORT',
			filterable: true,
			sortable: true,
			editor: 'checkboxfield',
			xtype: 'checkcolumn',
			width: 70
		},{ 
			text: 'Email',  
			dataIndex: 'A_SHOWEMAIL',
			filterable: true,
			sortable: true,
			editor: 'checkboxfield',
			xtype: 'checkcolumn',
			width: 70
		},{ 
			text: 'View',  
			dataIndex: 'A_SHOWVIEW',
			filterable: true,
			sortable: true,
			editor: 'checkboxfield',
			xtype: 'checkcolumn',
			width: 70
		}]; 
		
		this.callParent(arguments);
	}
});