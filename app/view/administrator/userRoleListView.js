Ext.define('Form.view.administrator.userRoleListView', { 
	extend: 'Ext.grid.Panel',
	alias: 'widget.userrolelistview',
	title: 'User Role List',
	width: '100%',
	 
	initComponent: function() {    
	
		this.features = [{
			ftype: 'filters',
			encode: true,
			local: false
		}];
	 
		this.store = 'administrator.userRoleListStore';
		this.bbar = Ext.create('Ext.toolbar.Paging', {
				        store: 'administrator.userRoleListStore', 
				        displayInfo: true,
				        emptyMsg: 'No result to display'
				   });
		this.tbar = [{
		  	text: 'Edit',
			action: 'edituserrole'
		},{
		  	text: 'Add',
			action: 'adduserrole'
		},{
		  	text: 'Copy',
			action: 'copyuserrole'
		},{
		  	text: 'Delete',
			action: 'deleteuserrole'
		},{
		  	text: 'Members',
			action: 'userroleusers'
		}];
		  
		this.columns =  [{
            xtype: 'rownumberer',
            width: 50,
            sortable: false
	    },{  
		    text: 'Role ID',
		    dataIndex: 'USERGRPID',
		    sortable: true,
			filterable: true,
		    width: 250
		},{  
		    text: 'Description',
		    dataIndex: 'DESCRIPTION',
		    sortable: true,
			filterable: true,
		    width: 250
		},{  
		    text: 'RECDATECREATED',
		    dataIndex: 'RECDATECREATED',
			hidden: true,
			xtype: 'datecolumn',
			filterable: true,
		    width: 250
		},{  
		    text: 'Date Last Update',
		    dataIndex: 'DATELASTUPDATE',
			xtype: 'datecolumn',
			filterable: true,
		    width: 250
		}],
		
		this.callParent(arguments);
	}
});