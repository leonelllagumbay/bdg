Ext.define('Form.view.administrator.assignMenuUserRole', { 
	extend: 'Ext.grid.Panel',
	alias: 'widget.assignmenuuserrole',
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
 
		this.store = 'administrator.assignMenuUserRoleStore';
		this.fbar = Ext.create('Ext.toolbar.Paging', {
				        store: 'administrator.assignMenuUserRoleStore', 
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
			text: 'C_MENUID',
			hidden: true,
			dataIndex: 'C_MENUID',
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
			flex: 1
		}]; 
		
		this.callParent(arguments);
	}
});