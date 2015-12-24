Ext.define('dummy.profile.SuperLarge', {
    extend: 'Ext.app.Profile',

    views: [
  	       'dummy.view.main.Main'
  	],
    controllers: [],
    models: [],

    isActive: function() {
    	console.log('SuperLarge');
    	console.log(Ext.os.is('SuperLarge'));
        return Ext.os.is('SuperLarge');
    }
});