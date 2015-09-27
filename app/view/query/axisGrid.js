Ext.define('Form.view.query.axisGrid', { 
	extend: 'Ext.grid.Panel',
	alias: 'widget.axisgrid',
	title: 'Axis',
	height: 200,
	autoScroll: true,
	
	initComponent: function() {  
		
		this.store = 'query.axisStore';
		
		this.tbar = [{
			text: 'Add axis',
			action: 'addaxis'
		},{
			text: 'Edit axis',
			action: 'editaxis'
		},{
			text: 'Delete axis',
			action: 'deleteaxis'
		}];
		this.columns = [{ 
			text: 'CHART AXIS CODE',  
			dataIndex: 'CHARTAXISCODE',
			width: 170,
			hidden: true
		},{ 
			text: 'EQUERY CODE FK',  
			dataIndex: 'EQRYCODEFK',
			width: 170,
			hidden: true
		},{ 
			text: 'Type',  
			dataIndex: 'AXISTYPE',
			flex: 1,
			hidden: false
		},{ 
			text: 'POSITION',  
			dataIndex: 'POSITION',
			width: 170,
			hidden: true
		},{ 
			text: 'Title',  
			dataIndex: 'TITLE',
			flex: 1,
			hidden: false
		},{ 
			text: 'Label',  
			dataIndex: 'LABEL',
			flex: 1,
			hidden: false
		},{ 
			text: 'Category Names',  
			dataIndex: 'CATEGORYNAMES',
			flex: 1,
			hidden: false
		},{ 
			text: 'ADJUSTEND',  
			dataIndex: 'ADJUSTEND',
			width: 170,
			hidden: true
		},{ 
			text: 'DASHSIZE',  
			dataIndex: 'DASHSIZE',
			width: 170,
			hidden: true
		},{ 
			text: 'FIELDS',  
			dataIndex: 'FIELDS',
			width: 170,
			hidden: true
		},{ 
			text: 'GRID',  
			dataIndex: 'GRID',
			width: 170,
			hidden: true
		},{ 
			text: 'HIDDEN',  
			dataIndex: 'HIDDEN',
			width: 170,
			hidden: true
		},{ 
			text: 'LENGTH',  
			dataIndex: 'LENGTH',
			width: 170,
			hidden: true
		},{ 
			text: 'MAJORTICKSTEPS',  
			dataIndex: 'MAJORTICKSTEPS',
			width: 170,
			hidden: true
		},{ 
			text: 'MINORTICKSTEPS',  
			dataIndex: 'MINORTICKSTEPS',
			width: 170,
			hidden: true
		},{ 
			text: 'WIDTH',  
			dataIndex: 'WIDTH',
			width: 170,
			hidden: true
		},{ 
			text: 'CALCULATECATEGORYCOUNT',  
			dataIndex: 'CALCULATECATEGORYCOUNT',
			width: 170,
			hidden: true
		},{ 
			text: 'MARGIN',  
			dataIndex: 'MARGIN',
			width: 170,
			hidden: true
		},{ 
			text: 'MAXIMUM',  
			dataIndex: 'MAXIMUM',
			width: 170,
			hidden: true
		},{ 
			text: 'MINIMUM',  
			dataIndex: 'MINIMUM',
			width: 170,
			hidden: true
		},{ 
			text: 'STEPS',  
			dataIndex: 'STEPS',
			width: 170,
			hidden: true
		},{ 
			text: 'ADJUSTMAXIMUMBYMAJORUNIT',  
			dataIndex: 'ADJUSTMAXIMUMBYMAJORUNIT',
			width: 170,
			hidden: true
		},{ 
			text: 'ADJUSTMINIMUMBYMAJORUNIT',  
			dataIndex: 'ADJUSTMINIMUMBYMAJORUNIT',
			width: 170,
			hidden: true
		},{ 
			text: 'CONSTRAIN',  
			dataIndex: 'CONSTRAIN',
			width: 170,
			hidden: true
		},{ 
			text: 'DECIMALS',  
			dataIndex: 'DECIMALS',
			width: 170,
			hidden: true
		},{ 
			text: 'FROMDATE',  
			dataIndex: 'FROMDATE',
			width: 170,
			hidden: true
		},{ 
			text: 'TODATE',  
			dataIndex: 'TODATE',
			width: 170,
			hidden: true
		},{ 
			text: 'DATEFORMAT',  
			dataIndex: 'DATEFORMAT',
			width: 170,
			hidden: true
		},{ 
			text: 'AXISEXTRA',  
			dataIndex: 'AXISEXTRA',
			width: 170,
			hidden: true
		}];
		
		this.callParent(arguments);
	}
});