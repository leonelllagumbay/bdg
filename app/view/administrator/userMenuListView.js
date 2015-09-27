Ext.define('Form.view.administrator.userMenuListView', { 
	extend: 'Ext.grid.Panel',
	alias: 'widget.usermenulistview',
	title: 'User Menu List',
	width: '100%',
	 
	initComponent: function() {    
	
		this.features = [{
			ftype: 'filters',
			encode: true,
			local: false
		}];
	 
		this.store = 'administrator.userMenuListStore';
		
		this.bbar = Ext.create('Ext.toolbar.Paging', {
				        store: 'administrator.userMenuListStore', 
				        displayInfo: true,
				        emptyMsg: 'No result to display'
				   });
		this.tbar = [{
		  	text: 'Users',
			action: 'menuuser'
		}];
		  
		this.columns =  [{
            xtype: 'rownumberer',
            width: 50,
            sortable: false
	    },{  
		    text: 'Menu ID',
		    dataIndex: 'MENUID',
			filterable: true,
		    width: 230
		},{  
		    text: 'Order',
		    dataIndex: 'MENUORDER',
		    xtype: 'numbercolumn',
		    format: '0',
			filterable: true,
		    width: 50
		},{  
		    text: 'Hierarchy Level',
		    dataIndex: 'HIERARCHYLEVEL',
		    xtype: 'numbercolumn',
		    format: '0',
			filterable: true,
		    width: 100
		},{  
		    text: 'Name',
		    dataIndex: 'MENUNAME',
			filterable: true,
		    width: 250
		},{  
		    text: 'Hint',
		    dataIndex: 'MENUHINT',
			filterable: true,
		    width: 250
		},{  
		    text: 'TABIDFK',
		    dataIndex: 'TABIDFK',
		    hidden: true,
			filterable: true,
		    width: 250
		},{  
		    text: 'FOLDERIDFK',
		    dataIndex: 'FOLDERIDFK',
		    hidden: true,
			filterable: true,
		    width: 250
		},{  
		    text: 'Logo',
		    dataIndex: 'MENULOGO',
			filterable: true,
		    width: 150
		},{  
		    text: 'Parent Menu',
		    dataIndex: 'PARENTMENUID',
			filterable: true,
		    width: 200
		},{  
		    text: 'Link',
		    dataIndex: 'SOURCELINK',
			filterable: true,
		    width: 250
		},{  
		    text: 'Style',
		    dataIndex: 'STYLE',
			filterable: true,
		    width: 250
		},{  
		    text: 'Menu+',
		    dataIndex: 'EXTRAS',
			filterable: true,
		    width: 250
		},{  
		    text: 'OBJECTIDFK',
		    dataIndex: 'OBJECTIDFK',
		    hidden: true,
			filterable: true,
		    width: 250
		},{  
		    text: 'PERSONNELIDNO',
		    hidden: true,
		    dataIndex: 'PERSONNELIDNO',
			filterable: true,
		    width: 250
		},{  
		    text: 'APPROVED',
		    hidden: true,
		    dataIndex: 'APPROVED',
			filterable: true,
		    width: 250
		},{  
		    text: 'ACTIONBY',
		    hidden: true,
		    dataIndex: 'ACTIONBY',
			filterable: true,
		    width: 250
		},{  
		    text: 'EFORMID',
		    hidden: true,
		    dataIndex: 'EFORMID',
			filterable: true,
		    width: 250
		},{  
		    text: 'PROCESSID',
		    hidden: true,
		    dataIndex: 'PROCESSID',
			filterable: true,
		    width: 250
		},{  
		    text: 'DATELASTUPDATE',
		    hidden: true,
		    xtype: 'datecolumn',
		    dataIndex: 'DATELASTUPDATE',
			filterable: true,
		    width: 250
		},{  
		    text: 'DATEACTIONWASDONE',
		    hidden: true,
		    xtype: 'datecolumn',
		    dataIndex: 'DATEACTIONWASDONE',
			filterable: true,
		    width: 250
		},{  
		    text: 'RECDATECREATED',
		    hidden: true,
		    xtype: 'datecolumn',
		    dataIndex: 'RECDATECREATED',
			filterable: true,
		    width: 250
		}],
		
		this.callParent(arguments);
	}
});