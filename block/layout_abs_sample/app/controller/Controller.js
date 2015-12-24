Ext.define('layout_abs_sample.controller.Controller', {
	
	extend: 'Ext.app.Controller',
	alias: 'controller.parent',
	
	init: function() {
		console.log('parent controller init');
        this.control({
            
		});
    },
    
    onLaunch: function() {
	    console.log('parent controller launch')
	},
	
});