Ext.define('Form.view.liveboard.liveboarditemdetailView', { 
	extend: 'Ext.form.Panel',
	alias: 'widget.liveboarditemdetailview',
	title: 'Liveboard Item Details',
	width: '100%', 
	height: '100%',
	autoScroll: true,
	initComponent: function() {   
		this.tbar = [{
		  	text: 'Liveboard List',
			action: 'lblist'
		},{
		  	text: 'Liveboard Items',
			action: 'lbitems'
	    },{
		  	text: 'Activate Code',
			action: 'lbactivate'
	    },{
		  	text: 'Deactivate Code',
			action: 'lbdeactivate'
	    },{
		  	text: 'Preview Liveboard',
			action: 'lbpreview'
	    }];
		this.defaults = {
				xtype: 'textfield',
				labelWidth: 150,
				margin: '10 10 0 50',
				padding: 7,
				width: '100%'
		};
		
		this.items = [{
			xtype: 'fieldset',
			columnWidth: 0.5,
			title: '',
			collapsible: true,
			layout: 'anchor',
			defaults: {
				xtype: 'textfield',
				labelWidth: 150,
				padding: 5,
				width: 400
			},
			items: [{
				fieldLabel: 'Action',
				readOnly: true,
				name: 'LBITEMTYPE',
				maxLength: 100
		    },{
				name: 'ITEMORDER',
				fieldLabel: 'Order',
				xtype: 'numberfield',
				width: 250,
				maxValue: 99999
			},{
				name: 'LIVEBOARDITEMCODE',
				hidden: true,
				fieldLabel: 'Liveboard Item Code',
				maxLength: 50
			},{
				name: 'LIVEBOARDCODE',
				readOnly: true,
				fieldLabel: 'Liveboard Code',
				maxLength: 50
			},{
				name: 'XTYPE',
				fieldLabel: 'Query Type',
				maxLength: 50,
				xtype: 'combobox', 
				store: 'liveboard.queryLookupStore',
				displayField: 'queryname',
				valueField: 'querycode',
				minChars: 1,
				pageSize: 27,
			},{
				name: 'ROWSPAN',
				fieldLabel: 'Row Span',
				xtype: 'numberfield',
				width: 250,
				maxValue: 99999
			},{
				name: 'COLSPAN',
				fieldLabel: 'Column Span',
				xtype: 'numberfield',
				width: 250,
				maxValue: 99999
			},{
				name: 'BODYSTYLE',
				maxLength: 255,
				fieldLabel: 'Body Style'
			},{
				name: 'CELLCLS',
				maxLength: 100,
				fieldLabel: 'Cell Class'
			},{
				name: 'HTML',
				fieldLabel: 'HTML'
			},{
				name: 'LIVEBOARDITEMEXTRA',
				fieldLabel: 'Liveboard Extra Properties ({})'
			}]
		}];
		
		this.api = {
				submit: Ext.liveboard.Form.SubmitItem // The server-side must mark the submit handler as an 'ExtFormHandler'
		};
		
		this.paramOrder = ['fieldcode'];
		
		this.buttons = [{
			text: 'Save',
			action: 'lbitemsave'
		},{
			text: 'Cancel',
			action: 'lbitemcancel'
		}];
		
		this.callParent(arguments);
	}
});