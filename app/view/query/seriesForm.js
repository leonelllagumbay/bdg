Ext.define('Form.view.query.seriesForm', { 
	extend: 'Ext.form.Panel',
	alias: 'widget.seriesform',
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
			name: 'CHARTSERIESCODE',
			hidden: true,
			fieldLabel: 'Chart Series Code'
		},{
			name: 'EQRYCODEFK',
			hidden: true,
			fieldLabel: 'Query Code Fk'
		},{
			name: 'TYPE',
			allowBlank: false,
			fieldLabel: 'Series type',
			maxLength: 20,
			xtype: 'combobox',
			queryMode: 'local',
			store: 'query.seriesTypeStore', 
			displayField: 'seriestypename',
			valueField: 'seriestypecode',
			forceSelection: true,
			editable: false,
			value: 'area',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "End Definitions\nThe type of series. Set in subclasses.\n\nDefaults to: 'area'"
		            });
		        }
		    }
		},{
			fieldLabel: 'Series axis',
			allowBlank: false,
			maxLength: 6,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The position of the axis to bind the values to. Possible values are 'left', 'bottom', 'top' and 'right'. You must explicitly set this value to bind the values of the line series to the ones in the axis, otherwise a relative scale will be used. For example, if you're using a Scatter or Line series and you'd like to have the values in the chart relative to the bottom and left axes then axis should be ['left', 'bottom'].\nDefaults to: 'left'"
		            });
		        }
		    },
		    xtype: 'radiogroup',
			columns: 4,
		    items: [{
		    	boxLabel: 'top',
		    	name: 'AXIS',
			    inputValue: 'top'
		    },{
		    	boxLabel: 'right',
		    	name: 'AXIS',
			    inputValue: 'right'
		    },{
		    	boxLabel: 'bottom',
		    	name: 'AXIS',
			    inputValue: 'bottom'
		    },{
		    	boxLabel: 'left',
		    	name: 'AXIS',
			    inputValue: 'left'
		    }]
		},{
			name: 'HIGHLIGHT',
			fieldLabel: 'Highlight',
			maxLength: 250,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "If set to true it will highlight the markers or the series when hovering with the mouse. This parameter can also be an object with the same style properties you would apply to a Ext.draw.Sprite to apply custom styles to markers and series."
		            });
		        }
		    }
		},{
			xtype: 'combobox',
			labelWidth: 150,
			flex: 4,
			actiontag: 'XFIELD',
			action: 'area bar column line pie radar scatter',
			editable: false,
			forceSelection: true,
			fieldLabel: 'X Fields',
			name: 'XSERIESDUMMYFIELDS',
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
		                "title": "Select series fields to add to the array of x fields."
		            });
		        }
		    }
		},{
			name: 'XFIELD',
			action: 'area bar column line pie radar scatter',
			fieldLabel: ' ',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The name of the data Model field corresponding to the x-axis value."
		            });
		        }
		    }
		},{
			xtype: 'combobox',
			labelWidth: 150,
			actiontag: 'YFIELD',
			action: 'area bar column line radar scatter',
			flex: 4,
			editable: false,
			forceSelection: true,
			fieldLabel: 'Y Fields',
			name: 'YSERIESDUMMYFIELDS',
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
		                "title": "Select series fields to add to the array of y fields."
		            });
		        }
		    }
		},{
			name: 'YFIELD',
			action: 'area bar column line radar scatter',
			fieldLabel: ' ',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The name(s) of the data Model field(s) corresponding to the y-axis value(s)."
		            });
		        }
		    }
		},{
			name: 'LABEL',
			fieldLabel: 'Series Label',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "See chart label"
		            });
		        }
		    }
		},{
			name: 'LISTENERS',
			fieldLabel: 'Series listeners',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "An (optional) object with event callbacks. All event callbacks get the target item as first parameter. The callback functions are:\n\nitemclick\nitemmouseover\nitemmouseout\nitemmousedown\nitemmouseup"
		            });
		        }
		    }
		},{
			name: 'RENDERER',
			fieldLabel: 'Renderer',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "A function that can be overridden to set custom styling properties to each rendered element. Passes in (sprite, record, attributes, index, store) to the function."
		            });
		        }
		    }
		},{
			name: 'SHADOWATTRIBUTES',
			fieldLabel: 'Shadow attributes',
			maxLength: 150,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "An array with shadow attributes"
		            });
		        }
		    }
		},{
			name: 'SHOWINLEGEND',
			fieldLabel: 'Show in legend',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Whether to show this series in the legend.\nDefaults to: true"
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
			name: 'STYLE',
			fieldLabel: 'Series style',
			maxLength: 250,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Append styling properties to this object for it to override theme properties.\nDefaults to: {}"
		            });
		        }
		    }
		},{
			name: 'TIPS',
			fieldLabel: 'Tips',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Add tooltips to the visualization's markers. The options for the tips are the same configuration used with Ext.tip.ToolTip. For example:\ntips: {\ntrackMouse: true,\nwidth: 140,\nheight: 28,\nrenderer: function(storeItem, item) {\nthis.setTitle(storeItem.get('name') + ': ' + storeItem.get('data1') + ' views');\n}\n},"
		            });
		        }
		    }
		},{
			name: 'TITLE',
			fieldLabel: 'Series title',
			maxLength: 50,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The human-readable name of the series."
		            });
		        }
		    }
		},{
			name: 'COLUMN',
			action: 'bar column',
			fieldLabel: 'Series column',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Whether to set the visualization as column chart or horizontal bar chart.\nDefaults to: true"
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
			name: 'GROUPGUTTER',
			action: 'bar column',
			fieldLabel: 'Group gutter',
			xtype: 'numberfield',
			width: 250,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The gutter space between groups of bars, as a percentage of the bar width\nDefaults to: 38.2"
		            });
		        }
		    }
		},{
			name: 'GUTTER',
			action: 'bar column',
			fieldLabel: 'Gutter',
			xtype: 'numberfield',
			width: 250,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The gutter space between single bars, as a percentage of the bar width\nDefaults to: 38.2"
		            });
		        }
		    }
		},{
			name: 'STACKED',
			action: 'bar column',
			fieldLabel: 'Stacked',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "If set to true then bars for multiple yField values will be rendered stacked on top of one another. Otherwise, they will be rendered side-by-side. Defaults to false."
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
			name: 'XPADDING',
			action: 'bar column',
			fieldLabel: 'X padding',
			maxLength: 25,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Padding between the left/right axes and the bars. The possible values are a number (the number of pixels for both left and right padding) or an object with { left, right } properties.\n\nDefaults to: 10"
		            });
		        }
		    }
		},{
			name: 'YPADDING',
			action: 'bar column',
			fieldLabel: 'Y padding',
			maxLength: 25,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Padding between the top/bottom axes and the bars. The possible values are a number (the number of pixels for both top and bottom padding) or an object with { top, bottom } properties.\n\nDefaults to: 0"
		            });
		        }
		    }
		},{
			name: 'ANGLEFIELD',
			action: 'gauge pie',
			fieldLabel: 'Angle field',
			maxLength: 25,
			xtype: 'combobox',
			store: 'query.queryColumnNameStore',
			queryMode: 'remote',
			valueField: 'querycolumncode',
			displayField: 'querycolumnname',
			minChars: 1,
			queryMode: 'remote',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The store record field name to be used for the pie angles. The values bound to this field name must be positive real numbers.\nDefaults to: false"
		            });
		        }
		    }
		},{
			name: 'DONUT',
			action: 'gauge pie',
			fieldLabel: 'Donut',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Use the entire disk or just a fraction of it for the gauge. Default's false.\nDefaults to: false"
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
			name: 'HIGHLIGHTDURATION',
			action: 'gauge pie',
			fieldLabel: 'Highlight duration',
			maxValue: 9999,
			xtype: 'numberfield',
			width: 250,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The duration for the pie slice highlight effect.\nDefaults to: 150"
		            });
		        }
		    }
		},{
			name: 'NEEDLE',
			action: 'gauge',
			fieldLabel: 'Needle',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Use the Gauge Series as an area series or add a needle to it. Default's false.\nDefaults to: false"
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
			name: 'FILL',
			action: 'line',
			fieldLabel: 'Fill',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "If true, the area below the line will be filled in using the eefill and opacity config properties. Defaults to false.\nDefaults to: false"
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
			name: 'MARKERCONFIG',
			action: 'line radar scatter',
			fieldLabel: 'Marker config',
			maxLength: 100,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The display style for the markers. Only used if showMarkers is true. The markerConfig is a configuration object containing the same set of properties defined in the Sprite class. For example, if we were to set red circles as markers to the line series we could pass the object:\n\nmarkerConfig: {\ntype: 'circle',\nradius: 4,\n'fill': '#f00'\n}\n\nDefaults to: {}"
		            });
		        }
		    }
		},{
			name: 'SELECTIONTOLERANCE',
			action: 'line',
			fieldLabel: 'Selection tolerance',
			maxValue: 999,
			xtype: 'numberfield',
			width: 250,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The offset distance from the cursor position to the line series to trigger events (then used for highlighting series, etc).\nDefaults to: 20"
		            });
		        }
		    }
		},{
			name: 'SHOWMARKERS',
			action: 'line radar',
			fieldLabel: 'Show markers',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Whether markers should be displayed at the data points along the line. If true, then the markerConfig config item will determine the markers' styling.\nDefaults to: true"
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
			name: 'SMOOTH',
			action: 'line',
			fieldLabel: 'Smooth',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "If set to true or a non-zero number, the line will be smoothed/rounded around its points; otherwise straight line segments will be drawn.\nA numeric value is interpreted as a divisor of the horizontal distance between consecutive points in the line; larger numbers result in sharper curves while smaller numbers result in smoother curves.\nIf set to true then a default numeric value of 3 will be used. Defaults to false.\nDefaults to: false"
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
			name: 'COLORSET',
			action: 'pie gauge',
			fieldLabel: 'Color set',
			maxLength: 250,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "An array of color values which will be used, in order, as the pie slice fill colors."
		            });
		        }
		    }
		},{
			name: 'FIELD',
			action: 'pie gauge',
			fieldLabel: 'Angle field alias or gauge field',
			maxLength: 50,
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "Alias for angleField."
		            });
		        }
		    }
		},{
			name: 'LENGTHFIELD',
			action: 'pie gauge',
			fieldLabel: 'Length field',
			maxLength: 50,
			xtype: 'combobox',
			store: 'query.queryColumnNameStore',
			queryMode: 'remote',
			valueField: 'querycolumncode',
			displayField: 'querycolumnname',
			minChars: 1,
			queryMode: 'remote',
			listeners: {
		        afterrender: function(cmp) {
		            cmp.getEl().set({
		                "title": "The store record field name to be used for the pie slice lengths. The values bound to this field name must be positive real numbers.Defaults to: false"
		            });
		        }
		    }
		},{
			name: 'SERIESEXTRA',
			fieldLabel: 'Series extra properties',
			xtype: 'textareafield'
		}];
		
		this.api = {
				submit: Ext.qd.Chart.SeriesSubmit // The server side must mark the submit handler as an 'ExtFormHandler'
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