Ext.define('Form.view.administrator.organizationDetailView', { 
	extend: 'Ext.form.Panel',
	alias: 'widget.organizationdetailview',
	title: 'Organization Details',
	width: '100%', 
	height: '100%',
	autoScroll: true,
	initComponent: function() {   
		this.tbar = [{
		  	text: 'Back',
			action: 'backtoorgdetail'
		}];
		this.defaults = {
				xtype: 'textfield',
				labelWidth: 150,
				margin: '10 10 0 50',
				padding: 7,
				width: '100%'
		};
		
		this.items = [{
			fieldLabel: 'Hello'
		}];
		
		/*this.api = {
				load: Ext.qd.Form.LoadColumnDetail,
				submit: Ext.qd.Form.SubmitColumnDetail // The server-side must mark the submit handler as an 'ExtFormHandler'
		};
		
		this.paramOrder = ['fieldcode'];*/
		
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