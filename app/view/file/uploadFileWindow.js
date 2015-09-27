Ext.define('Form.view.file.uploadFileWindow', { 
	extend: 'Ext.window.Window',
	alias: 'widget.uploadfilewindow',
    title: 'Upload Files',
	closable: true,
	autoDestroy: true,
    padding: 1,
    layout: 'fit',
	
	initComponent: function() {
		this.items = [{
				xtype: 'uploadfileform',
		}];
				
		this.callParent(arguments);
	}
		
});