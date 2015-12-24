Ext.define('dummy.profile.Large', {
    extend: 'Ext.app.Profile',

    views: [
 	       'dummy.view.main.Main'
 	],
    controllers: [],
    models: [],

    isActive: function() {
    	console.log('Large profile');
    	console.log(Ext.os.is('Large'));
        return Ext.os.is('Large');
    }
});