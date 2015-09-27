Ext.define('Form.view.administrator.assignMenuUser', { 
	extend: 'Ext.grid.Panel',
	alias: 'widget.assignmenuuser',
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
 
		this.store = 'administrator.assignMenuUserStore';
		this.fbar = Ext.create('Ext.toolbar.Paging', {
				        store: 'administrator.assignMenuUserStore', 
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
			text: 'MENUID',
			hidden: true,
			dataIndex: 'A_APPID',
			width: 150
		},{ 
			text: 'USERID',  
			dataIndex: 'A_MENUID',
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
		}]; 
		
		this.callParent(arguments);
	}
});