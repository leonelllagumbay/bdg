Ext.define('dummy.profile.Tablet', {
    extend: 'Ext.app.Profile',

    views: [
  	       'dummy.view.main.Main'
  	],
    controllers: [],
    models: [],

    isActive: function() {
    	console.log('Tablet profile');
    	console.log(Ext.os.is('Tablet'));
        return Ext.os.is('Tablet');
    }
});