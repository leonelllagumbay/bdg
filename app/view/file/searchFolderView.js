Ext.define('Form.view.file.searchFolderView', { 
	extend: 'Ext.window.Window',
	alias: 'widget.searchfolderview',
    title: 'Search folder',
	closable: true,
	autoDestroy: true,
    height: 200,
    width: 370,
    padding: 1,
    layout: 'fit',
	
	initComponent: function() {
		this.items = [{
				xtype: 'form',
				autoScroll: true,
				items: [{
					xtype: 'textfield',
					fieldLabel: 'Filter',
					labelWidth: 70,
					width: 300,
					padding: 7,
					name: 'FOLDERQUERY' // future parent folder
				},{
					xtype: 'combobox',
					fieldLabel: 'Order by',
					labelWidth: 70,
					forceSelection: true,
					displayField: 'propertyname',
					valueField: 'propertycode',
					queryMode: 'remote',
					store: 'file.folderOrderStore',
					width: 200,
					padding: 7,
					name: 'FOLDERORDER' // future parent folder
				},{
					xtype: 'combobox',
					fieldLabel: 'Direction',
					labelWidth: 70,
					displayField: 'propertyname',
					valueField: 'propertycode',
					queryMode: 'remote',
					store: 'file.orderDir',
					width: 200,
					value: 'ASC',
					allowBlank: false,
					padding: 7,
					name: 'FOLDERORDERDIRECTION' // future parent folder
				}],
				buttons: [{
					xtype: 'button',
					text: 'Ok',
					name: 'searchfolder',
					width: '30%',
					action: 'searchfolder'
				}],
				
			}];
				
		this.callParent(arguments);
	}
		
});