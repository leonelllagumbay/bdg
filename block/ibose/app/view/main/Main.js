Ext.define('Ibose.view.main.Main', {
	extend: 'Ext.panel.Panel',
	xtype: 'main',
	
	requires: [
	     'Ext.plugin.Viewport',
	     'Ibose.view.main.MainController'
	],
	
	controller: 'main',
	//viewModel: 'main',
	plugins: 'viewport',
	title: 'Welcome Juan De La Cruz :)',
	layout: {
        type: 'hbox',
        align: 'left'
    },
    items: [{
    	xtype: 'navigator'
    },{
        xtype: 'content'
    },{
        xtype: 'quickview'
    }],
    tools: [{
        type: 'print',
        tooltip: 'Print',
        action: 'plprint',
        cls:'abc-tool-print',
    },{
        type: 'save',
        tooltip: 'Save',
        action: 'plsave',
        cls:'abc-tool-save',
    },{
        type: 'help',
        tooltip: 'Help',
        cls:'abc-tool-help',
    },{
        type: 'gear',
        tooltip: 'Settings',
        action: 'myibosesettings',
        cls:'abc-tool-gear',
    },{
        type: 'refresh',
        tooltip: 'Refresh List',
        action: 'refreshapp',
        cls:'abc-tool-refresh',
    },{
    	action: 'home',
        itemId: 'home',
        type: 'up',
        cls:'abc-tool-up',
        tooltip: 'Home'
    },{
    	type: 'maximize',
    	itemId: 'switchcompany',
        tooltip: 'Switch Company',
        cls: 'abc-tool-maximize',
        action: 'switchcompanyadmin'
    },{
        action: 'signout',
        itemId: 'signout',
        type: 'signout',
        cls:'abc-tool-signout',
        tooltip: 'Sign out'
    },{
    	xtype: 'textfield',
    	margin: '0 0 0 5',
    	emptyText: 'Search'
    },{
        type: 'search',
        tooltip: 'Search',
        action: 'plsearch',
        cls:'abc-tool-search',
    }]
});