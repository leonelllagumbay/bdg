Ext.define('Form.controller.queryoutput.FBC.NS_2EDD7067BEAD092F217F5D4E0CE400B4.Controller', {
   	extend: 'Ext.app.Controller',
   	views: ['queryoutput.FBC.NS_2EDD7067BEAD092F217F5D4E0CE400B4.View'],
   	models: ['queryoutput.FBC.NS_2EDD7067BEAD092F217F5D4E0CE400B4.Model'],
   	stores: ['queryoutput.FBC.NS_2EDD7067BEAD092F217F5D4E0CE400B4.Store'],
   		init: function() {
   			this.control({
   				'panel': {
   					render: this.initPanel
   				},
   				'NS_2EDD7067BEAD092F217F5D4E0CE400B4 button': {
   					click: this.topBarButtonClicked
   				},
   				'NS_2EDD7067BEAD092F217F5D4E0CE400B4': {
   					afterrender: this.gridRenderingComplete,
   					select: this.gridRecordedSelected
   				}
   			})
   		},
   		initPanel: function(b) {

   		},
   		
			topBarButtonClicked: function(b) {
	   		if (b.action) {
   				if (b.action == 'Print') {
   				var dg = b.up('grid');
   				Ext.ux.grid.Printer.mainTitle = dg.title;
   				if (typeof GLOBAL_VARS_DIRECT !== 'undefined') {
   					Ext.ux.grid.Printer.bannerLogo = '<img src="' + GLOBAL_VARS_DIRECT.COMPANYLOGO + '" width="150" height="35" />';
   				}
   				Ext.ux.grid.Printer.print(dg);

	   		} else if (b.action == 'View') {
					
				var dw = Ext.create('Ext.window.Window', {
				    height: '90%',
				    width: 500,
				    layout: 'fit',
				    items: [{
				    	xtype: 'form',
				    	id: 'viewform530ED7F5-00B6-D058-E436DA279267EF0D',
				    	autoScroll: true,
				    	items: [{
							width: '95%',name: 'cin21workhistory-ENTITYCODE',
							fieldLabel: 'Company Name',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21workhistory-MAINDUTIES',
							fieldLabel: 'Company Address',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21workhistory-COMPANYCONTACT',
							fieldLabel: 'Contact Information',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21workhistory-LASTPOSITIONHELD',
							fieldLabel: 'Last Position Held',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21workhistory-ACCOMPLISHMENT',
							fieldLabel: 'Major Accomplishments',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21workhistory-REASONFORLEAVING',
							fieldLabel: 'Reasons for Leaving',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21workhistory-DATEHIRED',
							fieldLabel: 'Date Employed',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21workhistory-SEPARATIONDATE',
							fieldLabel: 'Date Separated',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21workhistory-WORKSTARTINGSALARY',
							fieldLabel: 'Starting Salary',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21workhistory-WORKENDINGSALARY',
							fieldLabel: 'Last Salary',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21workhistory-DEPARTMENT',
							fieldLabel: 'Department',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21workhistory-SUPERIOR',
							fieldLabel: 'Immediate Superior',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21workhistory-SUPERIORPOSITION',
							fieldLabel: 'Position of Superior',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21workhistory-SUPERIORCONTACT',
							fieldLabel: 'Contact No of Superior',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						}]
				    }]
				}).show();
			
				var df = dw.down('form').getForm();
				var dgdata = b.up('grid').getSelectionModel().getSelection()[0].data;
				df.setValues(dgdata);

   			} else if (b.action == 'Add') {
				
				var fwin = Ext.create('Ext.window.Window', {
				    title: 'Add',
				    layout: {
				    	type: 'vbox',
				    	align: 'center'
				    },
				    height: '90%',
				    width: 580,
				    resizable: false,
				    items: [{
				    	xtype: 'form',
				    	width: '100%',
				    	flex: 1,
				    	autoScroll: true,
				    	items: [{
							width: '95%',name: 'cin21workhistory-ENTITYCODE',
							fieldLabel: 'Company Name',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21workhistory-MAINDUTIES',
							fieldLabel: 'Company Address',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21workhistory-COMPANYCONTACT',
							fieldLabel: 'Contact Information',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21workhistory-LASTPOSITIONHELD',
							fieldLabel: 'Last Position Held',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21workhistory-ACCOMPLISHMENT',
							fieldLabel: 'Major Accomplishments',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21workhistory-REASONFORLEAVING',
							fieldLabel: 'Reasons for Leaving',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21workhistory-DATEHIRED',
							fieldLabel: 'Date Employed',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'datefield'
						},{
							width: '95%',name: 'cin21workhistory-SEPARATIONDATE',
							fieldLabel: 'Date Separated',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'datefield'
						},{
							width: '95%',name: 'cin21workhistory-WORKSTARTINGSALARY',
							fieldLabel: 'Starting Salary',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'numberfield'
						},{
							width: '95%',name: 'cin21workhistory-WORKENDINGSALARY',
							fieldLabel: 'Last Salary',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'numberfield'
						},{
							width: '95%',name: 'cin21workhistory-DEPARTMENT',
							fieldLabel: 'Department',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21workhistory-SUPERIOR',
							fieldLabel: 'Immediate Superior',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21workhistory-SUPERIORPOSITION',
							fieldLabel: 'Position of Superior',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21workhistory-SUPERIORCONTACT',
							fieldLabel: 'Contact No of Superior',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						}]
				    }],
				    buttons: [{
				    	text: 'Add',
				    	handler: function(em) {
				    		var dwin = em.up('window');
				    		var dform = dwin.down('form').getForm();
				    		var formValues = dform.getValues();
				    		if (dform.isValid()) {
				    			var dgrid = Ext.widget('NS_2EDD7067BEAD092F217F5D4E0CE400B4');
				    			console.log(formValues);
				    			dgrid.getStore().add(formValues);
				    			dwin.close();
				    		}
				    	}
				    },{
				    	text: 'Cancel',
				    	handler: function(em) {
				    		em.up('window').close();
				    	}
				    }]
				}).show();

		
   			} else if (b.action == 'Edit') {
				
	       	    Ext.Msg.alert('Message', 'To begin editing, please double click a row or a cell of a specific record.');
			
   			} else if (b.action == 'Copy') {
				
				var fwin = Ext.create('Ext.window.Window', {
				    title: 'Copy',
				    layout: {
				    	type: 'vbox',
				    	align: 'center'
				    },
				    height: '90%',
				    width: 580,
				    resizable: false,
				    items: [{
				    	xtype: 'form',
				    	width: '100%',
				    	flex: 1,
				    	autoScroll: true,
				    	items: [{
							width: '95%',name: 'cin21workhistory-ENTITYCODE',
							fieldLabel: 'Company Name',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21workhistory-MAINDUTIES',
							fieldLabel: 'Company Address',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21workhistory-COMPANYCONTACT',
							fieldLabel: 'Contact Information',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21workhistory-LASTPOSITIONHELD',
							fieldLabel: 'Last Position Held',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21workhistory-ACCOMPLISHMENT',
							fieldLabel: 'Major Accomplishments',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21workhistory-REASONFORLEAVING',
							fieldLabel: 'Reasons for Leaving',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21workhistory-DATEHIRED',
							fieldLabel: 'Date Employed',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'datefield'
						},{
							width: '95%',name: 'cin21workhistory-SEPARATIONDATE',
							fieldLabel: 'Date Separated',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'datefield'
						},{
							width: '95%',name: 'cin21workhistory-WORKSTARTINGSALARY',
							fieldLabel: 'Starting Salary',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'numberfield'
						},{
							width: '95%',name: 'cin21workhistory-WORKENDINGSALARY',
							fieldLabel: 'Last Salary',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'numberfield'
						},{
							width: '95%',name: 'cin21workhistory-DEPARTMENT',
							fieldLabel: 'Department',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21workhistory-SUPERIOR',
							fieldLabel: 'Immediate Superior',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21workhistory-SUPERIORPOSITION',
							fieldLabel: 'Position of Superior',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21workhistory-SUPERIORCONTACT',
							fieldLabel: 'Contact No of Superior',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						}]
				    }],
				    buttons: [{
				    	text: 'Copy',
				    	handler: function(em) {
				    		var dwin = em.up('window');
				    		var dform = dwin.down('form').getForm();
				    		var formValues = dform.getValues();
				    		if (dform.isValid()) {
				    			var dgrid = Ext.widget('NS_2EDD7067BEAD092F217F5D4E0CE400B4');
				    			console.log(formValues);
				    			dgrid.getStore().add(formValues);
				    			dwin.close();
				    		}
				    	}
				    },{
				    	text: 'Cancel',
				    	handler: function(em) {
				    		em.up('window').close();
				    	}
				    }]
				}).show();

				var df = fwin.down('form').getForm();
				var dgdata = b.up('grid').getSelectionModel().getSelection()[0];
				if (dgdata) df.setValues(dgdata.data);
				else {
					Ext.Msg.alert('Message', 'No selection to copy.');
					fwin.close();
				}
			
   			} else if (b.action == 'Delete') {
					
	       		Ext.Msg.show({
	       			title: 'Delete Selected Record!',
	       			msg: 'This will permanently remove the selected record. Would you like to continue?',
	       			buttons: Ext.Msg.YESNOCANCEL,
		    	    icon: Ext.Msg.QUESTION,
		    	    fn: function(res, txt) {
		    	    	if (res == 'yes') {
		    	    		var dgrid = b.up('grid');
					    	var seldata = dgrid.getSelectionModel().getSelection();
					    	dgrid.getStore().remove(seldata);
		    	    	}
		    	    }
	       		});
			
   			} else if (b.action == 'Export') {
					
					var dgrid = b.up('grid');
					dgrid.getEl().mask('Exporting...');
					var qrytitle = 'Work History';
					var qrycode = '2EDD7067-BEAD-092F-217F5D4E0CE400B4';
					Ext.NS_2EDD7067BEAD092F217F5D4E0CE400B4.Data.exportGridToExcel(qrycode, qrytitle, function(res) {
						dgrid.getEl().unmask();
						if (res.result !== true) {
							Ext.Msg.alert('Error','A problem occurred while exporting the record to excel.');
						} else {
						 	window.location.href = 'http://localhost:8500/unDB/temp/' + qrytitle + '.xls';
						}
					});
		
   			} else if (b.action == 'Email') {
					
				var ewin = Ext.create('Ext.window.Window', {
				    title: 'Email',
				    layout: {
				    	type: 'fit'
				    },
				    width: 580,
				    modal: true,
				    autoScroll: true,
				    resizable: true,
				    items: [{
				    	xtype: 'form',
				    	width: '100%',
				    	height: 450,
				    	items: [{
							xtype: 'textfield',
							padding: 10,
							width: 540,
							allowBlank: false,
							fieldLabel: 'From',
							name: 'fromfield',
							vtype: 'email',
							readOnly: true,
							value: 'leonelllagumbay@gmail.com'
						},{
							xtype: 'textfield',
							fieldLabel: 'To',
							padding: 10,
							width: 540,
							name: 'tofield',
							allowBlank: false
						},{
							xtype: 'textfield',
							padding: 10,
							width: 540,
							allowBlank: false,
							name: 'subjectfield',
							fieldLabel: 'Subject'
						},{
							xtype: 'htmleditor',
							height: 250,
							name: 'bodyfield',
							enableFormat: false,
							enableLinks: false,
							enableLists: false
						}]
				    }],
				    buttons: [{
				    	text: 'Send',
				    	handler: function(em) {
				    		var dwin = em.up('window');
				    		var dform = dwin.down('form').getForm();
				    		var formValues = dform.getFieldValues();
				    		var fromv = formValues.fromfield;
				    		var tov = formValues.tofield;
				    		var subjectv = formValues.subjectfield;
				    		var bodyv = formValues.bodyfield;
				    		if (dform.isValid()) {
					    		dwin.getEl().mask('Sending...');
					    		Ext.NS_2EDD7067BEAD092F217F5D4E0CE400B4.Data.emailSelGridQuery(fromv,tov,subjectv,bodyv,function(res) {
					    			dwin.getEl().unmask();
					    			if (res.success !== true) {
					    				Ext.Msg.alert('Error','There is a problem servicing this request.');
					    			}
					    			dwin.close();
					    		});
				    		}
				    	}
				    },{
				    	text: 'Cancel',
				    	handler: function(em) {
				    		em.up('window').close();
				    	}
				    }]
				}).show();
				var dform = ewin.down('form');
				var dgrid = b.up('grid');
				if (typeof GLOBAL_VARS_DIRECT !== 'undefined') {
  						Ext.ux.grid.Printer.bannerLogo = '<img src="' + GLOBAL_VARS_DIRECT.COMPANYLOGO + '" width="150" height="35px" />';
  					}
				var dgridrecord = Ext.ux.grid.Printer.printToString(dgrid);
				var dgridtitle = dgrid.title;
				dform.getForm().setValues({bodyfield: dgridrecord, subjectfield: dgridtitle});
		
   			} else {
   					// do nothing here...
   			}
   			}
   		},
	
   		gridRenderingComplete: function(dis, eopts) {
   			var qc = '2EDD7067-BEAD-092F-217F5D4E0CE400B4';
   			Ext.NS_2EDD7067BEAD092F217F5D4E0CE400B4.Data.getUserToolbars(qc, function(res) {
   				if (res.success) {
   					dis.addDocked(res);
   				}
   			});
   		},
   		gridRecordedSelected: function(dis, rec, ind) {
   			var formCmp = Ext.getCmp('viewform530ED7F5-00B6-D058-E436DA279267EF0D') || Ext.getCmp('autoeformididid');
   			if (formCmp) {
   				formCmp.getForm().setValues(rec.data);
   			}
   		}
})