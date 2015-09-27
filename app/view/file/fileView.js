Ext.define('Form.view.file.fileView', { 
	extend: 'Ext.tree.Panel',
	alias: 'widget.fileview',
	width: '100%', 
	height: '100%',
	autoScroll: true,
	rootVisible: false,
	initComponent: function() {   
		this.store = 'file.folderStore';
		this.callParent(arguments);
	}
});


