Ext.define('Form.view.query.querydefinitionQueryDetailsChart', { 
	extend: 'Ext.form.FieldSet',
	alias: 'widget.querydefinitionquerydetailschart',
	title: 'Chart Label and Legend',
	collapsible: true,
	autoScroll: true,
	initComponent: function() {  
		
		this.defaults = {
				xtype: 'textfield',
				labelWidth: 150,
				padding: 5,
				width: 400
		};
		this.items = [{
			name: 'CHARTLABEL',
			fieldLabel: 'Label',
			hidden: true,
			xtype: 'textareafield',
			maxLength: 60,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Object with the following properties:\n\ndisplay : String - Specifies the presence and position of the labels.\n\nstackedDisplay : String - The type of label we want to display as a summary on a stacked bar or a stacked column. If set to 'total', the total amount of all the stacked values is displayed on top of the column. If set to 'balances', the total amount of the positive values is displayed on top of the column and the total amount of the negative values is displayed at the bottom.\n\ncolor : String - The color of the label text.\n\ncontrast : Boolean - True to render the label in contrasting color with the backround of a column in a Bar chart or of a slice in a Pie chart.\n\nfield : String|String[] - The name(s) of the field(s) to be displayed in the labels.\n\nminMargin : Number - Specifies the minimum distance from a label to the origin of the visualization.\n\nfont : String - The font used for the labels.\n\norientation : String - Either \"horizontal\" or \"vertical\".\n\nrenderer : Function"
		            });
		        }
		    }
		},{
			name: 'VISIBLE',
			fieldLabel: 'Visible',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Whether or not the legend should be displayed.\nDefaults to: true"
		            });
		        }
		    },
		    xtype: 'combobox',
			queryMode: 'local',
			store: 'query.yesno', 
			displayField: 'yesnoname',
			valueField: 'yesnocode',
			width: 300
		},{
			name: 'BOXFILL',
			fieldLabel: 'Box fill',
			maxLength: 10,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Fill style for the legend box\nDefaults to: '#FFF'"
		            });
		        }
		    }
		},{
			name: 'BOXSTROKE',
			fieldLabel: 'Box stroke',
			maxLength: 10,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Style of the stroke for the legend box\nDefaults to: '#000'"
		            });
		        }
		    }
		},{
			name: 'BOXSTROKEWIDTH',
			fieldLabel: 'Box stroke width',
			width: 200,
			maxLength: 2,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Width of the stroke for the legend box\nDefaults to: 1"
		            });
		        }
		    }
		},{
			name: 'BOXZINDEX',
			fieldLabel: 'Box z-index',
			xtype: 'numberfield',
			width: 250,
			maxValue: 999,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Sets the z-index for the legend. Defaults to 100.\nDefaults to: 100"
		            });
		        }
		    }
		},{
			name: 'ITEMSPACING',
			fieldLabel: 'Item spacing',
			xtype: 'numberfield',
			width: 250,
			maxValue: 999,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Sets the z-index for the legend. Defaults to 100.\nDefaults to: 100"
		            });
		        }
		    }
		},{
			name: 'LABELCOLOR',
			fieldLabel: 'Label color',
			maxLength: 10,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Color to be used for the legend labels, eg '#000'\nDefaults to: '#000'"
		            });
		        }
		    }
		},{
			name: 'LABELFONT',
			fieldLabel: 'Label font',
			maxLength: 50,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Font to be used for the legend labels, eg '12px Helvetica'\nDefaults to: '12px Helvetica, sans-serif'"
		            });
		        }
		    }
		},{
			fieldLabel: 'Position',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Amount of padding between the legend box's border and its items\nDefaults to: 5"
		            });
		        }
		    },
		    xtype: 'radiogroup',
			columns: 4,
		    items: [{
		    	boxLabel: 'left',
		    	name: 'LEGENDPOSITION',
			    inputValue: 'left'
		    },{
		    	boxLabel: 'right',
		    	name: 'LEGENDPOSITION',
			    inputValue: 'right'
		    },{
		    	boxLabel: 'top',
		    	name: 'LEGENDPOSITION',
			    inputValue: 'top'
		    },{
		    	boxLabel: 'bottom',
		    	name: 'LEGENDPOSITION',
			    inputValue: 'bottom'
		    }]
		},{
			name: 'CHARTUPDATE',
			fieldLabel: 'Update',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "If set to true the legend will be refreshed when the chart is. This is useful to update the legend items if series are added/removed/updated from the chart. Default is true.\nDefaults to: true"
		            });
		        }
		    },
		    xtype: 'combobox',
			queryMode: 'local',
			store: 'query.yesno', 
			displayField: 'yesnoname',
			valueField: 'yesnocode',
			width: 300
		},{
			name: 'X',
			fieldLabel: 'X',
			xtype: 'numberfield',
			maxValue: 9999,
			width: 250,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "X-position of the legend box. Used directly if position is set to \"float\", otherwise it will be calculated dynamically.\nDefaults to: 0"
		            });
		        }
		    }
		},{
			name: 'Y',
			fieldLabel: 'Y',
			xtype: 'numberfield',
			maxValue: 9999,
			width: 250,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Y-position of the legend box. Used directly if position is set to \"float\", otherwise it will be calculated dynamically.\nDefaults to: 0"
		            });
		        }
		    }
		},{
			name: 'ALLOWFUNCTIONS',
			fieldLabel: 'Allow functions',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Configure as true if the addAll function should add function references to the collection."
		            });
		        }
		    },
		    xtype: 'combobox',
			queryMode: 'local',
			store: 'query.yesno', 
			displayField: 'yesnoname',
			valueField: 'yesnocode',
			width: 300
		},{
			fieldLabel: 'Default sort direction',
			maxLength: 4,
			xtype: 'radiogroup',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The default sort direction to use if one is not specified.\nDefaults to: \"ASC\""
		            });
		        }
		    },
			columns: 4,
		    items: [{
		    	boxLabel: 'ASC',
		    	name: 'DEFAULTSORTDIRECTION',
			    inputValue: 'ASC'
		    },{
		    	boxLabel: 'DESC',
		    	name: 'DEFAULTSORTDIRECTION',
			    inputValue: 'DESC'
		    }]
			
		},{
			name: 'LEGENDITEMLISTENERS',
			fieldLabel: 'Legend item listeners',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "A config object containing one or more event handlers to be added to this object during initialization. This should be a valid listeners config object as specified in the addListener example for attaching multiple handlers at once."
		            });
		        }
		    }
		},{
			name: 'SORTROOT',
			fieldLabel: 'Sort root',
			maxLength: 50,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The property in each item that contains the data to sort."
		            });
		        }
		    }
		},{
			name: 'SORTERS',
			fieldLabel: 'Sorters',
			maxLength: 100,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The initial set of Sorters.\n\nExt.util.Sorter[]/Object[]"
		            });
		        }
		    }
		},{
			name: 'MASK',
			fieldLabel: 'Mask',
			maxLength: 15,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Enables selecting a region on chart. True to enable any selection, 'horizontal' or 'vertical' to restrict the selection to X or Y axis.\n\nThe mask in itself will do nothing but fire 'select' event. See Ext.chart.Mask for example."
		            });
		        }
		    },
		    xtype: 'combobox',
			queryMode: 'local',
			store: 'query.yesno', 
			displayField: 'yesnoname',
			valueField: 'yesnocode',
			width: 300
		},{
			name: 'CHARTEXTRA',
			fieldLabel: 'Chart extra properties',
			xtype: 'textareafield',
			width: 700
		}];
		this.callParent(arguments);
	}
});