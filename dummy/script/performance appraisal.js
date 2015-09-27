getAdditionalData: function(record, rowIndex, rowValues) {
    var headerCt = this.view.headerCt,
        colspan = headerCt.getColumnCount();
    var ro = {
        	rowBody : '<table ><tr><td border="1" colspan="4" bgcolor="yellow">1st Data</td></tr><tr><td border="1" colspan="1">2nd Data</td><td border="1" colspan="1">3rd Data</td><td border="1" colspan="1">4th Data</td><td border="1" colspan="1">5th Data</td></tr><tr><td border="1" colspan="1">6th Data</td><td border="1" colspan="3">7th Data</td></tr></table>',
        	rowBodyCls : (rowIndex % 2) ? 'bg-snow' : this.rowBodyCls,
        	rowBodyColspan : colspan
        };
    return ro;
}





function(value, summaryData, dataIndex) {
    return Ext.String.format('<b>{0}</b>', value); 
}

function(value, summaryData, dataIndex) {
    return Ext.String.format('<b>{0}</b>','OVERALL RATING for the BEHAVIORAL ASSESSMENT'); 
}



function(value,p,record) {
	var kracode = Ext.ComponentQuery.query("NS_7F2DFA1BB35774DAAC0B7E6E560AD435")[0]; /* Performance Appraisal */
	var krasel = kracode.getSelectionModel().getSelection()[0];
	record.data["eginpmsempba-KRACODEFK"] = krasel.data['eginpmsempkra-KRACODE'];
	if (krasel) {
		 return krasel.data['eginpmsempkra-KRACODE'];
	} 
	return value;
}

{
	   select: function(ds,rec) {
	      /*get rater grid*/
		  var raterg = Ext.ComponentQuery.query('NS_7EEFCEADE9112062D7B36FD6A5D72D51')[0];
		  if (raterg) {
		      var dparamStruct = {
					eginpmsrater_PMSCODEFK: rec.data['eginpms-PMSCODE']
			  };
			  var raterstore = raterg.getStore();
			  raterstore.load({
				params: {
					extraparams: dparamStruct
				}
			  });  
			  raterstore.proxy.extraParams.extraparams = dparamStruct;
		  }
	   }
	}


	{
	   select: function(ds,rec) {
	      /*get rater grid*/
		  var emptoberated = Ext.ComponentQuery.query('NS_7EFF35F8A5AD502E1796C19F3BD0C458')[0];
		  if (emptoberated) {
		      var dparamStruct = {
					eginpmsemp_RATERCODEFK: rec.data['eginpmsrater-RATERCODE'],
					cmfpa_SUPERIORCODE: rec.data['eginpmsrater-RATERPID']
			  };
			  var empstore = emptoberated.getStore();
			  empstore.load({
				params: {
					extraparams: dparamStruct
				}
			  });  
			  empstore.proxy.extraParams.extraparams = dparamStruct;
		  }
	   }
	}



	{
	   select: function(ds,rec) {
	      /*get rater grid*/
		  var kraothercomments = Ext.ComponentQuery.query('NS_7F2DFA1BB35774DAAC0B7E6E560AD435')[0];
		  if (kraothercomments) {
		      var dparamStruct = {
					eginpmsempkra_PMSEMPCODEFK: rec.data['eginpmsemp-PMSEMPCODE']
			  };
			  var empstore = kraothercomments.getStore();
			  empstore.load({
				params: {
					extraparams: dparamStruct
				}
			  });  
			  empstore.proxy.extraParams.extraparams = dparamStruct;
		  }
	   }
	}



	rowBodyTpl : [
		'<p><b>Key Result Area:</b>  {eglkpmskeyresultarea-KEYRESULTAREAS}</p>',
		'<p><b>Objective:</b>  {eglkpmskeyresultarea-OBJECTIVE}</p>',
		'<p><b>Key Result Indicator:</b>  {eglkpmskeyresultarea-KEYRESULTINDICATOR}</p>',
	]
	

	======================================
		
		rowBodyTpl : [
		          	'<p><b>Behavioral Competency Code:</b>  {eginpmsbehavioralcomp-BEHAVIORALCOMPCODE}</p>',
		              '<p><b>Group:</b>  {eginpmsbehavioralcomp-DGROUP}</p>',
		          	'<p><b>Subgroup:</b>  {eginpmsbehavioralcomp-SUBGROUP}</p>',
		          	'<p><b>Behavioral Competency:</b>  {eginpmsbehavioralcomp-BEHAVIORALCOMP}</p>',
		          	'<p><b>Order:</b>  {eginpmsbehavioralcomp-BCORDER}</p>',
		          ]
================================
	

{
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
		}