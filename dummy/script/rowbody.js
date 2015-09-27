getAdditionalData: function(record, rowIndex, rowValues) {
    var headerCt = this.view.headerCt,
        colspan = headerCt.getColumnCount();
    try {
    	var myname = GLOBAL_VARS_DIRECT['FIRSTNAME'] + ' ' + GLOBAL_VARS_DIRECT['MIDDLENAME'] + ' ' + GLOBAL_VARS_DIRECT['LASTNAME'];
    } catch (e) {
    	var myname = "_";
    }
    var ro = {
        	rowBody : '<p><b>Name: </b>' + myname + '</p>' + '<p><b>Personnel ID: </b>' + record['cmfpa-PERSONNELIDNO'] + '</p>' + '<p><b>Date Hired: </b>' + Ext.util.Format.date(record['cmfpa-DATEHIRED'], 'F j, Y') + '</p>' + '</p>' + '<p><b>Position: </b>' + record['clkposition-DESCRIPTION'] + '</p>' + '<p><b>Department: </b>' + record['clkdepartment-DESCRIPTION'] + '</p>' + '<p><b>Guid: </b>' + record['cmfpa-GUID'] + '</p>' + '</p>' + '<p><b>Superior: </b>' + record['cmfpa-FIRSTNAME'] + ' ' + record['cmfpa-LASTNAME'] + '</p>',
        	rowBodyCls : (rowIndex % 2) ? 'bg-snow' : this.rowBodyCls,
        	rowBodyColspan : colspan
        };
    return ro;
}

getAdditionalData: function(record, rowIndex, rowValues) {
    var headerCt = this.view.headerCt,
        colspan = headerCt.getColumnCount();
    var ro = {
        	rowBody : '<p><b>Name: </b>' + myname + '</p>' + '<p><b>Personnel ID: </b>' + record['cmfpa-PERSONNELIDNO'] + '</p>' + '<p><b>Date Hired: </b>' + Ext.util.Format.date(record['cmfpa-DATEHIRED'], 'F j, Y') + '</p>' + '</p>' + '<p><b>Position: </b>' + record['clkposition-DESCRIPTION'] + '</p>' + '<p><b>Department: </b>' + record['clkdepartment-DESCRIPTION'] + '</p>' + '<p><b>Guid: </b>' + record['cmfpa-GUID'] + '</p>' + '</p>' + '<p><b>Superior: </b>' + record['cmfpa-FIRSTNAME'] + ' ' + record['cmfpa-LASTNAME'] + '</p>',
        	rowBodyCls : (rowIndex % 2) ? 'bg-snow' : this.rowBodyCls,
        	rowBodyColspan : colspan
        };
    return ro;
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