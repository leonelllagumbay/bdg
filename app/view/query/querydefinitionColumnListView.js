Ext.define('Form.view.query.querydefinitionColumnListView', { 
	extend: 'Ext.grid.Panel',
	alias: 'widget.querydefinitioncolumnlistview',
	title: 'eQuery Definition Column List',
	width: '100%', 
	height: '100%',
	autoScroll: true,
	initComponent: function() {  
		this.tbar = [{
		  	text: 'Query List',
			action: 'querylist'
		},{
		  	text: 'Column Definition',
			action: 'columndefinition'
		},{
		  	text: 'Write Codes',
			action: 'generatequery'
	    },{
		  	text: 'Erase Codes',
			action: 'eraseequery'
	    },{
		  	text: 'Preview',
			action: 'previewquery'
	    }];
		
		this.features = [{
			ftype: 'filters',
			encode: true,
			local: false, 
			filters: [{
				type: 'string',
				dataIndex: 'EQRYNAME'
			}]
		}];
		
		this.plugins = [{	
			ptype: 'rowediting',	
			clicksToEdit: 2,
			clicksToMoveEditor: 2,
		}],
	 
		this.store = 'query.queryDefinitionColumnListStore';
		this.bbar = Ext.create('Ext.toolbar.Paging', {
				        store: 'query.queryDefinitionColumnListStore', 
				        displayInfo: true,
				        emptyMsg: "No column to display"
				   });
		  
		this.columns =  [{
            xtype: 'rownumberer',
            width: 50,
            sortable: false
	       },{  
		    text: 'EVIEWFIELDCODE',  
		    dataIndex: 'EVIEWFIELDCODE',
			hidden: true,
		    width: 150
		  },{  
		    text: 'EQRYCODEFK',  
		    dataIndex: 'EQRYCODEFK',
			hidden: true,
		    width: 150
		  },{  
		    text: 'Table Name',
		    dataIndex: 'TABLENAME',
			filterable: true,
		    width: 200
		  },{  
		    text: 'Column Name',
		    dataIndex: 'FIELDNAME',
			filterable: true,
			width: 250
		  },{  
		    text: 'Alias',
		    dataIndex: 'FIELDALIAS',
			filterable: true,
			editor: 'textfield',
		    flex: 1
		  },{  
		    text: 'Type Name',
		    dataIndex: 'TYPE_NAME',
			filterable: false,
			sortable: false,
		    width: 100
		  },{  
		    text: 'Order',
		    dataIndex: 'COLUMNORDER',
		    editor: 'numberfield',
		    width: 60
		  },{  
		    text: 'IS_PRIMARYKEY',
		    dataIndex: 'IS_PRIMARYKEY',
			hidden: true,
		    flex: 1
		  },{  
		    text: 'ORDINAL_POSITION',
		    dataIndex: 'ORDINAL_POSITION',
			hidden: true,
		    flex: 1
		  },{  
		    text: 'DECIMAL_DIGITS',
		    dataIndex: 'DECIMAL_DIGITS',
			hidden: true,
		    flex: 1
		  },{  
		    text: 'IS_NULLABLE',
		    dataIndex: 'IS_NULLABLE',
			hidden: true,
		    flex: 1
		  },{  
		    text: 'COLUMN_DEFAULT_VALUE',
		    dataIndex: 'COLUMN_DEFAULT_VALUE',
			hidden: true,
		    flex: 1
		  },{  
		    text: 'CHAR_OCTET_LENGTH',
		    dataIndex: 'CHAR_OCTET_LENGTH',
			hidden: true,
		    flex: 1
		  },{  
		    text: 'IS_FOREIGNKEY',
		    dataIndex: 'IS_FOREIGNKEY',
			hidden: true,
		    flex: 1
		  },{  
		    text: 'REFERENCED_PRIMARYKEY',
		    dataIndex: 'REFERENCED_PRIMARYKEY',
			hidden: true,
		    flex: 1
		  },{  
		    text: 'REFERENCED_PRIMARYKEY_TABLE',
		    dataIndex: 'REFERENCED_PRIMARYKEY_TABLE',
			hidden: true,
		    flex: 1
		  }],
		
		this.callParent(arguments);
	}
});