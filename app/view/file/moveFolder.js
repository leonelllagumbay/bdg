Ext.define('Form.view.file.moveFolder', { 
	extend: 'Ext.window.Window',
	alias: 'widget.movefolder',
    title: 'Select destination folder',
	closable: true,
	autoDestroy: true,
    height: 120,
    width: 370,
    padding: 1,
    layout: 'fit',
	
	initComponent: function() {
		this.items = [{
				xtype: 'form',
				autoScroll: true,
				items: [{
					xtype: 'combobox',
					allowBlank: false,
					fieldLabel: 'Destination',
					labelWidth: 70,
					forceSelection: true,
					displayField: 'folderdestinationname',
					valueField: 'folderdestinationcode',
					queryMode: 'remote',
					store: 'file.folderDestinationStore',
					pageSize: 30,
					minChars: 1,
					width: 330,
					padding: 5,
					name: 'FOLDERDESTINATION' // future parent folder
				},{
					xtype: 'textfield',
					fieldLabel: 'Folder Id',
					hidden: true,
					name: 'FOLDERID' // source folder id
				},{
					xtype: 'textfield',
					fieldLabel: 'Folder depth',
					hidden: true,
					name: 'FOLDERDEPTH'
				},{
					xtype: 'textfield',
					fieldLabel: 'FILEID', // a flag used for moving files instead of folders
					hidden: true,
					name: 'FILEID',
					value: ''
				}],
				api: {
				        submit: Ext.file.File.moveMyFolder
				},
				buttons: [{
					xtype: 'button',
					text: 'Ok',
					name: 'movefolder',
					width: '30%',
					action: 'movefolder'
				}],
				
			}];
				
		this.callParent(arguments);
	}
		
});