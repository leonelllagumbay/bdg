Ext.define('Form.view.administrator.assignUserWin', { 
	extend: 'Ext.window.Window',
	alias: 'widget.assignuserwin',
    title: 'App Users Window',
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