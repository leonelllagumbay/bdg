Ext.define('Ibose.view.quickview.Quickview', {
	extend: 'Ext.panel.Panel',
	xtype: 'quickview',
	
	requires: [
	     'Ibose.view.quickview.QuickviewController'
	],
	
	controller: 'quickview',
	
    flex: 1,
    //title: 'Quick View',
    margin: 5,
    height: '100%',
    defaults: {
        bodyStyle: 'padding:10px'
    },
    layout: {
        type: 'vbox'
    },
    collapsible: true,
    collapseDirection: 'right',
    items: []
});