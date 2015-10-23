Ext.define('Form.view.forum.forumListGrid', { 
	extend: 'Ext.grid.Panel',
	alias: 'widget.forumlistgrid',
	title: 'eForums List',
	width: '30%', 
	height: '100%',
	autoScroll: true,
	
	initComponent: function() {    
	
		this.features = [{
			ftype: 'filters',
			encode: true, // json encode the filter query
			local: false, 
			filters: [{
				type: 'string',
				dataIndex: 'DESCRIPTION'
			}]
		}];
	 
		this.tbar = [{
			xtype: 'displayfield',
			value: '<a target="_blank" href="./?bdg=MAINUSRAPPF5038527-9F22-9981-A084244087E398BD&eformid=F89979C8-0E6A-8F52-5F8AD90C599823B1&actiontype=getmyeforms&myvar=hi">Manage</a>'
		},{
			xtype: 'displayfield',
			value: '&nbsp;&nbsp;'
		},{
			xtype: 'displayfield',
			value: '<a target="_blank" href="./?bdg=MAINUSRAPPF5038527-9F22-9981-A084244087E398BD&eformid=F9261928-C202-35B1-40155364B4DA3415&actiontype=getmyeforms&myvar=hi">User</a>'
		},{
			xtype: 'displayfield',
			value: '&nbsp;&nbsp;'
		},{
			xtype: 'displayfield',
			value: '<a target="_blank" href="./?bdg=MAINUSRAPPF5038527-9F22-9981-A084244087E398BD&eformid=F99DDBCE-065D-AAE0-7A299673A11F3A78&actiontype=getmyeforms&myvar=hi">User by Role</a>'
		}];
	    
		this.store = 'forum.forumListStore';
		
		this.bbar = Ext.create('Ext.toolbar.Paging', {
				        store: 'forum.forumListStore', 
				        displayInfo: true,
				        emptyMsg: "Nothing to display"
				   });
		 
		this.columns =  [{
		  	text: 'FORUMCODE',
			dataIndex: 'FORUMCODE',
			hidden: true,
			filterable: true,
			flex: 1
		  },{
		  	text: 'COMPANYCODE',
			dataIndex: 'COMPANYCODE',
			hidden: true,
			filterable: true,
			width: 100 
		  },{
		  	text: 'PERSONNELIDNO',
			dataIndex: 'PERSONNELIDNO',
			hidden: true,
			filterable: true,
			width: 100 
		  },{
		  	text: 'EFORUMEMAIL',
			dataIndex: 'EFORUMEMAIL',
			hidden: true,
			filterable: true,
			width: 100 
		  },{
		  	text: 'ALLOWEMAILNOTIF',
			dataIndex: 'ALLOWEMAILNOTIF',
			hidden: true,
			filterable: true,
			width: 100
		  },{
		  	text: '',
			dataIndex: 'UNREAD',
			hidden: false,
			filterable: true,
			width: 50,
			renderer: function(value, metaData, record) {
				if(value == 0 || value == '') {
					return value;
				} else {
					return "<span style='background-color: red; border-radius: 12px; color: white;'><b>&nbsp;"+value+"&nbsp;</b></span>";
				}
			} 
		  },{
		  	text: 'List',
			dataIndex: 'DESCRIPTION',
			hidden: false,
			filterable: true,
			flex: 1
		  },{
		    text: 'Date Last Update',
		    dataIndex: 'DATELASTUPDATE',
			hidden: true,
			editor: {
				xtype: 'datefield'
			},
		    width: 100,
			renderer: Ext.util.Format.dateRenderer('n/j/Y'),
			filter: {
				type: 'date',
				format: 'Y-n-j'
			}
		  }],
		
		this.callParent(arguments);
	}
});
