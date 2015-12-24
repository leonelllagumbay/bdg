Ext.define('dummy.view.main.Main', {
	extend: 'Ext.form.Panel',
	xtype: 'main',
	
	requires: [
	     'Ext.plugin.Viewport',
	     'dummy.view.main.MainController'
	],
	
	controller: 'main',
	//viewModel: 'main',
	plugins: 'viewport',
	
	title: 'Dummy Layout',
    layout: {
        type: 'absolute'
    },
    
    defaultType: 'textfield',
    items: [{
	        x: 10,
	        y: 10,
	        xtype:'label',
	        text: 'Send To:'
	    },{
	        x: 80,
	        y: 10,
	        name: 'to',
	        xtype: 'datefield',
	        listeners: {
	        	change: 'onChanged'
	        },
	        anchor:'90%'  // anchor width by percentage
	    },{
	        x:0,
	        y: 90,
	        xtype: 'textareafield',
	        name: 'msg',
	        anchor: '100% 100%'  // anchor width and height
	    }]
});