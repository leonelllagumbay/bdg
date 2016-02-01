Ext.define('Ibose.view.main.Main', {
	extend: 'Ext.panel.Panel',
	xtype: 'main',
	
	requires: [
	     'Ext.plugin.Viewport',
	     'Ibose.view.main.MainController'
	],
	
	controller: 'main',
	viewModel: {
		type: 'mainview'
	},
	bind: {
        title: '{firstName}'
    },
	plugins: 'viewport',
	//title: 'Welcome Juan De La Cruz :)',
	layout: {
        type: 'hbox',
        align: 'left'
    },
    items: [{
    	xtype: 'navigator'
    },{
        xtype: 'calm'
    },{
        xtype: 'quickview'
    }],
    tools: []
});