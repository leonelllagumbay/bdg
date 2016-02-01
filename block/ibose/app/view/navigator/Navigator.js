Ext.define('Ibose.view.navigator.Navigator', {
	extend: 'Ext.panel.Panel',
	xtype: 'navigator',
	
	requires: [
	     'Ibose.view.navigator.NavigatorController'
	],
	
	controller: 'nav',
	title: ' ',
    margin: 5,
    height: '100%',
    width: 320,
    autoScroll: true,
    defaults: {
        bodyStyle: 'padding:7px',
        width: '100%',
        collapsible: true,
        collapsed: true,
        margin: '1 1 0 1'
    },
    layout: {
    	type: 'vbox'
    },
    collapsible: true,
    collapseDirection: 'left',
    items: []
});