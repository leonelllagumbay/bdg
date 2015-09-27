Ext.define('Form.view.jobbuilder.OrgChartView', {
	extend: 'Ext.panel.Panel',
	alias: 'widget.orgchartview',
	title: 'Org Chart',
	width: '100%',
	autoScroll: true,

    initComponent: function() {
    	this.bbar = [{
    		xtype: 'button',
    		text: 'Refresh',
    		action: 'refresh'
    	}];
    	this.html = "<div id='orgchart37463483473'></div>";
    	
		this.callParent(arguments);
    }
});