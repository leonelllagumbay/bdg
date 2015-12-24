Ext.define('layout_abs_sample.view.main.Main', {
	extend: 'Ext.form.Panel',
	xtype: 'main',
	
	requires: [
	     'Ext.plugin.Viewport',
	     'Ext.window.MessageBox', 
	     'layout_abs_sample.view.main.MainController'
	],
	
	controller: 'main',
	//viewModel: 'main',
	plugins: 'viewport',
	
	title: 'Absolute Layout',
    layout: {
        type: 'absolute'
    },
    url:'save-form.php',
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
	        anchor:'90%'  // anchor width by percentage
	    },{
	        x: 10,
	        y: 50,
	        xtype:'label',
	        text: 'Subject:'
	    },{
	        x: 80,
	        y: 50,
	        name: 'subject',
	        anchor: '90%'  // anchor width by percentage
	    },{
	        x:0,
	        y: 90,
	        xtype: 'textareafield',
	        name: 'msg',
	        anchor: '100% 100%'  // anchor width and height
	    }]
});