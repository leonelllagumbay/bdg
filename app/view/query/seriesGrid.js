Ext.define('Form.view.query.seriesGrid', { 
	extend: 'Ext.grid.Panel',
	alias: 'widget.seriesgrid',
	height: 200,
	title: 'Series',
	autoScroll: true,
	
	initComponent: function() {  
		
		this.store = 'query.seriesStore';
		
		this.tbar = [{
			text: 'Add series',
			action: 'addseries'
		},{
			text: 'Edit series',
			action: 'editseries'
		},{
			text: 'Delete series',
			action: 'deleteseries'
		}];
		this.columns = [{ 
			text: 'CHART SERIES CODE',  
			dataIndex: 'CHARTSERIESCODE',
			width: 170,
			hidden: true
		},{ 
			text: 'EQUERY CODE FK',  
			dataIndex: 'EQRYCODEFK',
			width: 170,
			hidden: true
		},{ 
			text: 'Type',  
			dataIndex: 'TYPE',
			flex: 1,
			hidden: false
		},{ 
			text: 'Axis',  
			dataIndex: 'AXIS',
			flex: 1,
			hidden: false
		},{ 
			text: 'Label',  
			dataIndex: 'LABEL',
			flex: 1,
			hidden: false
		},{ 
			text: 'Tips',  
			dataIndex: 'TIPS',
			flex: 1,
			hidden: false
		},{ 
			text: 'Title',  
			dataIndex: 'TITLE',
			flex: 1,
			hidden: false
		},{ 
			text: 'HIGHLIGHT',  
			dataIndex: 'HIGHLIGHT',
			width: 170,
			hidden: true
		},{ 
			text: 'LISTENERS',  
			dataIndex: 'LISTENERS',
			width: 170,
			hidden: true
		},{ 
			text: 'RENDERER',  
			dataIndex: 'RENDERER',
			width: 170,
			hidden: true
		},{ 
			text: 'SHADOWATTRIBUTES',  
			dataIndex: 'SHADOWATTRIBUTES',
			width: 170,
			hidden: true
		},{ 
			text: 'SHOWINLEGEND',  
			dataIndex: 'SHOWINLEGEND',
			width: 170,
			hidden: true
		},{ 
			text: 'XFIELD',  
			dataIndex: 'XFIELD',
			width: 170,
			hidden: true
		},{ 
			text: 'YFIELD',  
			dataIndex: 'YFIELD',
			width: 170,
			hidden: true
		},{ 
			text: 'COLUMN',  
			dataIndex: 'COLUMN',
			width: 170,
			hidden: true
		},{ 
			text: 'GROUPGUTTER',  
			dataIndex: 'GROUPGUTTER',
			width: 170,
			hidden: true
		},{ 
			text: 'GUTTER',  
			dataIndex: 'GUTTER',
			width: 170,
			hidden: true
		},{ 
			text: 'STACKED',  
			dataIndex: 'STACKED',
			width: 170,
			hidden: true
		},{ 
			text: 'STYLE',  
			dataIndex: 'STYLE',
			width: 170,
			hidden: true
		},{ 
			text: 'XPADDING',  
			dataIndex: 'XPADDING',
			width: 170,
			hidden: true
		},{ 
			text: 'YPADDING',  
			dataIndex: 'YPADDING',
			width: 170,
			hidden: true
		},{ 
			text: 'ANGLEFIELD',  
			dataIndex: 'ANGLEFIELD',
			width: 170,
			hidden: true
		},{ 
			text: 'DONUT',  
			dataIndex: 'DONUT',
			width: 170,
			hidden: true
		},{ 
			text: 'NEEDLE',  
			dataIndex: 'NEEDLE',
			width: 170,
			hidden: true
		},{ 
			text: 'FILL',  
			dataIndex: 'FILL',
			width: 170,
			hidden: true
		},{ 
			text: 'MARKERCONFIG',  
			dataIndex: 'MARKERCONFIG',
			width: 170,
			hidden: true
		},{ 
			text: 'SELECTIONTOLERANCE',  
			dataIndex: 'SELECTIONTOLERANCE',
			width: 170,
			hidden: true
		},{ 
			text: 'SHOWMARKERS',  
			dataIndex: 'SHOWMARKERS',
			width: 170,
			hidden: true
		},{ 
			text: 'SMOOTH',  
			dataIndex: 'SMOOTH',
			width: 170,
			hidden: true
		},{ 
			text: 'COLORSET',  
			dataIndex: 'COLORSET',
			width: 170,
			hidden: true
		},{ 
			text: 'FIELD',  
			dataIndex: 'FIELD',
			width: 170,
			hidden: true
		},{ 
			text: 'HIGHLIGHTDURATION',  
			dataIndex: 'HIGHLIGHTDURATION',
			width: 170,
			hidden: true
		},{ 
			text: 'LENGTHFIELD',
			dataIndex: 'LENGTHFIELD',
			width: 170,
			hidden: true
		},{ 
			text: 'SERIESEXTRA',  
			dataIndex: 'SERIESEXTRA',
			width: 170,
			hidden: true
		}];
		this.callParent(arguments);
	}
});