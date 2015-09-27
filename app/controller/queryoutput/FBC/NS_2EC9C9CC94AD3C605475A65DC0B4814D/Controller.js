Ext.define('Form.controller.queryoutput.FBC.NS_2EC9C9CC94AD3C605475A65DC0B4814D.Controller', {
   	extend: 'Ext.app.Controller',
   	views: ['queryoutput.FBC.NS_2EC9C9CC94AD3C605475A65DC0B4814D.View'],
   	models: ['queryoutput.FBC.NS_2EC9C9CC94AD3C605475A65DC0B4814D.Model'],
   	stores: ['queryoutput.FBC.NS_2EC9C9CC94AD3C605475A65DC0B4814D.Store'],
   		init: function() {
   			this.control({
   				'panel': {
   					render: this.initPanel
   				},
   				'NS_2EC9C9CC94AD3C605475A65DC0B4814D button': {
   					click: this.topBarButtonClicked
   				},
   				'NS_2EC9C9CC94AD3C605475A65DC0B4814D': {
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
				    	id: 'viewform523FE4E6-FD01-FFE8-10F869D0CA8E09F5',
				    	autoScroll: true,
				    	items: [{
							width: '95%',name: 'cin21personalinfo-BIRTHDAY',
							fieldLabel: 'Birthday',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-AGE',
							fieldLabel: 'Age',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-BIRTHPLACE',
							fieldLabel: 'Birthplace',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-CITIZENSHIP',
							fieldLabel: 'Citizenship',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-CITYPROVINCE',
							fieldLabel: 'City or Province',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-CIVILSTATUS',
							fieldLabel: 'Civil Status',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-CONTACTADDRESS',
							fieldLabel: 'Contact Address',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-CONTACTADDRESS2',
							fieldLabel: 'Contact Address 2',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-CONTACTADDRESS3',
							fieldLabel: 'Contact Address 3',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-SEX',
							fieldLabel: 'Gender',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-ACRNUMBER',
							fieldLabel: 'ACR Number',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-ACRDATEISSUED',
							fieldLabel: 'ACR Date Issued',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-ACREXPIRATIONDATE',
							fieldLabel: 'ACR Expiration Date',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-CONTACTCELLNUMBER',
							fieldLabel: 'Mobile Number',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-CONTACTPAGERNO',
							fieldLabel: 'Contact Pager No',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-CONTACTTELNO',
							fieldLabel: 'Telephone Number',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-EMAILADDRESS',
							fieldLabel: 'Email Address',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-HEIGHT',
							fieldLabel: 'Height',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-WEIGHT',
							fieldLabel: 'Weight',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-LANGUAGEREAD',
							fieldLabel: 'Language Read',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-LANGUAGESPOKEN',
							fieldLabel: 'Language Spoken',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-LANGUAGEWRITTEN',
							fieldLabel: 'Language Written',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-MAIDENNAME',
							fieldLabel: 'Maiden Name',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-NATIONALITY',
							fieldLabel: 'Nationality',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-NUMBEROFCHILDREN',
							fieldLabel: 'Number of Children',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-OCCUPATIONCOMPANY',
							fieldLabel: 'Occupation or Company',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-PASSPORTNUMBER',
							fieldLabel: 'Passport Number',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-PASSPORTDATEISSUED',
							fieldLabel: 'Passport Date Issued',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-PERCELLNUMBER',
							fieldLabel: 'Per Cell Number',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-PERIODOFRESIDENCE',
							fieldLabel: 'Period of Residence',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-PERPAGERNUMBER',
							fieldLabel: 'Per Pager No',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-PERSONNELIDNO',
							fieldLabel: 'Personnel ID No',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-PERSONTOCONTACT',
							fieldLabel: 'Person to Contact',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-PLACEOFISSUANCE',
							fieldLabel: 'Place of Issuance',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-PROVPERIODOFRES',
							fieldLabel: 'Province Period of Residence',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-PROVTELNUMBER',
							fieldLabel: 'Provincial Tel No',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-PROVZIPCODE',
							fieldLabel: 'Prov Zip Code',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-RELATIONSHIP',
							fieldLabel: 'Relationship',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-RELIGIONCODE',
							fieldLabel: 'Religion Code',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-SPOUSENAME',
							fieldLabel: 'Spouse Name',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-STREETBARRIO',
							fieldLabel: 'Street or Barrio',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-STREETBARRIO2',
							fieldLabel: 'Street or Barrio 2',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-STREETBARRIO3',
							fieldLabel: 'Street or Barrio 3',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-TELEPHONENUMBER',
							fieldLabel: 'Tel Number 1',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-TELEPHONENUMBER2',
							fieldLabel: 'Tel Number 2',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-TELEPHONENUMBER3',
							fieldLabel: 'Tel Number 3',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-TOWNLOCALITY',
							fieldLabel: 'Town Locality',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-ZIPCODE',
							fieldLabel: 'Zip Code',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-PREVIOUSADDRESS',
							fieldLabel: 'Previous Address',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-PREVIOUSTELNUMBER',
							fieldLabel: 'Previous Tel No',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-PREVIOUSZIPCODE',
							fieldLabel: 'Previous Zip Code',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-PROVINCIALADDRESS',
							fieldLabel: 'Provincial Address',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-EMAILADDRESS2',
							fieldLabel: 'Alternative Email',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'displayfield'
						},{
							width: '95%',name: 'cin21personalinfo-EXPIRATIONDATE',
							fieldLabel: 'Expiration Date',
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
							width: '95%',name: 'cin21personalinfo-BIRTHDAY',
							fieldLabel: 'Birthday',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'datefield'
						},{
							width: '95%',name: 'cin21personalinfo-AGE',
							fieldLabel: 'Age',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'numberfield'
						},{
							width: '95%',name: 'cin21personalinfo-BIRTHPLACE',
							fieldLabel: 'Birthplace',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-CITIZENSHIP',
							fieldLabel: 'Citizenship',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-CITYPROVINCE',
							fieldLabel: 'City or Province',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-CIVILSTATUS',
							fieldLabel: 'Civil Status',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-CONTACTADDRESS',
							fieldLabel: 'Contact Address',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-CONTACTADDRESS2',
							fieldLabel: 'Contact Address 2',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-CONTACTADDRESS3',
							fieldLabel: 'Contact Address 3',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-SEX',
							fieldLabel: 'Gender',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-ACRNUMBER',
							fieldLabel: 'ACR Number',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-ACRDATEISSUED',
							fieldLabel: 'ACR Date Issued',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'datefield'
						},{
							width: '95%',name: 'cin21personalinfo-ACREXPIRATIONDATE',
							fieldLabel: 'ACR Expiration Date',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'datefield'
						},{
							width: '95%',name: 'cin21personalinfo-CONTACTCELLNUMBER',
							fieldLabel: 'Mobile Number',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-CONTACTPAGERNO',
							fieldLabel: 'Contact Pager No',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-CONTACTTELNO',
							fieldLabel: 'Telephone Number',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-EMAILADDRESS',
							fieldLabel: 'Email Address',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-HEIGHT',
							fieldLabel: 'Height',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-WEIGHT',
							fieldLabel: 'Weight',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-LANGUAGEREAD',
							fieldLabel: 'Language Read',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-LANGUAGESPOKEN',
							fieldLabel: 'Language Spoken',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-LANGUAGEWRITTEN',
							fieldLabel: 'Language Written',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-MAIDENNAME',
							fieldLabel: 'Maiden Name',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-NATIONALITY',
							fieldLabel: 'Nationality',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-NUMBEROFCHILDREN',
							fieldLabel: 'Number of Children',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'numberfield'
						},{
							width: '95%',name: 'cin21personalinfo-OCCUPATIONCOMPANY',
							fieldLabel: 'Occupation or Company',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PASSPORTNUMBER',
							fieldLabel: 'Passport Number',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PASSPORTDATEISSUED',
							fieldLabel: 'Passport Date Issued',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'datefield'
						},{
							width: '95%',name: 'cin21personalinfo-PERCELLNUMBER',
							fieldLabel: 'Per Cell Number',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PERIODOFRESIDENCE',
							fieldLabel: 'Period of Residence',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PERPAGERNUMBER',
							fieldLabel: 'Per Pager No',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PERSONNELIDNO',
							fieldLabel: 'Personnel ID No',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PERSONTOCONTACT',
							fieldLabel: 'Person to Contact',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PLACEOFISSUANCE',
							fieldLabel: 'Place of Issuance',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PROVPERIODOFRES',
							fieldLabel: 'Province Period of Residence',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PROVTELNUMBER',
							fieldLabel: 'Provincial Tel No',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PROVZIPCODE',
							fieldLabel: 'Prov Zip Code',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-RELATIONSHIP',
							fieldLabel: 'Relationship',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-RELIGIONCODE',
							fieldLabel: 'Religion Code',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-SPOUSENAME',
							fieldLabel: 'Spouse Name',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-STREETBARRIO',
							fieldLabel: 'Street or Barrio',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-STREETBARRIO2',
							fieldLabel: 'Street or Barrio 2',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-STREETBARRIO3',
							fieldLabel: 'Street or Barrio 3',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-TELEPHONENUMBER',
							fieldLabel: 'Tel Number 1',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-TELEPHONENUMBER2',
							fieldLabel: 'Tel Number 2',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-TELEPHONENUMBER3',
							fieldLabel: 'Tel Number 3',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-TOWNLOCALITY',
							fieldLabel: 'Town Locality',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-ZIPCODE',
							fieldLabel: 'Zip Code',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PREVIOUSADDRESS',
							fieldLabel: 'Previous Address',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PREVIOUSTELNUMBER',
							fieldLabel: 'Previous Tel No',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PREVIOUSZIPCODE',
							fieldLabel: 'Previous Zip Code',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PROVINCIALADDRESS',
							fieldLabel: 'Provincial Address',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-EMAILADDRESS2',
							fieldLabel: 'Alternative Email',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-EXPIRATIONDATE',
							fieldLabel: 'Expiration Date',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'datefield'
						}]
				    }],
				    buttons: [{
				    	text: 'Add',
				    	handler: function(em) {
				    		var dwin = em.up('window');
				    		var dform = dwin.down('form').getForm();
				    		var formValues = dform.getValues();
				    		if (dform.isValid()) {
				    			var dgrid = Ext.widget('NS_2EC9C9CC94AD3C605475A65DC0B4814D');
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
							width: '95%',name: 'cin21personalinfo-BIRTHDAY',
							fieldLabel: 'Birthday',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'datefield'
						},{
							width: '95%',name: 'cin21personalinfo-AGE',
							fieldLabel: 'Age',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'numberfield'
						},{
							width: '95%',name: 'cin21personalinfo-BIRTHPLACE',
							fieldLabel: 'Birthplace',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-CITIZENSHIP',
							fieldLabel: 'Citizenship',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-CITYPROVINCE',
							fieldLabel: 'City or Province',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-CIVILSTATUS',
							fieldLabel: 'Civil Status',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-CONTACTADDRESS',
							fieldLabel: 'Contact Address',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-CONTACTADDRESS2',
							fieldLabel: 'Contact Address 2',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-CONTACTADDRESS3',
							fieldLabel: 'Contact Address 3',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-SEX',
							fieldLabel: 'Gender',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-ACRNUMBER',
							fieldLabel: 'ACR Number',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-ACRDATEISSUED',
							fieldLabel: 'ACR Date Issued',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'datefield'
						},{
							width: '95%',name: 'cin21personalinfo-ACREXPIRATIONDATE',
							fieldLabel: 'ACR Expiration Date',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'datefield'
						},{
							width: '95%',name: 'cin21personalinfo-CONTACTCELLNUMBER',
							fieldLabel: 'Mobile Number',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-CONTACTPAGERNO',
							fieldLabel: 'Contact Pager No',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-CONTACTTELNO',
							fieldLabel: 'Telephone Number',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-EMAILADDRESS',
							fieldLabel: 'Email Address',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-HEIGHT',
							fieldLabel: 'Height',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-WEIGHT',
							fieldLabel: 'Weight',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-LANGUAGEREAD',
							fieldLabel: 'Language Read',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-LANGUAGESPOKEN',
							fieldLabel: 'Language Spoken',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-LANGUAGEWRITTEN',
							fieldLabel: 'Language Written',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-MAIDENNAME',
							fieldLabel: 'Maiden Name',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-NATIONALITY',
							fieldLabel: 'Nationality',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-NUMBEROFCHILDREN',
							fieldLabel: 'Number of Children',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'numberfield'
						},{
							width: '95%',name: 'cin21personalinfo-OCCUPATIONCOMPANY',
							fieldLabel: 'Occupation or Company',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PASSPORTNUMBER',
							fieldLabel: 'Passport Number',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PASSPORTDATEISSUED',
							fieldLabel: 'Passport Date Issued',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'datefield'
						},{
							width: '95%',name: 'cin21personalinfo-PERCELLNUMBER',
							fieldLabel: 'Per Cell Number',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PERIODOFRESIDENCE',
							fieldLabel: 'Period of Residence',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PERPAGERNUMBER',
							fieldLabel: 'Per Pager No',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PERSONNELIDNO',
							fieldLabel: 'Personnel ID No',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PERSONTOCONTACT',
							fieldLabel: 'Person to Contact',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PLACEOFISSUANCE',
							fieldLabel: 'Place of Issuance',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PROVPERIODOFRES',
							fieldLabel: 'Province Period of Residence',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PROVTELNUMBER',
							fieldLabel: 'Provincial Tel No',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PROVZIPCODE',
							fieldLabel: 'Prov Zip Code',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-RELATIONSHIP',
							fieldLabel: 'Relationship',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-RELIGIONCODE',
							fieldLabel: 'Religion Code',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-SPOUSENAME',
							fieldLabel: 'Spouse Name',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-STREETBARRIO',
							fieldLabel: 'Street or Barrio',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-STREETBARRIO2',
							fieldLabel: 'Street or Barrio 2',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-STREETBARRIO3',
							fieldLabel: 'Street or Barrio 3',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-TELEPHONENUMBER',
							fieldLabel: 'Tel Number 1',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-TELEPHONENUMBER2',
							fieldLabel: 'Tel Number 2',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-TELEPHONENUMBER3',
							fieldLabel: 'Tel Number 3',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-TOWNLOCALITY',
							fieldLabel: 'Town Locality',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-ZIPCODE',
							fieldLabel: 'Zip Code',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PREVIOUSADDRESS',
							fieldLabel: 'Previous Address',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PREVIOUSTELNUMBER',
							fieldLabel: 'Previous Tel No',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PREVIOUSZIPCODE',
							fieldLabel: 'Previous Zip Code',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-PROVINCIALADDRESS',
							fieldLabel: 'Provincial Address',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-EMAILADDRESS2',
							fieldLabel: 'Alternative Email',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'textfield'
						},{
							width: '95%',name: 'cin21personalinfo-EXPIRATIONDATE',
							fieldLabel: 'Expiration Date',
							padding: 10,
						 	labelAlign: 'top',
						 	xtype: 'datefield'
						}]
				    }],
				    buttons: [{
				    	text: 'Copy',
				    	handler: function(em) {
				    		var dwin = em.up('window');
				    		var dform = dwin.down('form').getForm();
				    		var formValues = dform.getValues();
				    		if (dform.isValid()) {
				    			var dgrid = Ext.widget('NS_2EC9C9CC94AD3C605475A65DC0B4814D');
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
					var qrytitle = 'Personal Info';
					var qrycode = '2EC9C9CC-94AD-3C60-5475A65DC0B4814D';
					Ext.NS_2EC9C9CC94AD3C605475A65DC0B4814D.Data.exportGridToExcel(qrycode, qrytitle, function(res) {
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
					    		Ext.NS_2EC9C9CC94AD3C605475A65DC0B4814D.Data.emailSelGridQuery(fromv,tov,subjectv,bodyv,function(res) {
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
   			var qc = '2EC9C9CC-94AD-3C60-5475A65DC0B4814D';
   			Ext.NS_2EC9C9CC94AD3C605475A65DC0B4814D.Data.getUserToolbars(qc, function(res) {
   				if (res.success) {
   					dis.addDocked(res);
   				}
   			});
   		},
   		gridRecordedSelected: function(dis, rec, ind) {
   			var formCmp = Ext.getCmp('viewform523FE4E6-FD01-FFE8-10F869D0CA8E09F5') || Ext.getCmp('autoeformididid');
   			if (formCmp) {
   				formCmp.getForm().setValues(rec.data);
   			}
   		}
})