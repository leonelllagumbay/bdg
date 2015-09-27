Ext.define('Form.view.file.shareWin', { 
	extend: 'Ext.window.Window',
	alias: 'widget.sharewin',
    title: 'Share',
	closable: true,
	autoDestroy: true,
    padding: 1,
    width: 800,
    height: 400,
    layout: 'hbox',
	
	initComponent: function() {
		this.items = [{
			xtype: 'sharegrid',
		},{
			xtype: 'shareform'
		}];
				
		this.callParent(arguments);
	}
		
});