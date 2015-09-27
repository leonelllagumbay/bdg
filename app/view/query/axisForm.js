Ext.define('Form.view.query.axisForm', { 
	extend: 'Ext.form.Panel',
	alias: 'widget.axisform',
	width: 500,
	height: 500,
	autoScroll: true,
	initComponent: function() {  
		
		this.defaults = {
				xtype: 'textfield',
				labelWidth: 150,
				padding: 5,
				width: 400
		};
		this.items = [{
			name: 'CHARTAXISCODE',
			hidden: true,
			fieldLabel: 'Chart Axis Code'
		},{
			name: 'EQRYCODEFK',
			hidden: true,
			fieldLabel: 'Query Code Fk'
		},{
			name: 'AXISTYPE',
			fieldLabel: 'Axis type',
			allowBlank: false,
			xtype: 'combobox',
			queryMode: 'local',
			store: 'query.axisTypeStore', 
			displayField: 'axistypename',
			valueField: 'axistypecode',
			forceSelection: true,
			editable: false
		},{
			fieldLabel: 'Axis position',
			action: 'Category gauge Numeric Time Radial',
			maxLength: 10,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Where to set the axis. Available options are left, bottom, right, top. Default's bottom.\nDefaults to: 'bottom'"
		            });
		        }
		    },
		    allowBlank: false,
		    xtype: 'radiogroup',
			columns: 3,
		    items: [{
		    	boxLabel: 'top',
		    	name: 'POSITION',
			    inputValue: 'top'
		    },{
		    	boxLabel: 'right',
		    	name: 'POSITION',
			    inputValue: 'right'
		    },{
		    	boxLabel: 'bottom',
		    	name: 'POSITION',
			    inputValue: 'bottom'
		    },{
		    	boxLabel: 'left',
		    	name: 'POSITION',
			    inputValue: 'left'
		    },{
		    	boxLabel: 'gauge',
		    	name: 'POSITION',
			    inputValue: 'gauge'
		    },{
		    	boxLabel: 'radial',
		    	name: 'POSITION',
			    inputValue: 'radial'
		    }]
		},{
			name: 'TITLE',
			action: 'Category gauge Numeric Radial Time',
			allowBlank: false,
			fieldLabel: 'Axis title',
			maxLength: 50,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The title for the Axis"
		            });
		        }
		    }
		},{
			xtype: 'combobox',
			labelWidth: 150,
			flex: 4,
			editable: false,
			forceSelection: true,
			fieldLabel: 'Fields',
			name: 'DUMMYFIELDS',
			store: 'query.queryColumnNameStore',
			queryMode: 'remote',
			valueField: 'querycolumncode',
			displayField: 'querycolumnname',
			minChars: 1,
			queryMode: 'remote',
			maxLength: 95,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Select fields to add to the array of fields."
		            });
		        }
		    }
		},{
			name: 'FIELDS',
			allowBlank: false,
			action: 'Category gauge Numeric Radial Time',
			fieldLabel: ' ',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The fields of model to bind to this axis.\n\nFor example if you have a data set of lap times per car, each having the fields: 'carName', 'avgSpeed', 'maxSpeed'. Then you might want to show the data on chart with ['carName'] on Name axis and ['avgSpeed', 'maxSpeed'] on Speed axis."
		            });
		        }
		    }
		},{
			name: 'GRID',
			action: 'Category gauge Numeric Radial Time',
			fieldLabel: 'Grid',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The grid configuration enables you to set a background grid for an axis. If set to true on a vertical axis, vertical lines will be drawn. If set to true on a horizontal axis, horizontal lines will be drawn. If both are set, a proper grid with horizontal and vertical lines will be drawn.\n\nYou can set specific options for the grid configuration for odd and/or even lines/rows. Since the rows being drawn are rectangle sprites, you can set to an odd or even property all styles that apply to Ext.draw.Sprite. For more information on all the style properties you can set please take a look at Ext.draw.Sprite. Some useful style properties are opacity, fill, stroke, stroke-width, etc.\n\nThe possible values for a grid option are then true, false, or an object with { odd, even } properties where each property contains a sprite style descriptor object that is defined in Ext.draw.Sprite."
		            });
		        }
		    }
		},{
			name: 'ADJUSTEND',
			action: 'Category gauge Numeric Radial Time',
			fieldLabel: 'Adjust end',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Whether to adjust the label at the end of the axis.\nDefaults to: true"
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
			name: 'DASHSIZE',
			action: 'Category gauge Numeric Radial Time',
			fieldLabel: 'Dash size',
			maxValue: 999,
			xtype: 'numberfield',
			width: 250,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The size of the dash marker. Default's 3.\nDefaults to: 3"
		            });
		        }
		    }
		},{
			name: 'HIDDEN',
			action: 'Category gauge Numeric Radial Time',
			fieldLabel: 'Hidden',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "true to hide the axis.\nDefaults to: false"
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
			name: 'LABEL',
			action: 'Category gauge Numeric Radial Time',
			fieldLabel: 'Axis Label',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The config for chart label.\n\nObject with the following properties:\n\ndisplay : String - Specifies the presence and position of the labels.\n\nstackedDisplay : String - The type of label we want to display as a summary on a stacked bar or a stacked column. If set to 'total', the total amount of all the stacked values is displayed on top of the column. If set to 'balances', the total amount of the positive values is displayed on top of the column and the total amount of the negative values is displayed at the bottom.\n\ncolor : String - The color of the label text.\n\ncontrast : Boolean - True to render the label in contrasting color with the backround of a column in a Bar chart or of a slice in a Pie chart.\n\nfield : String|String[] - The name(s) of the field(s) to be displayed in the labels.\n\nminMargin : Number - Specifies the minimum distance from a label to the origin of the visualization.\n\nfont : String - The font used for the labels.\n\norientation : String - Either \"horizontal\" or \"vertical\".\n\nrenderer : Function"
		            });
		        }
		    }
		},{
			name: 'LENGTH',
			action: 'Category gauge Numeric Radial Time',
			fieldLabel: 'Length',
			maxValue: 999,
			xtype: 'numberfield',
			width: 250,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Offset axis position. Default's 0.\nDefaults to: 0"
		            });
		        }
		    }
		},{
			name: 'MAJORTICKSTEPS',
			action: 'Category gauge Numeric Radial Time',
			fieldLabel: 'Major tick steps',
			maxValue: 999,
			xtype: 'numberfield',
			width: 250,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "If minimum and maximum are specified it forces the number of major ticks to the specified value. If a number of major ticks is forced, it wont search for pretty numbers at the ticks."
		            });
		        }
		    }
		},{
			name: 'MINORTICKSTEPS',
			action: 'Category gauge Numeric Radial Time',
			fieldLabel: 'Minor tick steps',
			maxValue: 999,
			xtype: 'numberfield',
			width: 250,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The number of small ticks between two major ticks. Default is zero."
		            });
		        }
		    }
		},{
			name: 'WIDTH',
			action: 'Category gauge Numeric Radial Time',
			fieldLabel: 'Axis width',
			maxValue: 999,
			xtype: 'numberfield',
			width: 250,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Offset axis width. Default's 0.\nDefaults to: 0"
		            });
		        }
		    }
		},{
			name: 'CALCULATECATEGORYCOUNT',
			action: 'Category',
			fieldLabel: 'Calculate category count',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Indicates whether or not to calculate the number of categories (ticks and labels) when there is not enough room to display all labels on the axis. If set to true, the axis will determine the number of categories to plot. If not, all categories will be plotted.\nDefaults to: false"
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
			name: 'CATEGORYNAMES',
			action: 'Category',
			fieldLabel: 'Category names',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "A list of category names to display along this axis."
		            });
		        }
		    }
		},{
			name: 'MARGIN',
			action: 'gauge',
			fieldLabel: 'Axis margin',
			maxValue: 999,
			xtype: 'numberfield',
			width: 250,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The offset positioning of the tick marks and labels in pixels.\nDefaults to: 10"
		            });
		        }
		    }
		},{
			name: 'ADJUSTMAXIMUMBYMAJORUNIT',
			action: 'Numeric Radial Time',
			fieldLabel: 'Adjust maximum by major unit',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Indicates whether to extend maximum beyond data's maximum to the nearest majorUnit.\nDefaults to: false"
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
			name: 'ADJUSTMINIMUMBYMAJORUNIT',
			action: 'Numeric Radial Time',
			fieldLabel: 'Adjust minimum by major unit',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Indicates whether to extend the minimum beyond data's minimum to the nearest majorUnit.\nDefaults to: false"
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
			name: 'CONSTRAIN',
			action: 'Numeric Radial Time',
			fieldLabel: 'Constrain',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "If true, the values of the chart will be rendered only if they belong between minimum and maximum. If false, all values of the chart will be rendered, regardless of whether they belong between minimum and maximum or not. Default's true if maximum and minimum is specified. It is ignored for stacked charts.\nDefaults to: true"
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
			name: 'DECIMALS',
			action: 'Numeric Radial Time',
			fieldLabel: 'Decimals',
			maxValue: 999,
			xtype: 'numberfield',
			width: 250,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The number of decimals to round the value to.\nDefaults to: 2"
		            });
		        }
		    }
		},{
			name: 'MAXIMUM',
			action: 'gauge Numeric Radial Time',
			fieldLabel: 'Maximum',
			maxValue: 9999999,
			xtype: 'numberfield',
			width: 250,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The maximum value drawn by the axis. If not set explicitly, the axis maximum will be calculated automatically. It is ignored for stacked charts."
		            });
		        }
		    }
		},{
			name: 'MINIMUM',
			action: 'gauge Numeric Radial Time',
			fieldLabel: 'Minimum',
			maxValue: 9999999,
			xtype: 'numberfield',
			width: 250,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The minimum value drawn by the axis. If not set explicitly, the axis minimum will be calculated automatically. It is ignored for stacked charts."
		            });
		        }
		    }
		},{
			name: 'FROMDATE',
			action: 'Time',
			fieldLabel: 'From date',
			xtype: 'datefield',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The starting date for the time axis.\nDefaults to: false"
		            });
		        }
		    }
		},{
			name: 'STEPS',
			action: 'gauge Time',
			fieldLabel: 'Steps',
			maxLength: 50,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "An array with two components: The first is the unit of the step (day, month, year, etc). The second one is a number. If the number is an integer, it represents the number of units for the step ([Ext.Date.DAY, 2] means \"Every other day\"). If the number is a fraction, it represents the number of steps per unit ([Ext.Date.DAY, 1/2] means \"Twice a day\"). If the unit is the month, the steps may be adjusted depending on the month. For instance [Ext.Date.MONTH, 1/3], which means \"Three times a month\", generates steps on the 1st, the 10th and the 20th of every month regardless of whether a month has 28 days or 31 days. The steps are generated as follows: - [Ext.Date.MONTH, n]: on the current date every 'n' months, maxed to the number of days in the month. - [Ext.Date.MONTH, 1/2]: on the 1st and 15th of every month. - [Ext.Date.MONTH, 1/3]: on the 1st, 10th and 20th of every month. - [Ext.Date.MONTH, 1/4]: on the 1st, 8th, 15th and 22nd of every month."
		            });
		        }
		    }
		},{
			name: 'TODATE',
			action: 'Time',
			fieldLabel: 'To date',
			xtype: 'datefield',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The ending date for the time axis.\nDefaults to: false"
		            });
		        }
		    }
		},{
			name: 'DATEFORMAT',
			action: 'Time',
			fieldLabel: 'Date format',
			maxLength: 30,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Indicates the format the date will be rendered on. For example: 'M d' will render the dates as 'Jan 30', etc. For a list of possible format strings see Date\nDefaults to: false\n\nd -- Day of the month, 2 digits with leading zeros -- 01 to 31\nD -- A short textual representation of the day of the week -- Mon to Sun ..."
		            });
		        }
		    }
		},{
			name: 'AXISEXTRA',
			fieldLabel: 'Axis extra',
			xtype: 'textareafield'
		}];
		
		this.api = {
				submit: Ext.qd.Chart.AxisSubmit // The server side must mark the submit handler as an 'ExtFormHandler'
		};
		
		this.paramOrder = ['querycode'];
		
		this.buttons = [{
			text: 'Add',
			action: 'add'
		},{
			text: 'Save',
			action: 'save'
		}];
		
		this.callParent(arguments);
	}
});