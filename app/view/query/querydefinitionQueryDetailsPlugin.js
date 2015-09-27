Ext.define('Form.view.query.querydefinitionQueryDetailsPlugin', { 
	extend: 'Ext.form.FieldSet',
	alias: 'widget.querydefinitionquerydetailsplugin',
	title: 'Plugin Details',
	collapsible: true,
	autoScroll: true,
	collapsed: true,
	action: 'grid',
	initComponent: function() {  
		
		this.defaults = {
				xtype: 'textfield',
				labelWidth: 150,
				padding: 5,
				width: 400
		};
		this.items = [{
			name: 'BLEADINGBUFFERZONE',
			action: 'bufferedrenderer bufferedrenderer-rowexpander',
			fieldLabel: 'Leading buffer zone',
			xtype: 'numberfield',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The number of extra rows to render on the leading side of scrolling outside the numFromEdge buffer as scrolling proceeds.\nDefaults to: 20"
		            });
		        }
		    },
		    width: 250,
		    value: 20,
		    maxValue: 1000
		},{
			name: 'BNUMFROMEDGE',
			action: 'bufferedrenderer bufferedrenderer-rowexpander',
			fieldLabel: 'Number from edge',
			xtype: 'numberfield',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The zone which causes new rows to be appended to the view. As soon as the edge of the rendered grid is this number of rows from the edge of the viewport, the view is moved.\nDefaults to: 8"
		            });
		        }
		    },
		    width: 250,
		    maxValue: 1000
		},{
			name: 'BSCROLLTOLOADBUFFER',
			action: 'bufferedrenderer bufferedrenderer-rowexpander',
			fieldLabel: 'Scroll to load buffer',
			xtype: 'numberfield',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "This is the time in milliseconds to buffer load requests when scrolling the PagingScrollbar.\nDefaults to: 200"
		            });
		        }
		    },
		    width: 250,
		    maxValue: 1000
		},{
			name: 'BTRAILINGBUFFERZONE',
			action: 'bufferedrenderer bufferedrenderer-rowexpander',
			fieldLabel: 'Trailing buffer zone',
			xtype: 'numberfield',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The number of extra rows to render on the trailing side of scrolling outside the numFromEdge buffer as scrolling proceeds.\nDefaults to: 10"
		            });
		        }
		    },
		    width: 250,
		    maxValue: 1000
		},{
			name: 'CELLEDITINGCLICKSTOEDIT',
			action: 'cellediting cellediting-rowexpander rowediting',
			fieldLabel: 'Clicks to edit',
			xtype: 'numberfield',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The number of clicks on a grid required to display the editor. The only accepted values are 1 and 2.\nDefaults to: 2"
		            });
		        }
		    },
		    width: 250,
		    maxValue: 10
		},{
			name: 'ROWCLICKSTOMOVEEDITOR',
			action: 'rowediting',
			fieldLabel: 'Clicks to move editor',
			xtype: 'numberfield',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The number of clicks to move the row editor to a new row while it is visible and actively editing another row. This will default to the same value as clicksToEdit."
		            });
		        }
		    },
		    width: 250,
		    maxValue: 10
		},{
			name: 'BSYNCHRONOUSRENDER',
			action: 'bufferedrenderer bufferedrenderer-rowexpander',
			fieldLabel: 'Synchronous render',
			xtype: 'combobox',
			queryMode: 'local',
			store: 'query.yesno', 
			displayField: 'yesnoname',
			valueField: 'yesnocode',
			width: 300,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "By default, on detection of a scroll event which brings the end of the rendered table within numFromEdge rows of the grid viewport, if the required rows are available in the Store, the BufferedRenderer will render rows from the Store immediately before returning from the event handler. This setting helps avoid the impression of whitespace appearing during scrolling.\n\nSet this to true to defer the render until the scroll event handler exits. This allows for faster scrolling, but also allows whitespace to be more easily scrolled into view.\n\nDefaults to: true"
		            });
		        }
		    }
		},{
			name: 'BVARIABLEROWHEIGHT',
			action: 'bufferedrenderer bufferedrenderer-rowexpander',
			fieldLabel: 'Variable row height',
			xtype: 'combobox',
			queryMode: 'local',
			store: 'query.yesno', 
			displayField: 'yesnoname',
			valueField: 'yesnocode',
			width: 300,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Configure as true if the row heights are not all the same height as the first row. Only configure this is needed - this will be if the rows contain unpredictably sized data, or you have changed the cell's text overflow stype to 'wrap'.\nDefaults to: false"
		            });
		        }
		    }
		},{
			name: 'ROWAUTOCANCEL',
			action: 'rowediting',
			fieldLabel: 'Row auto cancel',
			xtype: 'combobox',
			queryMode: 'local',
			store: 'query.yesno', 
			displayField: 'yesnoname',
			valueField: 'yesnocode',
			width: 300,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "true to automatically cancel any pending changes when the row editor begins editing a new row. false to force the user to explicitly cancel the pending changes.\nDefaults to: true"
		            });
		        }
		    }
		},{
			name: 'ROWERRORSUMMARY',
			action: 'rowediting',
			fieldLabel: 'Row error summary',
			xtype: 'combobox',
			queryMode: 'local',
			store: 'query.yesno', 
			displayField: 'yesnoname',
			valueField: 'yesnocode',
			width: 300,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "True to show a tooltip that summarizes all validation errors present in the row editor. Set to false to prevent the tooltip from showing.\nDefaults to: true"
		            });
		        }
		    }
		},{
			name: 'ROWEXPANDONDBLCLICK',
			action: 'rowexpander cellediting-rowexpander bufferedrenderer-rowexpander',
			fieldLabel: 'Expand on double click',
			xtype: 'combobox',
			queryMode: 'local',
			store: 'query.yesno', 
			displayField: 'yesnoname',
			valueField: 'yesnocode',
			width: 300,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "true to toggle a row between expanded/collapsed when double clicked (defaults to true).\nDefaults to: true"
		            });
		        }
		    }
		},{
			name: 'ROWEXPANDONENTER',
			action: 'rowexpander cellediting-rowexpander bufferedrenderer-rowexpander',
			fieldLabel: 'Expand on enter key',
			xtype: 'combobox',
			queryMode: 'local',
			store: 'query.yesno', 
			displayField: 'yesnoname',
			valueField: 'yesnocode',
			width: 300,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "true to toggle selected row(s) between expanded/collapsed when the enter key is pressed (defaults to true).\nDefaults to: true"
		            });
		        }
		    }
		},{
			name: 'ROWSELECTROWONEXPAND',
			action: 'rowexpander cellediting-rowexpander bufferedrenderer-rowexpander',
			fieldLabel: 'Select row on expand',
			xtype: 'combobox',
			queryMode: 'local',
			store: 'query.yesno', 
			displayField: 'yesnoname',
			valueField: 'yesnocode',
			width: 300,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "true to select a row when clicking on the expander icon (defaults to false).\nDefaults to: false"
		            });
		        }
		    }
		},{
			name: 'TRIGGEREVENT',
			action: 'cellediting cellediting-rowexpander',
			fieldLabel: 'Trigger event',
			maxLength: 15,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The event which triggers editing. Supercedes the clicksToEdit configuration. Maybe one of:\n\ncellclick\ncelldblclick\ncellfocus\nrowfocus"
		            });
		        }
		    }
		},{
			name: 'DDENABLEDRAG',
			action: 'cellediting rowediting rowexpander bufferedrenderer cellediting-rowexpander bufferedrenderer-rowexpander',
			fieldLabel: 'Enable drag',
			xtype: 'combobox',
			queryMode: 'local',
			store: 'query.yesno', 
			displayField: 'yesnoname',
			valueField: 'yesnocode',
			width: 300,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "false to disallow dragging items from the View.\nDefaults to: true"
		            });
		        }
		    }
		},{
			name: 'DDENABLEDROP',
			action: 'cellediting rowediting rowexpander bufferedrenderer cellediting-rowexpander bufferedrenderer-rowexpander',
			fieldLabel: 'Enable drop',
			xtype: 'combobox',
			queryMode: 'local',
			store: 'query.yesno', 
			displayField: 'yesnoname',
			valueField: 'yesnocode',
			width: 300,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "false to disallow the View from accepting drop gestures.\nDefaults to: true"
		            });
		        }
		    }
		},{
			name: 'HEADERRESIZER',
			action: 'cellediting rowediting rowexpander bufferedrenderer cellediting-rowexpander bufferedrenderer-rowexpander',
			fieldLabel: 'Dynamic',
			xtype: 'combobox',
			queryMode: 'local',
			store: 'query.yesno', 
			displayField: 'yesnoname',
			valueField: 'yesnocode',
			width: 300,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "True to resize on the fly rather than using a proxy marker.\nDefaults to: false"
		            });
		        }
		    }
		},{
			name: 'DDCONTAINERSCROLL',
			action: 'cellediting rowediting rowexpander bufferedrenderer cellediting-rowexpander bufferedrenderer-rowexpander',
			fieldLabel: 'Container scroll',
			maxLength: 20,
			xtype: 'combobox',
			queryMode: 'local',
			store: 'query.yesno', 
			displayField: 'yesnoname',
			valueField: 'yesnocode',
			width: 300,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "true to register this container with the Scrollmanager for auto scrolling during drag operations. A Ext.dd.ScrollManager configuration may also be passed.\nDefaults to: false"
		            });
		        }
		    }
		},{
			name: 'DDGROUP',
			action: 'cellediting rowediting rowexpander bufferedrenderer cellediting-rowexpander bufferedrenderer-rowexpander',
			fieldLabel: 'Drag and drop group',
			maxLength: 50,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "A named drag drop group to which this object belongs. If a group is specified, then both the DragZones and DropZone used by this plugin will only interact with other drag drop objects in the same group.\nDefaults to: \"GridDD\""
		            });
		        }
		    }
		},{
			name: 'DDDRAGGROUP',
			action: 'cellediting rowediting rowexpander bufferedrenderer cellediting-rowexpander bufferedrenderer-rowexpander',
			fieldLabel: 'Drag group',
			maxLength: 50,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The ddGroup to which the DragZone will belong.\nThis defines which other DropZones the DragZone will interact with. Drag\/DropZones only interact with other Drag\/DropZones which are members of the same ddGroup."
		            });
		        }
		    }
		},{
			name: 'DDDROPGROUP',
			action: 'cellediting rowediting rowexpander bufferedrenderer cellediting-rowexpander bufferedrenderer-rowexpander',
			fieldLabel: 'Drop group',
			maxLength: 50,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The ddGroup to which the DropZone will belong.\n\nThis defines which other DragZones the DropZone will interact with. Drag/DropZones only interact with other Drag/DropZones which are members of the same ddGroup."
		            });
		        }
		    }
		},{
			name: 'DDDRAGTEXT',
			action: 'cellediting rowediting rowexpander bufferedrenderer cellediting-rowexpander bufferedrenderer-rowexpander',
			fieldLabel: 'Drag text',
			maxLength: 100,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The text to show while dragging.\n\nTwo placeholders can be used in the text:\n\n{0} The number of selected items.\n{1} 's' when more than 1 items (only useful for English).\nDefaults to: '{0} selected row{1}'"
		            });
		        }
		    }
		},{
			name: 'BPLUGINID',
			action: 'cellediting rowediting rowexpander bufferedrenderer cellediting-rowexpander bufferedrenderer-rowexpander',
			fieldLabel: 'Plugin id',
			maxLength: 50,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "A name for the plugin that can be set at creation time to then retrieve the plugin through getPlugin method."
		            });
		        }
		    }
		},{
			name: 'CELLEDITINGLISTENER',
			anchor: '95%',
			action: 'cellediting rowediting cellediting-rowexpander bufferedrenderer-rowexpander',
			fieldLabel: 'Cell editing listener',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "A config object containing one or more event handlers to be added to this object during initialization. This should be a valid listeners config object as specified in the addListener example for attaching multiple handlers at once."
		            });
		        }
		    }
		},{
			name: 'PLUGINEXTRA',
			anchor: '95%',
			action: 'cellediting rowediting rowexpander bufferedrenderer cellediting-rowexpander bufferedrenderer-rowexpander',
			fieldLabel: 'Plugin extra properties',
			xtype: 'textareafield'
		}];
		this.callParent(arguments);
	}
});