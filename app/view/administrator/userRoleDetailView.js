Ext.define('Form.view.administrator.userRoleDetailView', { 
	extend: 'Ext.form.Panel',
	alias: 'widget.userroledetailview',
	title: 'User Role Details',
	titleAlign: 'center',
	buttonAlign: 'center',
	width: '100%', 
	height: '100%',
	autoScroll: true,
	initComponent: function() {   
		this.tbar = [{
		  	text: 'Back',
			action: 'backtouserrolelist'
		}];
		this.defaults = {
			xtype: 'textfield',
			labelWidth: 150,
			padding: '7 7 7 100',
			width: 450
		};
		
		this.items = [{
			fieldLabel: 'Action',
			name: 'USERACTION',
			readOnly: true
		},{
			fieldLabel: 'Role ID',
			name: 'USERGRPID',
			maxLength: 50,
			allowBlank: false,
			value: Ext.Date.format(new Date(), 'YmdHis')
		},{
			fieldLabel: 'Description',
			name: 'DESCRIPTION',
			maxLength: 60,
			allowBlank: false
		}];
		
		this.api = {
			submit: Ext.administrator.User.SubmitUserRole
		};
		
		
		this.buttons = [{
			text: 'Save',
			action: 'save'
		},{
			text: 'Cancel',
			action: 'cancel'
		}];
		
		this.callParent(arguments);
	}
});