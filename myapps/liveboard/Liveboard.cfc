component  output=false persistent=false ExtDirect=true name="Liveboard"
{
	public struct function ReadNow(required string page,
								   required string start,
								   required string limit,
								   required any sort,
								   required any filter) ExtDirect=true
	{
		theargs = StructNew();
		theargs["page"] = page;
	    theargs["start"] = start;
	    theargs["limit"] = limit;
	    theargs["sort"] = sort;
	    theargs["filter"] = filter;

	    var bcObj = Createobject("component","IBOSE.application.GridQuery");
	    var dresult = bcObj.buildCondition(argumentCollection="#theargs#");
		var WHERE = dresult["where"];
		var ORDERBY = dresult["orderby"];

		var dsource = ORMExecuteQuery("FROM EGRGLIVEBOARD #PreserveSingleQuotes(WHERE)# ORDER BY #ORDERBY#", false, {offset=#start#, maxResults=#limit#, timeout=150} );

	    var countAll = ORMExecuteQuery("SELECT COUNT(*) AS TOTALREC FROM EGRGLIVEBOARD #PreserveSingleQuotes(WHERE)#", true );

	    var resultArr = ArrayNew(1);
		var rootstuct = StructNew();
		rootstuct["totalCount"] = countAll;

		for(i=1; i<=ArrayLen(dsource); i++) {

			tmpresult = StructNew();
			tmpresult["LIVEBOARDCODE"] = dsource[i].getLIVEBOARDCODE();
			tmpresult["LBTITLE"] 	= dsource[i].getLBTITLE();
			tmpresult["LIVEBOARDDESC"] = dsource[i].getLIVEBOARDDESC();
			tmpresult["LBSTATUS"] 	= dsource[i].getLBSTATUS();
			tmpresult["TABLECOLUMNS"] 	= dsource[i].getTABLECOLUMNS();
			tmpresult["WIDTH"] 	= dsource[i].getWIDTH();
			tmpresult["HEIGHT"] 	= dsource[i].getHEIGHT();
			tmpresult["RECDATECREATED"] 	= dsource[i].getRECDATECREATED();
			tmpresult["RECCREATEDBY"] 	= dsource[i].getRECCREATEDBY();

			ArrayAppend(resultArr,tmpresult);
		}

		rootstuct['topics'] = resultArr;
		return rootstuct;
	}

	public struct function ReadLiveBoardItem(required string page,
								   required string start,
								   required string limit,
								   required any sort,
								   required any filter,
								   required string liveboardcode) ExtDirect=true
	{
		theargs = StructNew();
		theargs["page"] = page;
	    theargs["start"] = start;
	    theargs["limit"] = limit;
	    theargs["sort"] = sort;
	    theargs["filter"] = filter;

	    var bcObj = Createobject("component","IBOSE.application.GridQuery");
	    var dresult = bcObj.buildCondition(argumentCollection="#theargs#");
		var WHERE = dresult["where"];
		var ORDERBY = dresult["orderby"];

		if (trim(WHERE) != "") {
			var whereb = "#WHERE# AND LIVEBOARDCODE = '#liveboardcode#'";
		} else {
			var whereb = "WHERE LIVEBOARDCODE = '#liveboardcode#'";
		}

		var dsource = ORMExecuteQuery("FROM EGRGLIVEBOARDITEM #PreserveSingleQuotes(whereb)# ORDER BY #ORDERBY#", false, {offset=#start#, maxResults=#limit#, timeout=150} );

	    var countAll = ORMExecuteQuery("SELECT COUNT(*) AS TOTALREC FROM EGRGLIVEBOARDITEM #PreserveSingleQuotes(whereb)#", true );

	    var resultArr = ArrayNew(1);
		var rootstuct = StructNew();
		rootstuct["totalCount"] = countAll;

		for(i=1; i<=ArrayLen(dsource); i++) {

			tmpresult = StructNew();
			tmpresult["LIVEBOARDITEMCODE"] = dsource[i].getLIVEBOARDITEMCODE();
			tmpresult["LIVEBOARDCODE"] 	= dsource[i].getLIVEBOARDCODE();
			tmpresult["XTYPE"] = dsource[i].getXTYPE();
            if (trim(dsource[i].getXTYPE()) != "") {
				var qrySource = EntityLoad("EGRGQUERY", dsource[i].getXTYPE(), true);
				if (IsDefined("qrySource")) tmpresult["XTYPETITLE"] 	= qrySource.getEQRYNAME();
				else tmpresult["XTYPETITLE"] 	= "";
            } else {
            	tmpresult["XTYPETITLE"] 	= "";
            }

			tmpresult["ROWSPAN"] 	= dsource[i].getROWSPAN();
			tmpresult["COLSPAN"] 	= dsource[i].getCOLSPAN();
			tmpresult["BODYSTYLE"] 	= dsource[i].getBODYSTYLE();
			tmpresult["CELLCLS"] 	= dsource[i].getCELLCLS();
			tmpresult["HTML"] 	= dsource[i].getHTML();
			tmpresult["ITEMORDER"] 	= dsource[i].getITEMORDER();
			tmpresult["LIVEBOARDITEMEXTRA"] = dsource[i].getLIVEBOARDITEMEXTRA();

			ArrayAppend(resultArr,tmpresult);
		}

		rootstuct['topics'] = resultArr;
		return rootstuct;
	}

	public struct function ActivateNow(required string liveboardcode) ExtDirect=true {

		try {
			var rs = StructNew();
			var lbsource = EntityLoad("EGRGLIVEBOARD", liveboardcode, true);
			var lbitemsource = EntityLoad("EGRGLIVEBOARDITEM", {LIVEBOARDCODE=#liveboardcode#},"ITEMORDER ASC");
			if (IsDefined("lbsource") && ArrayLen(lbitemsource) > 0) {
				var hc = CreateObject("component", "Helper");
				var liveboardcodeNS = "LB_" & rereplace(liveboardcode, "\W", "", "all");
				hc.setController(liveboardcode, liveboardcodeNS, lbsource, lbitemsource);
				hc.setModel(liveboardcode, liveboardcodeNS,  lbsource, lbitemsource);
				hc.setStore(liveboardcode, liveboardcodeNS,  lbsource, lbitemsource);
				hc.setView(liveboardcode, liveboardcodeNS,  lbsource, lbitemsource);
				hc.setApi(liveboardcode, liveboardcodeNS,  lbsource, lbitemsource);
				hc.setDirect(liveboardcode, liveboardcodeNS,  lbsource, lbitemsource);
				hc.setRouter(liveboardcode, liveboardcodeNS,  lbsource, lbitemsource);
				hc.setAppJS(liveboardcode, liveboardcodeNS,  lbsource, lbitemsource);
				hc.setIndex(liveboardcode, liveboardcodeNS,  lbsource, lbitemsource);

				// Database part
				// Delete first existing data then insert these data
				// set App Menu
				// set App Menu User (this user)
				// set App
				// set App Region
				// set App User

				var d = CreateObject("component", "Database");
				d.setAppMenu(liveboardcode, liveboardcodeNS,  lbsource, lbitemsource);
				d.setUserApp(liveboardcode, liveboardcodeNS,  lbsource, lbitemsource);
				rs["success"] = true;
			} else {
				rs["success"] = false;
				rs["message"] = "Either the liveboard selected or its item(s) was removed. Please verify.";
			}

			lbsource.setLBSTATUS("ACTIVE");
			EntitySave(lbsource);
			OrmFlush();
			return rs;

		} catch(any e) {
			var rs = StructNew();
			rs["success"] = false;
			rs["message"] = e.message & " " & e.detail;
			return rs;
		}
	}

	public struct function DeactivateNow(required string liveboardcode) ExtDirect=true {
		try {
			var rs = StructNew();
			var lbsource = EntityLoad("EGRGLIVEBOARD", liveboardcode, true);
			var lbitemsource = EntityLoad("EGRGLIVEBOARDITEM", {LIVEBOARDCODE=#liveboardcode#},"ITEMORDER ASC");
			if (IsDefined("lbsource")) {

				var hc = CreateObject("component", "Helper");
				var liveboardcodeNS = "LB_" & rereplace(liveboardcode, "\W", "", "all");
				hc.removeLiveboardCode(liveboardcode, liveboardcodeNS, "../../", "dashboard");

				var d = CreateObject("component", "Database");
				d.removeLiveboardData(liveboardcode);

				lbsource.setLBSTATUS("NOTACTIVE");
				EntitySave(lbsource);
				rs["success"] = true;

			} else {
				rs["success"] = false;
				rs["message"] = "Liveboard selected was forcefully removed.";
			}


			OrmFlush();
			return rs;
		} catch(any e) {
			var rs = StructNew();
			rs["success"] = false;
			rs["message"] = e.message & " " & e.detail;
			return rs;
		}
	}

}
