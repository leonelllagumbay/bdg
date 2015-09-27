/**
 * Component that processes the output of the query!
 *
 * @author LEONELL
 * @date 4/6/15
 **/
component displayname="OutputProcess" ExtDirect="true" accessors=true output=false persistent=false {

	public struct function Create(Args) ExtDirect="true" {
		ret = StructNew();

		return ret;
	}

	public struct function Read(required string page,
								required string start,
								required string limit,
								required any sort,
								required any filter,
								required string querycode,
								required array extraparams) ExtDirect="true" {

		qryObj = Createobject("component", "IBOSE.application.GridQuery");
		dresult = qryObj.buildCondition(page, start, limit, sort, filter);


		WHERE = dresult['where'];
		ORDERBY = dresult['orderby'];

		// SELECT part > DISPLAY & FIELDALIAS
		selectArr = ArrayNew(1);
		columnStruct = StructNew();
		selectObj = EntityLoad("EGRGEVIEWFIELDS", {EQRYCODEFK = "#querycode#"}, false);
		for (a = 1; a <= ArrayLen(selectObj); a++) {
			if(trim(selectObj[a].getFIELDALIAS()) eq "") {
				ArrayAppend(selectArr, selectObj[a].getDISPLAY());
				columnStruct["#selectObj[a].getFIELDNAME()#"] = "#selectObj[a].getTABLENAME()##selectObj[a].getFIELDNAME()#";
			} else {
				ArrayAppend(selectArr, selectObj[a].getDISPLAY() & " AS '" & selectObj[a].getFIELDALIAS() & "'");
				columnStruct["#selectObj[a].getFIELDALIAS()#"] = "#selectObj[a].getTABLENAME()##selectObj[a].getFIELDNAME()#";
			}

		}
		selectStr = ArrayToList(selectArr, ", ");

		// FROM part
		fromArr = ArrayNew(1);
		fromObj = EntityLoad("EGRGEVIEWJOINEDTABLES", {EQRYCODEFK = "#querycode#"}, "COLUMNORDER ASC");
		if (ArrayLen(fromObj) > 0) {
			for (a = 1; a <= ArrayLen(fromObj); a++) {
				ArrayAppend(fromArr, fromObj[a].getDISPLAY());
			}
			fromStr = ArrayToList(fromArr, " ");
		} else {
			fromObj = EntityLoad("EGRGEVIEWTABLES", {EQRYCODEFK = "#querycode#"}, "COLUMNORDER ASC");
			for (a = 1; a <= ArrayLen(fromObj); a++) {
				ArrayAppend(fromArr, fromObj[a].getTEMPTABLE() & " " & fromObj[a].getTABLEALIAS());
			}
			fromStr = ArrayToList(fromArr, ", ");
		}


		// WHERE part
		whereArr = ArrayNew(1);
		whereObj = EntityLoad("EGRGEVIEWCONDITION", {EQRYCODEFK = "#querycode#"}, "COLUMNORDER ASC");
		for (a = 1; a <= ArrayLen(whereObj); a++) {
			ArrayAppend(whereArr, whereObj[a].getCONJUNCTIVEOPERATOR() & " " & whereObj[a].getONCOLUMN() & " " & whereObj[a].getCONDITIONOPERATOR() & " " & whereObj[a].getCOLUMNVALUE());
		}
		whereStr = ArrayToList(whereArr, " ");

		// GROUP BY part
		groupbyArr = ArrayNew(1);
		groupbyObj = EntityLoad("EGRGEVIEWGROUPBY", {EQRYCODEFK = "#querycode#"}, "COLUMNORDER ASC");
		for (a = 1; a <= ArrayLen(groupbyObj); a++) {
			ArrayAppend(groupbyArr, groupbyObj[a].getGROUPBYCOLUMN());
		}
		groupbyStr = ArrayToList(groupbyArr, ", ");

		// HAVING part
		havingArr = ArrayNew(1);
		havingObj = EntityLoad("EGRGEVIEWHAVING", {EQRYCODEFK = "#querycode#"}, "COLUMNORDER ASC");
		for (a = 1; a <= ArrayLen(havingObj); a++) {
			ArrayAppend(havingArr, havingObj[a].getDISPLAY());
		}
		havingStr = ArrayToList(havingArr, " ");

		// ORDER BY part
		orderbyArr = ArrayNew(1);
		orderbyObj = EntityLoad("EGRGEVIEWORDERBY", {EQRYCODEFK = "#querycode#"}, "COLUMNORDER ASC");
		for (a = 1; a <= ArrayLen(orderbyObj); a++) {
			ArrayAppend(orderbyArr, orderbyObj[a].getDISPLAY() & " " & orderbyObj[a].getASCORDESC());
		}
		orderbyStr = ArrayToList(orderbyArr, ", ");

		if(trim(selectStr) eq "") {
			selectStr = "SELECT * ";
		} else {
			selectStr = "SELECT " & selectStr;
		}

		if(trim(fromStr) eq "") {
			throw(message="Table not specified", detail="Table not specified");
		} else {
			fromStr = "FROM " & fromStr;
		}

		if(trim(whereStr) eq "") {
			whereStr = "";
		} else {
			whereStr = "WHERE " & whereStr;
		}

		if(trim(groupbyStr) eq "") {
			groupbyStr = "";
		} else {
			groupbyStr = "GROUP BY " & groupbyStr;
		}

		if(trim(havingStr) eq "") {
			havingStr = "";
		} else {
			havingStr = "HAVING " & havingStr;
		}

		if(trim(orderbyStr) eq "") {
			orderbyStr = "";
		} else {
			orderbyStr = "ORDER BY " & orderbyStr;
		}

		Usql = "#selectStr# #fromStr# #whereStr# #groupbyStr# #havingStr# #orderbyStr#";

		queryService = new query();
		queryService.setDatasource("#session.global_dsn#");
   		queryService.setName("DQUERY");
		queryService.setSQL(Usql);
		theResultSet = queryService.execute();
		dquery = theResultSet.getResult();

		resultArr = ArrayNew(1);
		rootstuct = StructNew();
	    rootstuct['totalCount'] = dquery.recordCount;

	    /*Creates an array of structure to be converted to JSON using serializeJSON*/
	    collistArr = dquery.getColumnList();
	    for (b = 1; b <= dquery.recordCount; b++) {
	    	tmpresult = StructNew();

     		for (c = 1; c <= ArrayLen(collistArr); c++) {
     			gridDataIndex = columnStruct['#collistArr[c]#'];
     			tmpresult["#gridDataIndex#"] = dquery["#collistArr[c]#"][b];
     		}
     		ArrayAppend(resultArr, tmpresult);
		}

	    rootstuct['topics'] = resultArr;
		return rootstuct;

	}

	public struct function Update(Args) ExtDirect="true" {
		ret = StructNew();
		return ret;
	}

	public struct function Destroy(Args) ExtDirect="true" {
		ret = StructNew();
		return ret;
	}

	public struct function ReadQueryUser(required string page,
										required string start,
										required string limit,
										required any sort,
										required any filter,
										required string querycode)
	ExtDirect=true
	{
		theargs = StructNew();
		theargs["page"] = page;
	    theargs["start"] = start;
	    theargs["limit"] = limit;
	    theargs["sort"] = sort;
	    theargs["filter"] = filter;

	    bcObj = Createobject("component","IBOSE.application.GridQuery");
	    dresult = bcObj.buildCondition(argumentCollection="#theargs#");
		WHERE = dresult['where'];

		if (trim(WHERE) eq "") {
			WHERE = "WHERE A.USERID = B.USERID AND A.EQRYCODE = '#querycode#'";
		} else {
			WHERE = "#WHERE# AND A.USERID = B.USERID AND A.EQRYCODE = '#querycode#'";
		}

	    ORDERBY = dresult['orderby'];

	    try {
        	rootstruct = StructNew();
			tmpresult = StructNew();
			resultArr = ArrayNew(1);
			dsource = ORMExecuteQuery("SELECT A.USERID, A.EQRYCODE, A.SHOWPRINT, A.SHOWEDIT, A.SHOWDELETE,
									          A.SHOWADD, A.SHOWCOPY, A.SHOWEXPORT, A.SHOWEMAIL, A.SHOWVIEW,
									          B.FIRSTNAME, B.LASTNAME
									     FROM EGRTQUERY A, GMFPEOPLE B #PreserveSingleQuotes(WHERE)# ORDER BY #ORDERBY#",
										 false, {maxResults=#limit#, offset=#start#, timeout=500});

			for(var i = 1; i <= ArrayLen(dsource); i++) {

				tmpresult = StructNew();
				tmpresult['A_USERID'] 		= dsource[i][1];
				tmpresult['A_EQRYCODE'] 		= dsource[i][2];
				tmpresult['A_SHOWPRINT'] 		= dsource[i][3];
				tmpresult['A_SHOWEDIT'] 		= dsource[i][4];
				tmpresult['A_SHOWDELETE'] 		= dsource[i][5];
				tmpresult['A_SHOWADD'] 			= dsource[i][6];
				tmpresult['A_SHOWCOPY'] 		= dsource[i][7];
				tmpresult['A_SHOWEXPORT'] 		= dsource[i][8];
				tmpresult['A_SHOWEMAIL'] 		= dsource[i][9];
				tmpresult['A_SHOWVIEW'] 		= dsource[i][10];
				tmpresult['B_FIRSTNAME'] 		= dsource[i][11];
				tmpresult['B_LASTNAME'] 		= dsource[i][12];

				ArrayAppend(resultArr,tmpresult);
			}
			dsourceCount = ORMExecuteQuery("SELECT COUNT(A.USERID) AS TOTALREC
										     FROM EGRTQUERY A, GMFPEOPLE B #PreserveSingleQuotes(WHERE)#",true);
			rootstuct['totalCount'] = dsourceCount;
			rootstuct['topics'] = resultArr;
			return rootstuct;
        }
        catch(Any e)
        {
        	retStruct =StructNew();
			retStruct['err'] = e;
			return retStruct;
        }
	}


	public struct function ReadQueryUserRole(required string page,
										required string start,
										required string limit,
										required any sort,
										required any filter,
										required string querycode)
	ExtDirect=true
	{
		theargs = StructNew();
		theargs["page"] = page;
	    theargs["start"] = start;
	    theargs["limit"] = limit;
	    theargs["sort"] = sort;
	    theargs["filter"] = filter;

	    bcObj = Createobject("component","IBOSE.application.GridQuery");
	    dresult = bcObj.buildCondition(argumentCollection="#theargs#");
		WHERE = dresult['where'];

		if (trim(WHERE) eq "") {
			WHERE = "WHERE C.USERGRPID = D.USERGRPID AND C.EQRYCODE = '#querycode#'";
		} else {
			WHERE = "#WHERE# AND C.USERGRPID = D.USERGRPID AND C.EQRYCODE = '#querycode#'";
		}

	    ORDERBY = dresult['orderby'];

	    try {
        	rootstruct = StructNew();
			tmpresult = StructNew();
			resultArr = ArrayNew(1);
			dsource = ORMExecuteQuery("SELECT C.USERGRPID, C.EQRYCODE, C.SHOWPRINT, C.SHOWEDIT, C.SHOWDELETE,
									          C.SHOWADD, C.SHOWCOPY, C.SHOWEXPORT, C.SHOWEMAIL, C.SHOWVIEW,
									          D.DESCRIPTION
									     FROM EGRTQUERYGROUP C, EGRGUSERGROUPS D #PreserveSingleQuotes(WHERE)# ORDER BY #ORDERBY#",
										 false, {maxResults=#limit#, offset=#start#, timeout=500});

			for(var i = 1; i <= ArrayLen(dsource); i++) {

				tmpresult = StructNew();
				tmpresult['C_USERGRPID'] 		= dsource[i][1];
				tmpresult['C_EQRYCODE'] 		= dsource[i][2];
				tmpresult['C_SHOWPRINT'] 		= dsource[i][3];
				tmpresult['C_SHOWEDIT'] 		= dsource[i][4];
				tmpresult['C_SHOWDELETE'] 		= dsource[i][5];
				tmpresult['C_SHOWADD'] 			= dsource[i][6];
				tmpresult['C_SHOWCOPY'] 		= dsource[i][7];
				tmpresult['C_SHOWEXPORT'] 		= dsource[i][8];
				tmpresult['C_SHOWEMAIL'] 		= dsource[i][9];
				tmpresult['C_SHOWVIEW'] 		= dsource[i][10];
				tmpresult['D_DESCRIPTION'] = dsource[i][11];

				ArrayAppend(resultArr,tmpresult);
			}
			dsourceCount = ORMExecuteQuery("SELECT COUNT(C.USERGRPID) AS TOTALREC
										      FROM EGRTQUERYGROUP C, EGRGUSERGROUPS D #PreserveSingleQuotes(WHERE)#",true);
			rootstuct['totalCount'] = dsourceCount;
			rootstuct['topics'] = resultArr;
			return rootstuct;
        }
        catch(Any e)
        {
        	retStruct =StructNew();
			retStruct['err'] = e;
			return retStruct;
        }
	}


	public struct function assignUserToQuery(required array ddata, required string userpid, required string dtype)
		ExtDirect="true"
	{
		if (trim(dtype) == "user") {
			for (var a = 1; a <= ArrayLen(ddata); a++) {
				var wo = EntityNew("EGRTQUERY");
				wo.setUSERID(trim(userpid));
				wo.setEQRYCODE(ddata[a]);
				wo.setSHOWPRINT("true");
				wo.setSHOWEDIT("false");
				wo.setSHOWDELETE("false");
				wo.setSHOWADD("false");
				wo.setSHOWCOPY("false");
				wo.setSHOWEXPORT("false");
				wo.setSHOWEMAIL("false");
				wo.setSHOWVIEW("true");
				EntitySave(wo);
			}
		} else { // dtype = "userrole"
			for (var a = 1; a <= ArrayLen(ddata); a++) {
				var wo = EntityNew("EGRTQUERYGROUP");
				wo.setUSERGRPID(trim(userpid));
				wo.setEQRYCODE(ddata[a]);
				wo.setSHOWPRINT("true");
				wo.setSHOWEDIT("false");
				wo.setSHOWDELETE("false");
				wo.setSHOWADD("false");
				wo.setSHOWCOPY("false");
				wo.setSHOWEXPORT("false");
				wo.setSHOWEMAIL("false");
				wo.setSHOWVIEW("true");
				EntitySave(wo);
			}
		}

		OrmFlush();
		var rs = StructNew();
		rs["success"] = true;
		rs["message"] = ddata;
		return rs;
	}

	public struct function RemoveQueryUser(required any args) ExtDirect=true {
		var retVal = StructNew();
		if (!isArray(args)) {
			var ar = ArrayNew(1);
			ar[1] = args;
			args = ArrayNew(1);
			args = ar;
		}

		for (b = 1; b <= ArrayLen(args); b++) {
			try {
				var otd = EntityLoad("EGRTQUERY", {USERID=#trim(args[b]["A_USERID"])#, EQRYCODE=#trim(args[b]["A_EQRYCODE"])#}, true);
				EntityDelete(otd);
			} catch (Any e) {
				//Do nothing here. Cannot delete file for an unknown reason.
			}
		}

		OrmFlush();

		retVal["message"] = args;
		retVal["success"] = true;
		return retVal;
	}

	public struct function RemoveQueryUserRole(required any args) ExtDirect=true {
		var retVal = StructNew();
		if (!isArray(args)) {
			var ar = ArrayNew(1);
			ar[1] = args;
			args = ArrayNew(1);
			args = ar;
		}

		for (b = 1; b <= ArrayLen(args); b++) {
			try {
				var otd = EntityLoad("EGRTQUERYGROUP", {EQRYCODE=#trim(args[b]["C_EQRYCODE"])#, USERGRPID=#trim(args[b]["C_USERGRPID"])#}, true);
				EntityDelete(otd);
			} catch (Any e) {
				//Do nothing here. Cannot delete file for an unknown reason.
			}
		}

		OrmFlush();

		retVal["message"] = args;
		retVal["success"] = true;
		return retVal;
	}

	public struct function UpdateQueryUser(required any args) ExtDirect=true {
		var retVal = StructNew();
		if (!isArray(args)) {
			var ar = ArrayNew(1);
			ar[1] = args;
			args = ArrayNew(1);
			args = ar;
		}

		for (b = 1; b <= ArrayLen(args); b++) {
			var otd = EntityLoad("EGRTQUERY", {USERID=#trim(args[b]["A_USERID"])#, EQRYCODE=#trim(args[b]["A_EQRYCODE"])#}, true);
			otd.setSHOWPRINT(trim(args[b]["A_SHOWPRINT"]));
			otd.setSHOWEDIT(trim(args[b]["A_SHOWEDIT"]));
			otd.setSHOWDELETE(trim(args[b]["A_SHOWDELETE"]));
			otd.setSHOWADD(trim(args[b]["A_SHOWADD"]));
			otd.setSHOWCOPY(trim(args[b]["A_SHOWCOPY"]));
			otd.setSHOWEXPORT(trim(args[b]["A_SHOWEXPORT"]));
			otd.setSHOWEMAIL(trim(args[b]["A_SHOWEMAIL"]));
			otd.setSHOWVIEW(trim(args[b]["A_SHOWVIEW"]));
			EntitySave(otd);
		}

		OrmFlush();

		retVal["message"] = args;
		retVal["success"] = true;
		return retVal;
	}

	public struct function UpdateQueryUserRole(required any args) ExtDirect=true {
		var retVal = StructNew();
		if (!isArray(args)) {
			var ar = ArrayNew(1);
			ar[1] = args;
			args = ArrayNew(1);
			args = ar;
		}

		for (b = 1; b <= ArrayLen(args); b++) {
			var otd = EntityLoad("EGRTQUERYGROUP", {EQRYCODE=#trim(args[b]["C_EQRYCODE"])#, USERGRPID=#trim(args[b]["C_USERGRPID"])#}, true);
			otd.setSHOWPRINT(trim(args[b]["C_SHOWPRINT"]));
			otd.setSHOWEDIT(trim(args[b]["C_SHOWEDIT"]));
			otd.setSHOWDELETE(trim(args[b]["C_SHOWDELETE"]));
			otd.setSHOWADD(trim(args[b]["C_SHOWADD"]));
			otd.setSHOWCOPY(trim(args[b]["C_SHOWCOPY"]));
			otd.setSHOWEXPORT(trim(args[b]["C_SHOWEXPORT"]));
			otd.setSHOWEMAIL(trim(args[b]["C_SHOWEMAIL"]));
			otd.setSHOWVIEW(trim(args[b]["C_SHOWVIEW"]));
			EntitySave(otd);
		}

		OrmFlush();

		retVal["message"] = args;
		retVal["success"] = true;
		return retVal;
	}

}