Ext.define('Form.view.file.uploadFileForm', { 
	extend: 'Ext.form.Panel',
	alias: 'widget.uploadfileform',
	width: 400, 
	height: '100%',
	autoScroll: true,
	buttonAlign: 'right',
	initComponent: function() {   
		this.items = [{
			xtype: 'hiddenfield',
			name: 'withFile',
			value: true
		},{
			xtype: 'hiddenfield',
			name: 'fileCount',
			value: 1
		},{
			xtype: 'hiddenfield',
			name: 'FOLDERID',
			value: ""
		},{
			xtype: 'filefield',
			padding: 10,
			allowBlank: false,
			name: 'file1',
			width: 350,
			fieldLabel: 'File 1'
		}];
		this.buttons = [{
			text: 'Insert file input',
			flex: 1,
			action: 'insertfileinput'
		},{
			text: 'Upload',
			flex: 1,
			action: 'upload'
		},{
			text: 'Cancel',
			flex: 1,
			action: 'cancel'
		}]
		this.api = {
				submit: Ext.file.FileDefinition.uploadUserFile
		}
		this.callParent(arguments);
		
	}
});