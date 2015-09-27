Ext.define('Form.view.administrator.userRoleMemberWin', { 
	extend: 'Ext.window.Window',
	alias: 'widget.userrolememberwin',
    title: 'Role Members',
	closable: true,
	autoDestroy: true,
    padding: 1,
    width: 404,
    height: 400,
    layout: 'hbox',
	
	initComponent: function() {
		this.items = [{
			xtype: 'userrolemember',
		}];
				
		this.callParent(arguments);
	}
		
});