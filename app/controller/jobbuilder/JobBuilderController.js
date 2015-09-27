Ext.define('Form.controller.jobbuilder.JobBuilderController', {
   	extend: 'Ext.app.Controller',
   	views: [
   	        'jobbuilder.JobBuilderView',
   	        'jobbuilder.crudWin',
   	        'jobbuilder.crudForm'
   	],
   	models: ['jobbuilder.JobBuilderModel'],
   	stores: ['jobbuilder.JobBuilderStore'],
   		init: function() {
   			this.control({
   				'panel': {
   					render: this.initPanel
   				},
   				'jobbuilderview button': {
   					click: this.topBarButtonClicked
   				},
   				'jobbuilderview': {
   					select: this.gridRecordedSelected
   				},
   				'crudform button[action=save]': {
   					click: this.submitJob
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
					
	   			var dw = Ext.widget('crudwin');
	   			var fform = Ext.ComponentQuery.query('crudform')[0];
	   			
	   			dw.setTitle("");
	   			fform.down('button[action=save]').setVisible(false);
	   			fform.down('button[action=cancel]').setVisible(false);
	   			fform.down('button[action=save]').setText("Viewing");
	   			fform.down('textfield[name=actiontype]').setValue("READ");
				dw.show();
			
				var df = dw.down('form').getForm();
				var dgdata = b.up('grid').getSelectionModel().getSelection()[0].data;
				df.setValues(dgdata);

   			} else if (b.action == 'Add') {
				
				var fwin = Ext.widget('crudwin');
				var fform = Ext.ComponentQuery.query('crudform')[0];
				fwin.setTitle("Add Position");
				var fbtn = fform.down('button[action=save]');
				fbtn.setVisible(true);
				fbtn.setText("Add");
				fform.down('button[action=cancel]').setVisible(true);
				fform.down('textfield[name=actiontype]').setValue("ADD");
				fwin.show();
			} else if (b.action == 'Edit') {
				
				var fwin = Ext.widget('crudwin');
				var fform = Ext.ComponentQuery.query('crudform')[0];
				fwin.setTitle("Modify Position");
				var fbtn = fform.down('button[action=save]');
				fbtn.setVisible(true);
				fbtn.setText("Save");
				fform.down('button[action=cancel]').setVisible(true);
				fform.down('textfield[name=actiontype]').setValue("EDIT");
				fwin.show();
				
				var df = fwin.down('form').getForm();
				var dgdata = b.up('grid').getSelectionModel().getSelection()[0];
				if (dgdata) df.setValues(dgdata.data);
				else {
					Ext.Msg.alert('Message', 'No selection to edit.');
					fwin.close();
				}
				
   			} else if (b.action == 'Copy') {
				
   				var fwin = Ext.widget('crudwin');
				var fform = Ext.ComponentQuery.query('crudform')[0];
				fwin.setTitle("Copy Position");
				var fbtn = fform.down('button[action=save]');
				fbtn.setVisible(true);
				fbtn.setText("Copy");
				fform.down('button[action=cancel]').setVisible(true);
				fform.down('textfield[name=actiontype]').setValue("COPY");
				fwin.show();

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
					var qrytitle = 'Job Builder';
					var qrycode = '7EB34A22-FDC3-09F7-646770F411235A84';
					Ext.jobbuilder.Job.exportGridToExcel(qrycode, qrytitle, function(res) {
						dgrid.getEl().unmask();
						if (res.result !== true) {
							Ext.Msg.alert('Error','A problem occurred while exporting the record to excel.');
						} else {
						 	window.location.href = './unDB/temp/' + qrytitle + '.xls';
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
					    		Ext.jobbuilder.Job.emailSelGridQuery(fromv,tov,subjectv,bodyv,function(res) {
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
	
   		gridRecordedSelected: function(dis, rec, ind) {
   			var formCmp = Ext.getCmp('viewform7F6323CC-A1C7-AFB9-A773A680CAD3479A') || Ext.getCmp('autoeformididid');
   			var actiontype = formCmp.down('textfield[name=actiontype]').getValue();
   			if (actiontype == "READ" || actiontype == "EDIT") {
   				formCmp.getForm().setValues(rec.data);
   			}
   		},
   		
   		submitJob: function(b) {
   			var dform = b.up('form').getForm();
   	    	if(dform.isValid()) {
   	      		dform.submit({
   	  				waitMsg: 'Adding job, please wait...',
   	  				timeout: 300000,
   	  				reset: true,
   	  			  		//Failure see app-wide error handler
   	  			  		success: function(form, action){
   	  			  			Ext.Msg.show({
   	  			  				msg: 'Done!',
   	  			  				buttons: Ext.Msg.OK
   	  			  			});
   	  			  			Ext.ComponentQuery.query('crudwin')[0].close();
   	  			  		    Ext.ComponentQuery.query('jobbuilderview')[0].getStore().load();
   	  			  		    Ext.ComponentQuery.query('orgdevview')[0].getStore().load();
   	  					}
   	  			});	
   	      	 } 
   		}
})