Ext.define('Form.view.query.seriesWindow', { 
	extend: 'Ext.window.Window',
	alias: 'widget.serieswindow',
    title: 'Chart Series Details',
	closable: true,
	autoDestroy: true,
    padding: 1,
    layout: 'fit',
	
	initComponent: function() {
		this.items = [{
				xtype: 'seriesform',
		}];
				
		this.callParent(arguments);
	}
		
});