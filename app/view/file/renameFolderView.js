Ext.define('Form.view.file.renameFolderView', { 
	extend: 'Ext.window.Window',
	alias: 'widget.renamefolderview',
    title: 'Rename',
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
					xtype: 'textfield',
					fieldLabel: 'New folder name',
					name: 'FOLDERNAME',
					padding: 7,
					width: 300
				},{
					xtype: 'textfield',
					fieldLabel: 'Folder Id',
					hidden: true,
					name: 'FOLDERID' // source folder id
				}],
				api: {
				        submit: Ext.file.File.renameMyFolder
				},
				buttons: [{
					xtype: 'button',
					text: 'Ok',
					name: 'renamefolder',
					width: '30%',
					action: 'renamefolder'
				}],
				
			}];
				
		this.callParent(arguments);
	}
		
});