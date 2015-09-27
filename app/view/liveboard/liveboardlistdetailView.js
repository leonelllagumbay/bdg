Ext.define('Form.view.liveboard.liveboardlistdetailView', { 
	extend: 'Ext.form.Panel',
	alias: 'widget.liveboardlistdetailview',
	title: 'Liveboard List Detail',
	width: '100%', 
	height: '100%',
	autoScroll: true,
	initComponent: function() {  
		this.tbar = [{
		  	text: 'Liveboard',
			action: 'lblist'
		},{
		  	text: 'Activate',
			action: 'lbactivate'
	    },{
		  	text: 'Deactivate',
			action: 'lbdeactivate'
	    },{
		  	text: 'Preview',
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
			title: 'Basic config',
			collapsible: true,
			layout: 'anchor',
			defaults: {
				xtype: 'textfield',
				labelWidth: 150,
				padding: 5,
				width: 400
			},
			items: [{
				name: 'LIVEBOARDCODE',
				xtype: 'hiddenfield',
				allowBlank: true
			},{
				name: 'LBTYPE',
				xtype: 'textfield',
				readOnly: true,
				fieldLabel: 'Action Type',
				allowBlank: true
			},{
				name: 'LBSTATUS',
				xtype: 'displayfield',
				fieldLabel: 'Status',
				maxLength: 100,
				allowBlank: false,
				width: 700
			},{
				name: 'LBTITLE',
				xtype: 'textfield',
				fieldLabel: 'Title',
				maxLength: 100,
				allowBlank: false,
				width: 700
			},{
				name: 'LIVEBOARDDESC',
				xtype: 'textfield',
				fieldLabel: 'Description',
				maxLength: 250,
				allowBlank: true,
				width: 700
			},{
				name: 'WIDTH',
				fieldLabel: 'Width ( The width of this component in pixels )',
				xtype: 'numberfield',
				width: 250,
				maxValue: 99999
			},{
				name: 'HEIGHT',
				fieldLabel: 'Height ( The height of this component in pixels )',
				xtype: 'numberfield',
				width: 250,
				maxValue: 99999
			},{
				name: 'TABLECOLUMNS',
				xtype: 'numberfield',
				fieldLabel: 'Number of Columns',
				minValue: 1,
				value: 1,
				allowBlank: true,
				width: 250,
				listeners: {
			        afterrender: function(cmp) {
			            cmp.getEl().set({
			                "title": "The total number of columns to create in the table for this layout. If not specified, all Components added to this layout will be rendered into a single row using one column per Component."
			            });
			        }
			    }
			},{
				name: 'TABLEITEMCLS',
				xtype: 'textfield',
				fieldLabel: 'Table Item Class',
				maxLength: 250,
				allowBlank: true,
				width: 700,
				listeners: {
			        afterrender: function(cmp) {
			            cmp.getEl().set({
			                "title": "An optional extra CSS class that will be added to the container. This can be useful for adding customized styles to the container or any of its children using standard CSS rules. See Ext.Component.componentCls also."
			            });
			        }
			    }
			},{
				name: 'TABLEATTRS',
				xtype: 'textfield',
				fieldLabel: 'Table Attributes',
				maxLength: 200,
				allowBlank: true,
				width: 700,
				listeners: {
			        afterrender: function(cmp) {
			            cmp.getEl().set({
			                "title": "An object containing properties which are added to the DomHelper specification used to create the layout's <table> element. Example:\n\ntableAttrs: {\n style: {\n width: '100%'\n}\n}"
			            });
			        }
			    }
			},{
				name: 'TABLETDATTRS',
				xtype: 'textfield',
				fieldLabel: 'Table td Attributes',
				maxLength: 200,
				allowBlank: true,
				width: 700,
				listeners: {
			        afterrender: function(cmp) {
			            cmp.getEl().set({
			                "title": "An object containing properties which are added to the DomHelper specification used to create the layout's <td> elements."
			            });
			        }
			    }
			},{
				name: 'TABLETRATTRS',
				xtype: 'textfield',
				fieldLabel: 'Table tr Attributes',
				maxLength: 200,
				allowBlank: true,
				width: 700,
				listeners: {
			        afterrender: function(cmp) {
			            cmp.getEl().set({
			                "title": "An object containing properties which are added to the DomHelper specification used to create the layout's <tr> elements."
			            });
			        }
			    }
			},{
				name: 'LBLAYOUTEXTRA',
				action: 'grid',
				xtype: 'textareafield',
				width: 800,
				height: 200,
				fieldLabel: 'Liveboard Layout Extra',
			},{
				name: 'LBEXTRA',
				action: 'grid',
				xtype: 'textareafield',
				width: 800,
				height: 200,
				fieldLabel: 'Liveboard Panel Extra',
				 
			}]
		}];
		
		this.api = {
				load: Ext.liveboard.Form.Load,
				submit: Ext.liveboard.Form.Submit // The server side must mark the submit handler as an 'ExtFormHandler'
		};
		
		this.paramOrder = ['liveboardcode'];
		
		this.buttons = [{
			text: 'Save',
			action: 'lbsave'
		},{
			text: 'Cancel',
			action: 'lbcancel'
		}];
		
		this.callParent(arguments);
	}
});