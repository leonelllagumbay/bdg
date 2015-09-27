Ext.define('Form.view.jobbuilder.crudWin', { 
	extend: 'Ext.window.Window',
	alias: 'widget.crudwin',
    title: 'Add Position',
	closable: true,
	autoDestroy: true,
    padding: 1,
    width: 450,
    height: 550,
    layout: 'hbox',
	
	initComponent: function() {
		this.items = [{
			xtype: 'crudform',
		}];
				
		this.callParent(arguments);
	}
		
});