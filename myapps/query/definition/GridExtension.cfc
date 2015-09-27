component accessors=true output=false persistent=false {

public string function prepareGridIcons() {
	SaveContent variable="style" {
		if (findNoCase(cgi.SERVER_PROTOCOL, "https")) var sProt = "https://" ;
		else sProt = "http://";
		WriteOutput("
			<style>
		    	.print-icon {
					background-image:url(#sProt##cgi.SERVER_NAME#:#cgi.SERVER_PORT#/resource/image/appicon/print-icon.png);
					background-size: 15px 15px;
				}
				.view-icon {
					background-image:url(#sProt##cgi.SERVER_NAME#:#cgi.SERVER_PORT#/resource/image/appicon/view-icon.png);
					background-size: 15px 15px;
				}
				.add-icon {
					background-image:url(#sProt##cgi.SERVER_NAME#:#cgi.SERVER_PORT#/resource/image/appicon/add-icon.png);
					background-size: 15px 15px;
				}
				.edit-icon {
					background-image:url(#sProt##cgi.SERVER_NAME#:#cgi.SERVER_PORT#/resource/image/appicon/edit-icon.png);
					background-size: 15px 15px;
				}
				.copy-icon {
					background-image:url(#sProt##cgi.SERVER_NAME#:#cgi.SERVER_PORT#/resource/image/appicon/copy-icon.png);
					background-size: 15px 15px;
				}
				.delete-icon {
					background-image:url(#sProt##cgi.SERVER_NAME#:#cgi.SERVER_PORT#/resource/image/appicon/delete-icon.png);
					background-size: 15px 15px;
				}
				.export-icon {
					background-image:url(#sProt##cgi.SERVER_NAME#:#cgi.SERVER_PORT#/resource/image/appicon/export-icon.png);
					background-size: 15px 15px;
				}
				.email-icon {
					background-image:url(#sProt##cgi.SERVER_NAME#:#cgi.SERVER_PORT#/resource/image/appicon/email-icon.png);
					background-size: 15px 15px;
				}
		    </style>
		");
	}

	return style;

}

public string function setTopBarButtonClicked(required Array tablecolumnArr,required String querycode,querygrid,String querycodeAsNameSpace) {

	var tviewwin = setToolbarViewWindow(tablecolumnArr, querygrid);
	var addwin = setToolbarChangeWin("ADD",tablecolumnArr, querycode, querygrid,querycodeAsNameSpace);
	var editwin = setToolbarChangeWin("EDIT");
	var copywin = setToolbarChangeWin("COPY",tablecolumnArr, querycode, querygrid,querycodeAsNameSpace);
	var deletewin = setToolbarChangeWin("DELETE");
	var exportwin = setToolbarExportWin(tablecolumnArr, querycode, querygrid,querycodeAsNameSpace);
	var emailwin = setToolbarEmailWin(querycodeAsNameSpace);

	SaveContent variable="topbar" {
		WriteOutput("
			topBarButtonClicked: function(b) {
	   		if (b.action) {
   				if (b.action == 'Print') {
   				var dg = b.up('grid');
   				Ext.ux.grid.Printer.mainTitle = dg.title;
   				if (typeof GLOBAL_VARS_DIRECT !== 'undefined') {
   					Ext.ux.grid.Printer.bannerLogo = '<img src=""' + GLOBAL_VARS_DIRECT.COMPANYLOGO + '"" width=""150"" height=""35"" />';
   				}
   				Ext.ux.grid.Printer.print(dg);

	   		} else if (b.action == 'View') {
					#tviewwin#
				var df = dw.down('form').getForm();
				var dgdata = b.up('grid').getSelectionModel().getSelection()[0].data;
				df.setValues(dgdata);

   			} else if (b.action == 'Add') {
				#addwin#
   			} else if (b.action == 'Edit') {
				#editwin#
   			} else if (b.action == 'Copy') {
				#copywin#
   			} else if (b.action == 'Delete') {
					#deletewin#
   			} else if (b.action == 'Export') {
					#exportwin#
   			} else if (b.action == 'Email') {
					#emailwin#
   			} else {
   					// do nothing here...
   			}
   			}
   		},
	");
	}

	return topbar;
}

public string function setToolbarViewWindow(tablecolumnArr, querygrid) {
	var viewitems = setFormItems(tablecolumnArr);
	var eformid = querygrid.getFORMGRIDCOMBO();
	if (IsDefined("eformid") && trim(eformid) != "") { // use eForm from eformid rather than the default one.
		var listlength = ListLen(eformid, ",");
		if (listlength == 1) {
			var deformid = eformid;
			var dwidth = "'100%'";
			var dheight = "'100%'";
		} else if (listlength == 2) {
			var deformid = ListGetAt(eformid, 1, ",");
			var dwidth = ListGetAt(eformid, 2, ",");
			var dheight = "'100%'";
		} else if (listlength > 2) {
			var deformid = ListGetAt(eformid, 1, ",");
			var dwidth = ListGetAt(eformid, 2, ",");
			var dheight = ListGetAt(eformid, 3, ",");
		} else {
			var deformid = eformid;
			var dwidth = "'100%'";
			var dheight = "'100%'";
		}

		var eformObj = EntityLoad("EGRGEFORMS", deformid, true);
		var formStr = eformObj.getLAYOUTQUERY();
		var dleft = findnocase("*NOTFOREQUERY*",formStr);
		var formStr = left(formStr, dleft - 2);

		formStr = convertToQueryDataIndex(formStr,tablecolumnArr);

		SaveContent variable="tview" {
			WriteOutput("#formStr#});");
			WriteOutput("var dw = Ext.create('Ext.window.Window', {
				width: #dwidth#,
				height: #dheight#,
				layout: 'fit',
				items: eForm
			}).show();");
		}
	} else {
		SaveContent variable="tview" {
			WriteOutput("
				var dw = Ext.create('Ext.window.Window', {
				    height: '90%',
				    width: 500,
				    layout: 'fit',
				    items: [{
				    	xtype: 'form',
				    	id: 'viewform#tablecolumnArr[1][1]#',
				    	autoScroll: true,
				    	items: #viewitems#
				    }]
				}).show();
			");
		}
	}
	return tview;
}

private String function convertToQueryDataIndex(formStr, tablecolumnArr) {
	for(a = 1; a <= ArrayLen(tablecolumnArr); a++) {
	    var tbname = trim(tablecolumnArr[a][2]);
	    var tbcolname = trim(tablecolumnArr[a][3]);
		formStr = ReplaceNoCase(formStr, "G__#tbname#__#tbcolname#", "#tbname#-#tbcolname#", "all");
		formStr = ReplaceNoCase(formStr, "C__#tbname#__#tbcolname#", "#tbname#-#tbcolname#", "all");
	}
	return formStr;
}

private String function setFormItems(tablecolumnArr) {
	SaveContent variable="itms" {
	    WriteOutput("[");
		for(a = 1; a <= ArrayLen(tablecolumnArr); a++) {
			WriteOutput("{
			");
			WriteOutput("				width: '95%',");
			WriteOutput("name: '#trim(tablecolumnArr[a][2])#-#trim(tablecolumnArr[a][3])#',
			");
			if(trim(tablecolumnArr[a][4]) eq "") {
				WriteOutput("				fieldLabel: '#trim(tablecolumnArr[a][2])##trim(tablecolumnArr[a][3])#',
				");
			} else {
				WriteOutput("				fieldLabel: '#tablecolumnArr[a][4]#',
				");
			}
			WriteOutput("			padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
			");
			WriteOutput("			}");
			if (a != ArrayLen(tablecolumnArr)) WriteOutput(",");
		}
		WriteOutput("]");
	}

	return itms;
}

public string function setToolbarChangeWin(required String changetype, tablecolumnArr, querycode, querygrid,querycodeAsNameSpace) {
	SaveContent variable="cview" {
	    if (changetype == "DELETE") {
	       WriteOutput("
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
			");
	    } else if (changetype == "ADD") {
	        var rstring = setUpAddForm(tablecolumnArr, querycode, querygrid,querycodeAsNameSpace, "Add");
			WriteOutput(rstring);
		} else if (changetype == "COPY") {
			var rstring = setUpAddForm(tablecolumnArr, querycode, querygrid,querycodeAsNameSpace, "Copy");
			WriteOutput(rstring);
			WriteOutput("		var df = fwin.down('form').getForm();
				var dgdata = b.up('grid').getSelectionModel().getSelection()[0];
				if (dgdata) df.setValues(dgdata.data);
				else {
					Ext.Msg.alert('Message', 'No selection to copy.');
					fwin.close();
				}
			");
		} else if (changetype == "EDIT") {
			WriteOutput("
	       	    Ext.Msg.alert('Message', 'To begin editing, please double click a row or a cell of a specific record.');
			");
		}
	}
	return cview;
}

private String function setUpAddForm(required Array tablecolumnArr,
									required String querycode,
									querygrid, required String querycodeAsNameSpace, String dtitle) {

	var formitems = setAddFormItems(tablecolumnArr, querycode, querygrid,querycodeAsNameSpace);
	SaveContent variable="temail" {
		WriteOutput("
				var fwin = Ext.create('Ext.window.Window', {
				    title: '#dtitle#',
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
				    	items: #formitems#
				    }],
				    buttons: [{
				    	text: '#dtitle#',
				    	handler: function(em) {
				    		var dwin = em.up('window');
				    		var dform = dwin.down('form').getForm();
				    		var formValues = dform.getValues();
				    		if (dform.isValid()) {
				    			var dgrid = Ext.widget('#querycodeAsNameSpace#');
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

		");
	}
	return temail;
}

private String function setAddFormItems(required Array tablecolumnArr,
									required String querycode,
									querygrid, required String querycodeAsNameSpace) {
	SaveContent variable="itms" {
	    WriteOutput("[");
		for(a = 1; a <= ArrayLen(tablecolumnArr); a++) {
		var columndef = EntityLoad("EGRGQRYCOLUMN",tablecolumnArr[a][1],true);
		if (columndef.getCOLUMNDISABLED() == true) continue;
			WriteOutput("{
			");
			WriteOutput("				width: '95%',");
			WriteOutput("name: '#trim(tablecolumnArr[a][2])#-#trim(tablecolumnArr[a][3])#',
			");
			if(trim(tablecolumnArr[a][4]) eq "") {
				WriteOutput("				fieldLabel: '#trim(tablecolumnArr[a][2])##trim(tablecolumnArr[a][3])#',
				");
			} else {
				WriteOutput("				fieldLabel: '#tablecolumnArr[a][4]#',
				");
			}

			var dxtype = "textfield";
			if (trim(columndef.getOUTPUTTYPE()) eq "" || trim(columndef.getOUTPUTTYPE()) eq "string") dxtype = "textfield";
			else if (trim(columndef.getOUTPUTTYPE()) eq "boolean") dxtype = "textfield";
			else if (trim(columndef.getOUTPUTTYPE()) eq "checkcolumn") dxtype = "textfield";
			else if (trim(columndef.getOUTPUTTYPE()) eq "date") dxtype = "datefield";
			else if (trim(columndef.getOUTPUTTYPE()) eq "int" || trim(columndef.getOUTPUTTYPE()) eq "float") dxtype = "numberfield";
			else if (trim(columndef.getOUTPUTTYPE()) eq "actioncolumn") dxtype = "textfield";
			else if (trim(columndef.getOUTPUTTYPE()) eq "templatecolumn") dxtype = "textfield";

			WriteOutput("			padding: 10,
						 	labelAlign: 'top',
						 	xtype: '#dxtype#'
			");
			WriteOutput("			}");
			if (a != ArrayLen(tablecolumnArr)) WriteOutput(",");
		}
		WriteOutput("]");
	}

	return itms;
}

public string function setToolbarExportWin(tablecolumnArr,querycode,querygrid,querycodeAsNameSpace) {
	SaveContent variable="texport" {
		WriteOutput("
					var dgrid = b.up('grid');
					dgrid.getEl().mask('Exporting...');
					var qrytitle = '#querygrid.getQRYTITLE()#';
					var qrycode = '#querycode#';
					Ext.#querycodeAsNameSpace#.Data.exportGridToExcel(qrycode, qrytitle, function(res) {
						dgrid.getEl().unmask();
						if (res.result !== true) {
							Ext.Msg.alert('Error','A problem occurred while exporting the record to excel.');
						} else {
						 	window.location.href = '#session.domain#unDB/temp/' + qrytitle + '.xls';
						}
					});
		");
	}
	return texport;
}

public string function setToolbarEmailWin(required String querycodeAsNameSpace) {

	var emailitems = setEmailItems();
	SaveContent variable="temail" {
		WriteOutput("
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
				    	items: #emailitems#
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
					    		Ext.#querycodeAsNameSpace#.Data.emailSelGridQuery(fromv,tov,subjectv,bodyv,function(res) {
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
  						Ext.ux.grid.Printer.bannerLogo = '<img src=""' + GLOBAL_VARS_DIRECT.COMPANYLOGO + '"" width=""150"" height=""35px"" />';
  					}
				var dgridrecord = Ext.ux.grid.Printer.printToString(dgrid);
				var dgridtitle = dgrid.title;
				dform.getForm().setValues({bodyfield: dgridrecord, subjectfield: dgridtitle});
		");
	}
	return temail;
}

private String function setEmailItems() {
	SaveContent variable="itms" {
	    WriteOutput("[");
			WriteOutput("{
							xtype: 'textfield',
							padding: 10,
							width: 540,
							allowBlank: false,
							fieldLabel: 'From',
							name: 'fromfield',
							vtype: 'email',
							readOnly: true,
							value: '#session.profilename#'
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
						}");
		WriteOutput("]");
	}

	return itms;
}

}