Ext.define('Form.store.form.fieldtypestore', {
	extend: 'Ext.data.Store',
	model: 'Form.model.form.fieldtypemodel',
	data: [{
		fieldtypename: 'Text',
		fieldtypecode: 'textfield'
	},{
		fieldtypename: 'Date',
		fieldtypecode: 'datefield'
	},{
		fieldtypename: 'Time',
		fieldtypecode: 'timefield'
	},{
		fieldtypename: 'Number',
		fieldtypecode: 'numberfield'
	},{
		fieldtypename: 'Check Box',
		fieldtypecode: 'checkboxgroup'
	},{
		fieldtypename: 'Radio',
		fieldtypecode: 'radiogroup'
	},{
		fieldtypename: 'Text Area',
		fieldtypecode: 'textareafield' 
	},{
		fieldtypename: 'Html Editor',
		fieldtypecode: 'htmleditor' 
	},{
		fieldtypename: 'Display',
		fieldtypecode: 'displayfield' 
	},{
		fieldtypename: 'Combo Box',
		fieldtypecode: 'combobox'  
	},{
		fieldtypename: 'File',
		fieldtypecode: 'filefield'  
	},{
		fieldtypename: 'Directory',
		fieldtypecode: 'directoryfield' 
	},{
		fieldtypename: 'Hidden',
		fieldtypecode: 'hiddenfield' 
	},{
		fieldtypename: 'ID',
		fieldtypecode: 'id' 
	},{
		fieldtypename: 'Grid',
		fieldtypecode: 'grid'  
	},{
		fieldtypename: 'Signature',
		fieldtypecode: 'signature'  
	},{
		fieldtypename: 'Comment',
		fieldtypecode: 'commentfield'  
	}]	
});
