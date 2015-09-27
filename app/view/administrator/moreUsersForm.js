Ext.define('Form.view.administrator.moreUsersForm', { 
	extend: 'Ext.form.Panel',
	alias: 'widget.moreusersform',
	width: '100%', 
	height: '100%',
	autoScroll: true,
	initComponent: function() {   
		
		this.items = [{
			fieldLabel: 'Select excel file',
			name: 'multipleuser',
			padding: '50 7 7 7',
			width: 350,
			allowBlank: false,
			xtype: 'filefield'
		}];
		
		this.api = {
				submit: Ext.administrator.Excel.insertMultipleUser
		};
		
		this.buttons = [{
			text: 'Upload Users',
			action: 'uploadusers'
		}];
		
		this.callParent(arguments);
	}
});