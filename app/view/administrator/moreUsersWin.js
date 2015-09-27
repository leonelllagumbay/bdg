Ext.define('Form.view.administrator.moreUsersWin', { 
	extend: 'Ext.window.Window',
	alias: 'widget.moreuserswin',
    title: 'Add Multiple Users',
	closable: true,
	autoDestroy: true,
    padding: 1,
    width: 404,
    height: 200,
    layout: 'hbox',
	
	initComponent: function() {
		this.items = [{
			xtype: 'moreusersform',
		}];
				
		this.callParent(arguments);
	}
		
});