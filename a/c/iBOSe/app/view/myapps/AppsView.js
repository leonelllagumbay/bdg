
Ext.define("iBOSe.view.myapps.AppsView",{
    extend: "Ext.grid.Panel",
    xtype: 'iboseappsview',
    requires: [
        "iBOSe.view.myapps.AppsViewController",
        "iBOSe.view.myapps.AppsViewModel",
        "iBOSe.store.AppsStore"
    ],

    controller: "myapps-appsview",
    viewModel: {
        type: "myapps-appsview"
    },

    title: 'Apps',
    store: {
    	type: 'iboseappstore'
    },
    
    columns: [{ 
    	text: 'Name', 
    	dataIndex: 'name' 
    }, { 
    	text: 'Email', 
    	dataIndex: 'email', 
    	flex: 1 
    }, { 
    	text: 'Phone', 
    	dataIndex: 'phone' 
    }]
});
