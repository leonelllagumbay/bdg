Ext.define('dummy.profile.Phone', {
    extend: 'Ext.app.Profile',

    views: [
  	       'dummy.view.main.Main'
  	],
    controllers: [],
    models: [],

    isActive: function() {
    	console.log('Phone profile');
    	console.log(Ext.os.is('Phone'));
        return Ext.os.is('Phone');
    }
});