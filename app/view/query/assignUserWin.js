Ext.define('Form.view.query.assignUserWin', { 
	extend: 'Ext.window.Window',
	alias: 'widget.assignuserwin',
    title: 'Assign Users Window',
	closable: true,
	autoDestroy: true,
    padding: 1,
    width: 804,
    height: 400,
    layout: 'hbox',
	
	initComponent: function() {
		this.items = [{
			xtype: 'assignuser',
		},{
			xtype: 'assignuserrole'
		}];
				
		this.callParent(arguments);
	}
		
});