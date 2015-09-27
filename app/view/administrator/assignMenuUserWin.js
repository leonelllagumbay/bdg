Ext.define('Form.view.administrator.assignMenuUserWin', { 
	extend: 'Ext.window.Window',
	alias: 'widget.assignmenuuserwin',
    title: 'Menu Users Window',
	closable: true,
	autoDestroy: true,
    padding: 1,
    width: 804,
    height: 400,
    layout: 'hbox',
	
	initComponent: function() {
		this.items = [{
			xtype: 'assignmenuuser',
		},{
			xtype: 'assignmenuuserrole'
		}];
				
		this.callParent(arguments);
	}
		
});