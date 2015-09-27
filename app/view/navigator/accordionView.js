
Ext.define('Form.view.navigator.accordionView', { 
	extend: 'Ext.panel.Panel',
	alias: 'widget.accordionview',
	title: '',
    width: 270,
    defaults: {
        // applied to each contained panel
        // bodyStyle: 'padding:15px'
    },
    layout: {
    	type: 'accordion',
        titleCollapse: true,
        animate: true,
        autoScroll: true,
        fill: true,
        hideCollapseTool: true,
        multi: true
    },
    
	initComponent: function() {   
		
		this.items = [{
			title: '<img height="20" width="30" src="../../../resource/image/tab/worklist.png"> <b>My Worklist</b>',
	        xtype: 'menu',
	        collapsed: true,
	        name: 'myworklist',
	        floating: false,
	        width: 268,
	        bodyPadding: '15 1 10 1',
	        items: []
		},{
			title: '<img height="20" width="30" src="../../../resource/image/tab/liveboard.png"> <b>My LiveBoard</b>',
	        collapsed: true,
	        xtype: 'menu',
	        name: 'myliveboard',
	        floating: false,
	        width: 268,
	        bodyPadding: '15 1 10 1',
	        items: []
		},{
			title: '<img height="20" width="30" src="../../../resource/image/tab/app.png"> <b>My Apps</b>',
	        collapsed: true,
	        xtype: 'menu',
	        name: 'myapps',
	        floating: false,
	        width: 268,
	        bodyPadding: '15 1 10 1',
	        items: []
		},{
		    title: '<img height="20" width="30" src="../../../resource/image/tab/calendar.png"> <b>My Calendar</b>',
		    xtype: 'panel',
		    collapsed: true,
		    width: 268,
		    layout: {
		    	type: 'vbox',
		    	align: 'stretch'
		    },
		    items: [{
		    	xtype: 'datemenu',
		    	name: 'simpleCal',
		    	showToday: false,
			    floating: false,
			    width: '100%'
		    },{
		    	xtype: 'textareafield',
		    	id: 'calnotes',
		    	padding: '0 10 10 10',
		    	name: 'stickydatenote',
		    	fieldCls: 'ctextarea',
		    	hidden: true,
		    	width: '100%',
		    	fieldStyle: {
			        backgroundColor: '#EEEE00'
			    },
		    	height: 87,
		    	value: ''
		    },{
		    	xtype: 'displayfield',
		    	name: 'tempVal',
		    	hidden: true,
		    	value: ''
		    }]
		    
		    
		},{
		    title: '<img height="20" width="30" src="../../../resource/image/tab/message.png"> <b>My Messages</b>',
		    xtype: 'menu',
		    name: 'mymessages',
		    floating: false,
		    width: 268,
	        bodyPadding: '15 1 10 1',
	        collapsed: true,
		    items: []
		},{
		    title: '<img height="20" width="30" src="../../../resource/image/tab/attendance.png"> <b>My Attendance</b>',
		    xtype: 'menu',
		    name: 'myattendance',
		    floating: false,
		    width: 268,
	        bodyPadding: '15 1 10 1',
	        collapsed: true,
		    items: [{
		    	text: 'Time In',
		    	action: 'timein'
		    },{
		    	text: 'Time Out',
		    	action: 'timeout'
		    }]
		},{
		    title: '<img height="20" width="30" src="../../../resource/image/tab/shortcut.png"> <b>My Shortcuts</b>',
		    xtype: 'menu',
		    name: 'myshortcut',
		    floating: false,
		    width: 268,
	        bodyPadding: '15 1 10 1',
	        collapsed: true,
		    items: []
		},{
		    title: '<img height="20" width="30" src="../../../resource/image/tab/bookmark.png"> <b>My Bookmarks</b>',
		    xtype: 'menu',
		    name: 'mybookmark',
		    floating: false,
		    width: 268,
	        bodyPadding: '15 1 10 1',
	        collapsed: true,
		    items: []
		},{
		    title: '<img height="20" width="30" src="../../../resource/image/tab/network.png"> <b>My Network</b>',
		    xtype: 'menu',
		    name: 'mynetwork',
		    floating: false,
		    width: 268,
	        bodyPadding: '15 1 10 1',
	        collapsed: true,
		    items: []
		}],
		this.tools = [{
				        type: 'search',
				        tooltip: 'Search',
				        action: 'plsearch',
				        cls:'abc-tool-search',
				    },{
				        type: 'help',
				        tooltip: 'Help',
				        cls:'abc-tool-help',
				    },{
				        type: 'gear',
				        tooltip: 'Settings',
				        action: 'myibosesettings',
				        cls:'abc-tool-gear',
				    },{
				        type: 'refresh',
				        tooltip: 'Refresh List',
				        action: 'refreshapp',
				        cls:'abc-tool-refresh',
				    },{
				    	action: 'home',
				        itemId: 'home',
				        type: 'gotohome',
				        cls:'abc-tool-gotohome',
				        tooltip: 'Home'
				    },{
				    	type: 'switchcompany',
				    	itemId: 'switchcompany',
				        tooltip: 'Switch Company',
				        hidden: true,
				        cls: 'abc-tool-switchcompany',
				        action: 'switchcompanyadmin'
				    },{
				        action: 'signout',
				        itemId: 'signout',
				        type: 'signout',
				        cls:'abc-tool-signout',
				        tooltip: 'Sign out'
				    }],
		
		this.callParent(arguments);	
	}
});