Ext.define('Form.view.file.copyWin', { 
	extend: 'Ext.window.Window',
	alias: 'widget.copywin',
    title: 'Copy',
	closable: true,
	autoDestroy: true,
    padding: 1,
    layout: 'fit',
	
	initComponent: function() {
		this.items = [{
				xtype: 'copyform',
		}];
				
		this.callParent(arguments);
	}
		
});