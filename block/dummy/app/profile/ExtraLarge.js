Ext.define('dummy.profile.ExtraLarge', {
    extend: 'Ext.app.Profile',

    views: [
  	       'dummy.view.main.Main'
  	],
    controllers: [],
    models: [],

    isActive: function() {
    	console.log('Extra Large profile');
    	console.log(Ext.os.is('ExtraLarge'));
        return Ext.os.is('ExtraLarge');
    }
});