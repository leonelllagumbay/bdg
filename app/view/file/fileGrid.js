Ext.define('Form.view.file.fileGrid', { 
	extend: 'Ext.grid.Panel',
	alias: 'widget.filegrid',
	width: '100%', 
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
				dataIndex: 'FILENAME'
			}]
		}];
	 
	    this.plugins = [
			Ext.create('Ext.grid.plugin.CellEditing', {
			    clicksToEdit: 2
    	    })
		];
	    
		this.store = 'file.fileStore';
		this.fbar = Ext.create('Ext.toolbar.Paging', {
				        store: 'file.fileStore', 
				        displayInfo: true,
				        emptyMsg: "No result to display"
				   });
		
		this.tbar = [{
			text: 'Upload File',
			action: 'uploadfile'
		},{
			text: 'Share',
			action: 'share'
		},{
			text: 'Copy',
			action: 'copy'
		},{
			text: 'Move',
			action: 'move'
		},{
			xtype: 'tbspacer',
			width: 50
		},{
			text: 'Delete',
			action: 'delete'
		},{
			xtype: 'tbspacer',
			width: 50
		},{
			text: 'Gallery',
			action: 'gallery'
		}];
		this.columns = [{
            xtype: 'rownumberer',
            width: 60,
            sortable: false
	    },{ 
			text: 'Folder Name',  
			dataIndex: 'FOLDERNAME',
			filterable: true,
			sortable: true,
			width: 100,
			hidden: true
		},{ 
			text: 'Name',  
			dataIndex: 'FILENAME',
			filterable: true,
			sortable: true,
			width: 170,
			editor: 'textfield'
		},{ 
			text: 'Description', 
			dataIndex: 'FILECAPTION', 
			flex: 1,
			filterable: true,
			sortable: true,
			editor: 'textfield'
		},{
		    text: 'Record Date Created',
		    dataIndex: 'RECDATECREATED',
			hidden: true,
		    width: 150,
			renderer: Ext.util.Format.dateRenderer('n/j/Y'),
			filter: {
				type: 'date',
				format: 'Y-n-j'
			}
		  },{
		    text: 'Date Last Update',
		    dataIndex: 'DATELASTUPDATE',
			hidden: false,
		    width: 120,
			renderer: Ext.util.Format.dateRenderer('n/j/Y'),
			filter: {
				type: 'date',
				format: 'Y-n-j'
			}
		  },{
			 text: 'Open',
			 width: 47,
			 dataIndex: 'FILEID',
			 filterable: true,
			 renderer: function(value,p,record) {
				 if (record.data['SHAREDBYUSERID']) {
					 var useriddata = record.data['SHAREDBYUSERID'];
				 } else {
					 var useriddata = GLOBAL_VARS_DIRECT.USERID;
				 }
				 return Ext.String.format('<a target=\'_new\' href=\'.\/unDB\/document\/'+ GLOBAL_VARS_DIRECT.COMPANYCODE +'\/'+ useriddata +'\/{0}\'><b>Open<\/b><\/a>', value);
			 }
		  },{ 
			text: 'Shared By',  
			dataIndex: 'SHAREDBYNAME',
			filterable: true,
			sortable: true,
			width: 150,
			hidden: true
		},{ 
			text: 'Shared By User ID',  
			dataIndex: 'SHAREDBYUSERID',
			filterable: true,
			sortable: true,
			width: 50,
			hidden: true
		},{
			  text: 'FILEEXTENSION',
			  dataIndex: 'FILEEXTENSION',
			  hidden: true,
			  width: 70,
			  sortable: true,
			  filterable: true
		  },{
			  text: 'SORTORDER',
			  dataIndex: 'SORTORDER',
			  hidden: true,
			  width: 200,
			  sortable: true,
			  filterable: true
		  },{
			  text: 'OBJECTIDFK',
			  dataIndex: 'OBJECTIDFK',
			  hidden: true,
			  width: 200,
			  sortable: true,
			  filterable: true
		  },{
			  text: 'FOLDERIDFK',
			  dataIndex: 'FOLDERIDFK',
			  hidden: true,
			  width: 200,
			  sortable: true,
			  filterable: true
		  },{
			  text: 'RECCREATEDBY',
			  dataIndex: 'RECCREATEDBY',
			  hidden: true,
			  width: 200,
			  sortable: true,
			  filterable: true
		  },{
			  text: 'APPROVED',
			  dataIndex: 'APPROVED',
			  hidden: true,
			  width: 200,
			  sortable: true,
			  filterable: true
		  },{
			  text: 'EFORMID',
			  dataIndex: 'EFORMID',
			  hidden: true,
			  width: 200,
			  sortable: true,
			  filterable: true
		  },{
			  text: 'PROCESSID',
			  dataIndex: 'PROCESSID',
			  hidden: true,
			  width: 200,
			  sortable: true,
			  filterable: true
		  }];
		this.callParent(arguments);
	}
});