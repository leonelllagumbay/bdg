Ext.define('Form.view.query.MainListExtra', {
	extend: 'Ext.form.Panel',
	alias: 'widget.mainlistextra',
	width: 70,
	buttonAlign: 'center',
	initComponent: function() {    
	
		this.items = [];
		
		this.buttons = [{
			text: 'Save',
			padding: 10,
			action: 'savequery'
		}]
	 
		this.callParent(arguments);
	}
})
