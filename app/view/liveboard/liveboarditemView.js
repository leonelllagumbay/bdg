Ext.define('Form.view.liveboard.liveboarditemView', { 
	extend: 'Ext.grid.Panel',
	alias: 'widget.liveboarditemview',
	title: 'Liveboard Items',
	width: '100%', 
	height: '100%',
	autoScroll: true,
	initComponent: function() {  
		this.tbar = [{
		  	text: 'Liveboard',
			action: 'lblist'
		},{
		  	text: 'New Item',
			action: 'newliveboarditem'
	    },{
		  	text: 'Edit',
			action: 'editliveboarditem'
	    },{
		  	text: 'Copy Item',
			action: 'copyliveboarditem'
	    },{
		  	text: 'Delete Item',
			action: 'deleteliveboarditem'
	    },{
		  	text: 'Activate',
			action: 'lbactivate'
	    },{
		  	text: 'Deactivate',
			action: 'lbdeactivate'
	    },{
		  	text: 'Preview',
			action: 'lbpreview'
	    }];
		
		this.features = [{
			ftype: 'filters',
			encode: true,
			local: false, 
			filters: [{
				type: 'string',
				dataIndex: 'XTYPETITLE'
			}]
		}];
	 
		this.store = 'liveboard.liveboarditemStore';
		this.bbar = Ext.create('Ext.toolbar.Paging', {
				        store: 'liveboard.liveboarditemStore', 
				        displayInfo: true,
				        emptyMsg: "No result to display"
				   });
		  
		this.columns =  [{
	            xtype: 'rownumberer',
	            width: 50,
	            sortable: false
	       },{  
			    text: 'LIVEBOARDITEMCODE',  
			    dataIndex: 'LIVEBOARDITEMCODE',
				hidden: true,
			    width: 150
		  },{  
			    text: 'LIVEBOARDCODE',  
			    dataIndex: 'LIVEBOARDCODE',
				hidden: true,
			    width: 100
		  },{  
			    text: 'Query Code',
			    dataIndex: 'XTYPE',
			    filterable: true,
			    sortable: true,
			    width: 250
		  },{  
			    text: 'Query Name',
			    dataIndex: 'XTYPETITLE',
			    filterable: false,
			    sortable: false,
			    width: 250
		  },{  
			    text: 'Row span',
			    dataIndex: 'ROWSPAN',
				filterable: true,
			    width: 70
		  },{  
			    text: 'Column span',
			    dataIndex: 'COLSPAN',
				filterable: true,
				width: 80
		  },{  
			    text: 'Body Style',
			    dataIndex: 'BODYSTYLE',
			    hidden: true,
				filterable: true,
				flex: 1
		  },{  
			    text: 'Cell Class', 
			    dataIndex: 'CELLCLS',
				filterable: true,
				hidden: true,
			    flex: 1
		  },{  
			    text: 'Live board item extra', 
			    dataIndex: 'LIVEBOARDITEMEXTRA',
				filterable: true,
				hidden: true,
			    width: 300
		  },{  
			    text: 'Html',
			    dataIndex: 'HTML',
				filterable: false,
				sortable: false,
			    flex: 1
		  }],
		
		this.callParent(arguments);
	}
});