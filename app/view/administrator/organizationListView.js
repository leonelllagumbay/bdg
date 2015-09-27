Ext.define('Form.view.administrator.organizationListView', { 
	extend: 'Ext.grid.Panel',
	alias: 'widget.organizationlistview',
	title: 'Organization List',
	width: '100%',
	 
	initComponent: function() {    
	
		this.features = [{
			ftype: 'filters',
			encode: true,
			local: false, 
			filters: [{
				type: 'string',
				dataIndex: 'COMPANYNAME'
			}]
		}];
	 
		this.store = 'administrator.organizationListStore';
		this.bbar = Ext.create('Ext.toolbar.Paging', {
				        store: 'administrator.organizationListStore', 
				        displayInfo: true
				   });
		this.tbar = [{
		  	text: 'Reserved',
			action: 'reserved'
		}];
		  
		this.columns =  [{
            xtype: 'rownumberer',
            width: 50,
            sortable: false
	       },{  
		    text: 'Name',
		    dataIndex: 'COMPANYNAME',
			hidden: false,
			filterable: true,
		    width: 250
		}],
		
		this.callParent(arguments);
	}
});