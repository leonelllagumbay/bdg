/**
 * This class is the controller for the main view for the application. It is specified as
 * the "controller" of the Main view class.
 *
 * TODO - Replace this content of this view to suite the needs of your application.
 */
Ext.define('iBOSe.view.main.MainController', {
    extend: 'Ext.app.ViewController',

    alias: 'controller.main',
    
    routes: {
    	'home': 'onHome',
    	'users/:id/:isactive': {
    		before: 'onBeforeUser',
    		action: 'onUsers'
    	},
    	'administrator': 'onAdministrator'
    },
    
    onHome: function() {
    	Ext.Msg.alert('onHome','Home');
    },
    
    onBeforeUser: function(id, isactive, action) {
    	Ext.Msg.alert('Before', 'Before action');
    	action.resume();
    	// action.stop(true);
    },
    
    onUsers: function(id, isactive) {
    	Ext.Msg.alert('User app here','Users ' + id + ' ' + isactive);
    },
    
    onAdministrator: function() {
    	Ext.Msg.alert('onAdministrator','Administrator');
    }
});
