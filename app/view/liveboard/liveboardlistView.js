Ext.define('Form.view.liveboard.liveboardlistView', { 
	extend: 'Ext.grid.Panel',
	alias: 'widget.liveboardlistview',
	title: 'Liveboard List',
	width: '100%',
	 
	initComponent: function() {    
	
		this.features = [{
			ftype: 'filters',
			encode: true,
			local: false, 
			filters: [{
				type: 'string',
				dataIndex: 'LBTITLE'
			}]
		}];
	 
		this.store = 'liveboard.liveboardlistStore';
		this.bbar = Ext.create('Ext.toolbar.Paging', {
				        store: 'liveboard.liveboardlistStore', 
				        displayInfo: true,
				        emptyMsg: "No query to display"
				   });
		this.tbar = [{
		  	text: 'New',
			action: 'lbnewliveboard'
		},{
		  	text: 'Edit',
			action: 'lbeditdetails'
		},{
		  	text: 'Copy',
			action: 'lbcopyliveboard'
		},{
		  	text: 'Items',
			action: 'lbviewliveboard'
		},{
		  	text: 'Activate',
			action: 'lbactivate'
	    },{
		  	text: 'Deactivate',
			action: 'lbdeactivate'
	    },{
		  	text: 'Preview',
			action: 'lbpreview'
	    },{
		  	text: 'Delete',
			action: 'lbdelete'
	    }];
		  
		this.columns =  [{
	            xtype: 'rownumberer',
	            width: 50,
	            sortable: false
	       },{  
			    text: 'Liveboard Code',  
			    dataIndex: 'LIVEBOARDCODE',
				hidden: true,
			    width: 150
		   },{
				text: 'Status',
				dataIndex: 'LBSTATUS',
				width: 70,
				filterable: true,
				renderer: function(value, metaData, record) {
					if(value == 'ACTIVE') {
						metaData.style = 'background-color: #00FF00;';
						return 'ACTIVE';
					} else {
						metaData.style = 'background-color: #AAEEFF;';
						return 'NOT ACTIVE';
					}
				}
		  },{  
			    text: 'Title',
			    dataIndex: 'LBTITLE',
				hidden: false,
				filterable: true,
			    width: 250
		  },{  
			    text: 'Description',
			    dataIndex: 'LIVEBOARDDESC',
				hidden: false,
				filterable: true,
			    flex: 1
		  },{  
			    text: 'No. of Columns',
			    dataIndex: 'TABLECOLUMNS',
				hidden: false,
				filterable: true,
				width: 100
		  },{  
			    text: 'Width',
			    dataIndex: 'WIDTH',
				filterable: true,
			    width: 100
		  },{  
			    text: 'Height',
			    dataIndex: 'HEIGHT',
				filterable: true,
				width: 100
		  },{
			    text: 'Date Added',
			    dataIndex: 'RECDATECREATED',
				hidden: true,
			    width: 100,
				renderer: Ext.util.Format.dateRenderer('n/j/Y'),
				filter: {
					type: 'date',
					format: 'Y-n-j'
				}
		  },{  
			    text: 'Owner',
			    dataIndex: 'RECCREATEDBY',
				hidden: true,
				width: 100
		  }],
		
		this.callParent(arguments);
	}
});