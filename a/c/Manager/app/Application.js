/**
 * The main application class. An instance of this class is created by app.js when it
 * calls Ext.application(). This is the ideal place to handle application launch and
 * initialization details.
 */
Ext.define('Manager.Application', {
    extend: 'Ext.app.Application',
    
    name: 'Manager',
    defaultToken: 'home',
    stores: [
        // TODO: add global / shared stores here
    ],
    
    launch: function () {
        // TODO - Launch the application
    	Ext.define('Car', {
    		name: 'Leonell',
    		constructor: function(name) {
    			if (name) {
    				this.name = name;
    			}
    		},
    		start: function() {
    			alert('Machine started');
    		}
    	});
    	
    	var car = Ext.create('Car', {
    		name: 'Onel'
    	});
    	
    	console.log(car);
    },

    onAppUpdate: function () {
        Ext.Msg.confirm('Application Update', 'This application has an update, reload?',
            function (choice) {
                if (choice === 'yes') {
                    window.location.reload();
                }
            }
        );
    }
});
