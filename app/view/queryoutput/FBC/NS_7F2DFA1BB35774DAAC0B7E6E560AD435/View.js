Ext.define('Form.view.queryoutput.FBC.NS_7F2DFA1BB35774DAAC0B7E6E560AD435.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.NS_7F2DFA1BB35774DAAC0B7E6E560AD435',
	loadMask: true,
	multiSelect: true,
	title: 'Key Result Area (Other Comments)',
	width: 320,
	height: 300,
	padding: 7,
	listeners: {
		   select: function(ds,rec) {
		      /*get rater grid*/
			  var kraitems = Ext.ComponentQuery.query('NS_7F51BEEEA06D8FF53401E9307A6E8030')[0]; /* KRA Items*/
			  var ba = Ext.ComponentQuery.query('NS_7F83CD85B0B7BB82976759BDED104907')[0]; /* Behavioral Assessment*/
			  var cp = Ext.ComponentQuery.query('NS_7F90DFD609223C063FAAD035CB569681')[0]; /* Career Planning */
			  var cpitems = Ext.ComponentQuery.query('NS_7FA56882E5332BCA44B0389F085788F5')[0]; /* Career Planning Developmental Plan */
			  var opr = Ext.ComponentQuery.query('NS_7FBD7325DA0172D1104151C954EF979D')[0]; /* Overall Performance Rating */
			  
			  if (kraitems) {
			      var dparamStruct = {
						eginpmsempkraitems_KRACODEFK: rec.data['eginpmsempkra-KRACODE']
				  };
				  var dstore = kraitems.getStore();
				  dstore.load({
					params: {
						extraparams: dparamStruct
					}
				  });  
				  dstore.proxy.extraParams.extraparams = dparamStruct;
			  }
			  
			  var pmscode = Ext.ComponentQuery.query('NS_3F607CFAA23CB277D5B0D2BFD80E8613')[0]; /* Performance Appraisal */
			  var pmssel = pmscode.getSelectionModel().getSelection()[0];
			  if (pmssel) {
				  if (ba) {
					  var dparamStruct = {
							eginpmsbehavioralcomp_PMSCODEFK: pmssel.data["eginpms-PMSCODE"]
					  };
					  var dstore = ba.getStore();
					  dstore.load({
						params: {
							extraparams: dparamStruct
						}
					  });  
					  dstore.proxy.extraParams.extraparams = dparamStruct;
				  }
			  } else {
				alert('No pms selection');
			  }
			  
			  if (cp) {
			      var dparamStruct = {
						eginpmsempcp_KRACODEFK: rec.data['eginpmsempkra-KRACODE']
				  };
				  var dstore = cp.getStore();
				  dstore.load({
					params: {
						extraparams: dparamStruct
					}
				  });  
				  dstore.proxy.extraParams.extraparams = dparamStruct;
			  }
			  
			  if (cpitems) {
			      var dparamStruct = {
						eginpmsempcpitems_KRACODEFK: rec.data['eginpmsempkra-KRACODE']
				  };
				  var dstore = cpitems.getStore();
				  dstore.load({
					params: {
						extraparams: dparamStruct
					}
				  });  
				  dstore.proxy.extraParams.extraparams = dparamStruct;
			  }
			  
			  if (opr) {
			      var dparamStruct = {
						eginpmsempopr_KRACODEFK: rec.data['eginpmsempkra-KRACODE']
				  };
				  var dstore = opr.getStore();
				  dstore.load({
					params: {
						extraparams: dparamStruct
					}
				  });  
				  dstore.proxy.extraParams.extraparams = dparamStruct;
			  }  
		   }
		},

	store    : 'queryoutput.FBC.NS_7F2DFA1BB35774DAAC0B7E6E560AD435.Store',
	
    features: [{
		ftype: 'filters',
		encode: true,
		local: false
	}],
    plugins: [{	ptype: 'rowediting',	clicksToEdit: 2,
				clicksToMoveEditor: 2,
			actionend: ''	}],
    columns: [{
		text: 'KRA Code',
		dataIndex: 'eginpmsempkra-KRACODE',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '3CB8E6912BB913769CE6F39460F4A73C'
	},{
		text: 'PMS Emp Code Fk',
		dataIndex: 'eginpmsempkra-PMSEMPCODEFK',
		filterable: true,
		sortable: true,
		width: 150,
		hidden: true,
		action: '915E4CADC7B406F8CE9A84F88484A805'
	},{text: 'Assessment Period', columns: [{
		text: 'From',
		dataIndex: 'eginpmsempkra-ASSESSMENTPERIODFROM',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 100,
		editor: 'datefield',
		xtype: 'datecolumn',
		action: '44A4123431A958AA2BA06619E020BC2E'
	},{
		text: 'To',
		dataIndex: 'eginpmsempkra-ASSESSMENTPERIODTO',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 100,
		editor: 'datefield',
		xtype: 'datecolumn',
		action: '75A0115F9CC10C3E927EC8C90796A667'
	}]},{
		text: 'Purpose of Performance of Appraisal',
		dataIndex: 'eginpmsempkra-PURPOSEOFPA',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 300,
		editor: 'textfield',
		action: '47F8BB639B2D1B7A7925B023A9427845'
	},{
		text: 'Other Comments',
		dataIndex: 'eginpmsempkra-OTHERCOMMENTS',
		filterable: true,
		sortable: true,
		align: 'center',
		width: 300,
		editor: 'textfield',
		action: '74F231F3E244FD23DC139402676E06CF'
	}],
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.FBC.NS_7F2DFA1BB35774DAAC0B7E6E560AD435.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});