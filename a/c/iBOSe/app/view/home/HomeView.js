
Ext.define("iBOSe.view.home.HomeView",{
    extend: "Ext.grid.Panel",
    xtype: 'homeview',
    title: 'Home',
    requires: [
        "iBOSe.view.home.HomeViewController",
        "iBOSe.view.home.HomeViewModel",
        "iBOSe.store.HomeStore",
        "iBOSe.model.HomeModel"
    ],

    controller: "home-homeview",
    viewModel: {
        type: "home-homeview"
    },
    
    padding: '0 0 20 0',
    width: '100%',
    store: {
    	type: 'homestore'
    },
    
    columns: [{ 
    	text: 'Subject', 
    	dataIndex: 'subject' 
    }, { 
    	text: 'Message', 
    	dataIndex: 'messagebody', 
    	flex: 1 
    }, { 
    	text: 'Received', 
    	dataIndex: 'datereceived' 
    }]
});
