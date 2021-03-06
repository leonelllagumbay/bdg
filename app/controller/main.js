Ext.define('Form.controller.main', {
    extend: 'Ext.app.Controller',
	id: 'maincontrollerid',
	
	views: [
		'main.westtree',
		'main.main',
		'main.Edit',
		'chat.chatwin'
		
	],

	stores: [
		'main.westtreestore'

	],
	models: [
		
	],
	
	
    init: function() {
		this.control({
			'viewport > panel': {
				render: this.onPanelRendered
			},
			'mainmain': {
				//itemdblclick: this.editUser
			},
			'useredit button[action=save]': {
				click: this.updateUser
			},
			'mainwesttree': {
				itemdblclick: this.treeSelected
			},
			'mainwesttree button[action=logout]': {
				click: this.logOut
			},
			'chatwindow textfield[name=responseonchat]': {
				keyup: this.chatUserTyped
			}
		});
		
	    
		

    },
	chatUserTyped: function(thiscomp,e) {
		console.log(thiscomp);
		console.log(e.button);
		if(e.button == 12) {
			var thevalue = thiscomp.value;
			var displayf = Ext.widget('chatwindow').down('displayfield[name=displayresp]');
			console.log(thevalue); 
			console.log(displayf);
			displayf.value = thevalue;
			console.log(displayf.value);
		}
		
	},
	treeSelected: function(thisview, record, item, index, e, eOpts) {
		var clickedUser = record.data.text;
		var currentuserid = thisview.store.data.items[0].data.text;
		var parentNode = record.parentNode.data.text;
		
		
		if (parentNode == 'My Network') {
			Ext.create('Ext.window.Window', { 
				alias: 'widget.chatwindow',
				id: currentuserid + '^^^' + clickedUser,
			    title: clickedUser,
				resizable: true,
				closable: true,
				//autoScroll: true,
				autoShow: true,
			    height: 240,
			    width: 250,
			    layout: {
					type: 'vbox',
					align: 'left'
				},
				items: [{
						xtype: 'panel',
						layout: 'vbox',
						width: '100%',
						autoScroll: true,
						flex: 15,
						items: []
					},{
						xtype: 'displayfield',
						width: '100%',
						flex: 1,
						name: 'typingtextonly'
					},{
						xtype: 'textareafield',
						enableKeyEvents: true,
						width: '100%',
						flex: 3,
						emptyText: 'Enter text here...',
						name: 'responseonchat',
						listeners: {
							keyup: function(thiscomp,e) {
								var thevaluea = thiscomp.value;
								if(e.button == 12) {
									
									if (thevaluea.trim() == "") {
										return false;
									}
									var timenow = new Date();
									timenow = Ext.Date.format(timenow, "h:i:s a");
									thevalue = '<strong>Me: </strong>' + thevaluea + '<i>(' + timenow + ')</i>';
									var thiswin = this.up('window');
									
									
									//displayf.setValue(thevalue);
									thiscomp.setValue("");
									var myPanel = thiswin.down('panel');
									myPanel.add(new Ext.form.DisplayField({
				                            value: thevalue,
											cls: 'field-margin',
											width: '95%'
				                        }));
									
									var d = myPanel.body.dom;
									myPanel.body.scroll("b", d.scrollHeight);
									var winid = thiswin.id.split('^^^');
									var recipientAndMe = winid[1] + '^^^' + winid[0];
									var theFullMsg = '<strong>' + winid[0] + ': </strong>' + thevaluea + '<i>(' + timenow + ')</i>';
									sayHello(theFullMsg, recipientAndMe, winid[0], thiswin.title);
								} else {
									var thiswin = this.up('window');
									var winid = thiswin.id.split('^^^');
									var recipientAndMe = winid[1] + '^^^' + winid[0];
									
									if((thevaluea.length%9) == 0 || thevaluea.length == 1) {
										sayTyping(recipientAndMe, winid[0], thiswin.title);
									}
									window.setTimeout(function(){myTimer(recipientAndMe)},15000);
								}
						    }
						}
					}]
				
			});
			
			
			
			
		} else {
			return false;
		}
		
		
	},
	logOut: function() {
		Ext.Ajax.request({
		    url: 'signout.cfm',
		    success: function(response){
		       window.location.reload();
		    }
		});
	},
	onPanelRendered: function() {
        console.log('Panel is ready!');
		var treeWin = Ext.ComponentQuery.query('mainwesttree');
		console.log(treeWin[0]);
    },
	
	editUser: function(grid, record) {
		var view = Ext.widget('useredit');
		view.down('form').loadRecord(record);
	},
	
	updateUser: function(button) {
		var win  = button.up('window'),
		    form = win.down('form'),
			record = form.getRecord(),
			values = form.getValues();
			
		record.set(values);
		win.close();
		
		//synchronize the store after editing the records
		//this.sync();
	}
});