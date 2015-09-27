Ext.define('Form.view.administrator.userAppListView', { 
	extend: 'Ext.grid.Panel',
	alias: 'widget.userapplistview',
	title: 'User App List',
	width: '100%',
	
	initComponent: function() {    
		
		this.features = [{
			ftype: 'filters',
			encode: true,
			local: false
		}];
	 
		this.store = 'administrator.userAppListStore';
		
		this.bbar = Ext.create('Ext.toolbar.Paging', {
				        store: 'administrator.userAppListStore', 
				        displayInfo: true,
				        emptyMsg: 'No result to display'
				   });
		
		this.tbar = [{
		  	text: 'Users',
			action: 'appuser'
		}];
		  
		this.columns =  [{
            xtype: 'rownumberer',
            width: 50,
            sortable: false
	    },{  
		    text: 'App order',
		    dataIndex: 'APPORDER',
		    xtype: 'numbercolumn',
		    format: '0',
			filterable: true,
		    width: 60
		},{  
		    text: 'Name',
		    dataIndex: 'NAMEORTITLE',
			filterable: true,
		    width: 250
		},{  
		    text: 'App ID',
		    dataIndex: 'APPID',
			filterable: true,
		    width: 240
		},{  
		    text: 'Folder ID',
		    dataIndex: 'FOLDERIDFK',
		    hidden: true,
			filterable: true,
		    width: 150
		},{  
		    text: 'Tab ID',
		    dataIndex: 'TABIDFK',
		    hidden: true,
			filterable: true,
		    width: 150
		},{  
		    text: 'Object ID',
		    dataIndex: 'OBJECTIDFK',
		    hidden: true,
			filterable: true,
		    width: 150
		},{  
		    text: 'Required scripts',
		    dataIndex: 'SCRIPTREQUIRES',
		    sortable: true,
			filterable: true,
		    width: 250
		},{  
		    text: 'Namespaces',
		    dataIndex: 'EXTNAMESPACE',
		    sortable: true,
			filterable: true,
		    width: 250
		},{  
		    text: 'Controllers',
		    dataIndex: 'EXTCONTROLLERS',
		    sortable: true,
			filterable: true,
		    width: 250
		},{  
		    text: 'Url if no script',
		    dataIndex: 'URLIFNOTEXT',
		    sortable: true,
			filterable: true,
		    width: 250
		},{  
		    text: 'API source',
		    dataIndex: 'APISCRIPTSOURCE',
		    sortable: true,
			filterable: true,
		    width: 250
		},{  
		    text: 'Icon',
		    dataIndex: 'APPICON',
		    sortable: true,
			filterable: true,
		    width: 150
		},{  
		    text: 'CSS+',
		    dataIndex: 'EXTRACSS',
		    sortable: true,
			filterable: true,
		    width: 250
		},{  
		    text: 'Code+',
		    dataIndex: 'EXTRACODE',
		    sortable: true,
			filterable: true,
		    width: 250
		},{  
		    text: 'PERSONNELIDNO',
		    dataIndex: 'PERSONNELIDNO',
		    hidden: true,
			filterable: true,
		    width: 250
		},{  
		    text: 'APPROVED',
		    dataIndex: 'APPROVED',
		    hidden: true,
			filterable: true,
		    width: 250
		},{  
		    text: 'ACTIONBY',
		    dataIndex: 'ACTIONBY',
		    hidden: true,
			filterable: true,
		    width: 250
		},{  
		    text: 'EFORMID',
		    dataIndex: 'EFORMID',
		    hidden: true,
			filterable: true,
		    width: 250
		},{  
		    text: 'PROCESSID',
		    dataIndex: 'PROCESSID',
		    hidden: true,
			filterable: true,
		    width: 250
		},{  
		    text: 'DATELASTUPDATE',
		    dataIndex: 'DATELASTUPDATE',
		    hidden: true,
		    xtype: 'datecolumn',
			filterable: true,
		    width: 250
		},{  
		    text: 'DATEACTIONWASDONE',
		    dataIndex: 'DATEACTIONWASDONE',
		    hidden: true,
			filterable: true,
			xtype: 'datecolumn',
		    width: 250
		},{  
		    text: 'RECDATECREATED',
		    dataIndex: 'RECDATECREATED',
		    hidden: true,
			filterable: true,
			xtype: 'datecolumn',
		    width: 250
		}],
		
		this.callParent(arguments);
	}
});