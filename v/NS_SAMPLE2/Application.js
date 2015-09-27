Ext.application({
	
	name: 'NS_SAMPLE2',
	
	stores: [
	         // TODO: add global / shared stores here
	],
	
	views: [
	       'NS_SAMPLE2.view.login.Login',
	       'NS_SAMPLE2.view.main.Main'
	],
	
	launch: function() {
		console.log('here 0');
		// It's important to note that this type of
		// application could use any type of 
		// storage, i.e., Cookies, LocalStorage, etc.
		var loggedIn;
		localStorage.removeItem('TutorialLoggedIn');
		
		// Check to see the current value of the
		// localStorage key
		loggedIn = localStorage.getItem("TutorialLoggedIn");
		
		// This ternary operator determines the value
		// of the TutorialLoggedIn key.
		// If TutorialLoggedIn isn't true, we 
		// display the login window,
		// otherwise, we display the main window
		console.log('here a');
		Ext.create({
			xtype: loggedIn ? 'app-main' : 'login'
		});
		
		/*onAppUpdate: function() {
			Ext.Msg.confirm('Application Update', 'This application has an update, reload?',
					function(choice) {
						if (choice === 'yes') {
							window.location.reload();
						}
					}
			);
		}*/
		console.log('here b');
	}
});
