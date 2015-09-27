Ext.define('Form.view.query.axisWindow', { 
	extend: 'Ext.window.Window',
	alias: 'widget.axiswindow',
    title: 'Chart Axis Details',
	closable: true,
	autoDestroy: true,
    padding: 1,
    layout: 'fit',
	
	initComponent: function() {
		this.items = [{
				xtype: 'axisform',
		}];
				
		this.callParent(arguments);
	}
		
});