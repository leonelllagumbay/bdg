Ext.define('Form.view.file.topFolderWindow', { 
	extend: 'Ext.window.Window',
	alias: 'widget.topfolderwindow',
    title: 'New Folder Form',
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
					allowBlank: false,
					fieldLabel: 'Name',
					labelWidth: 50,
					width: '97%',
					padding: 5,
					name: 'FOLDERNAME'
				},{
					xtype: 'textfield',
					fieldLabel: 'Hint',
					labelWidth: 50,
					width: '97%',
					padding: 5,
					name: 'FOLDERHINT'
				},{
					xtype: 'textfield',
					fieldLabel: 'Folder Type',
					hidden: true,
					name: 'FOLDERTYPE'
				},{
					xtype: 'textfield',
					fieldLabel: 'Paren Folder Id',
					hidden: true,
					name: 'PARENTFOLDERID'
				},{
					xtype: 'textfield',
					fieldLabel: 'Folder depth',
					hidden: true,
					name: 'FOLDERDEPTH'
				}],
				api: {
				        submit: Ext.file.File.createMyFolder
				},
				buttons: [{
					xtype: 'button',
					text: 'Add',
					name: 'AddFile',
					width: '30%',
					action: 'addfolder'
				}],
				
			}];
				
		this.callParent(arguments);
	}
		
});