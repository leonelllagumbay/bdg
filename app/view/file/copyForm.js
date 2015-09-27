Ext.define('Form.view.file.copyForm', { 
	extend: 'Ext.form.Panel',
	alias: 'widget.copyform',
	width: 400, 
	height: '100%',
	autoScroll: true,
	buttonAlign: 'right',
	initComponent: function() {   
		this.items = [{
			xtype: 'hiddenfield',
			name: 'FILEID',
			value: ''
		},{
			xtype: 'textfield',
			padding: 10,
			allowBlank: false,
			name: 'FILENAME',
			width: 350,
			fieldLabel: 'File Name'
		}];
		this.buttons = [{
			text: 'Copy',
			flex: 1,
			action: 'copy'
		},{
			text: 'Cancel',
			flex: 1,
			action: 'cancel'
		}]
		this.api = {
				submit: Ext.file.FileDefinition.copyUserFile
		}
		this.callParent(arguments);
		
	}
});