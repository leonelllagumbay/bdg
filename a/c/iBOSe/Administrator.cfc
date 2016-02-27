/**
 * Preview
 *
 * @author LEONELL
 * @date 3/31/15
 **/
component accessors=true output=false persistent=false ExtDirect="true" {
	public struct function ReadUserRole(required string page,
								required string start,
								required string limit,
								required any sort,
								required any filter)
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
	    ORDERBY = dresult['orderby'];

	    try {
        	rootstruct = StructNew();
			tmpresult = StructNew();
			resultArr = ArrayNew(1);
			dsource = ORMExecuteQuery("FROM EGRGUSERGROUPS #PreserveSingleQuotes(WHERE)#
			                           ORDER BY #ORDERBY#", false, {maxResults=#limit#, offset=#start#, timeout=500});

			for(i=1; i<=ArrayLen(dsource); i++) {

				tmpresult = StructNew();
				tmpresult['USERGRPID'] = dsource[i].getUSERGRPID();
				tmpresult['DESCRIPTION'] 	= dsource[i].getDESCRIPTION();
				tmpresult['RECDATECREATED'] = dsource[i].getRECDATECREATED();
				tmpresult['DATELASTUPDATE'] 	= dsource[i].getDATELASTUPDATE();

				ArrayAppend(resultArr,tmpresult);
			}
			dsourceCount = ORMExecuteQuery("SELECT COUNT(*) AS TOTALREC FROM EGRGUSERGROUPS #PreserveSingleQuotes(WHERE)#",true);
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

	public struct function ReadUserApp(required string page,
										required string start,
										required string limit,
										required any sort,
										required any filter)
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
	    ORDERBY = dresult['orderby'];

	    try {
        	rootstruct = StructNew();
			tmpresult = StructNew();
			resultArr = ArrayNew(1);
			dsource = ORMExecuteQuery("FROM EGRGUSERAPP #PreserveSingleQuotes(WHERE)#
			                           ORDER BY #ORDERBY#", false, {maxResults=#limit#, offset=#start#, timeout=500});

			for(i=1; i<=ArrayLen(dsource); i++) {

				tmpresult = StructNew();
				tmpresult['APPID'] = dsource[i].getAPPID();
				tmpresult['FOLDERIDFK'] = dsource[i].getFOLDERIDFK();
				tmpresult['TABIDFK'] = dsource[i].getTABIDFK();
				tmpresult['OBJECTIDFK'] = dsource[i].getOBJECTIDFK();
				tmpresult['SCRIPTREQUIRES'] = dsource[i].getSCRIPTREQUIRES();
				tmpresult['NAMEORTITLE'] = dsource[i].getNAMEORTITLE();
				tmpresult['APPORDER'] = dsource[i].getAPPORDER();
				tmpresult['EXTNAMESPACE'] = dsource[i].getEXTNAMESPACE();
				tmpresult['EXTCONTROLLERS'] = dsource[i].getEXTCONTROLLERS();
				tmpresult['URLIFNOTEXT'] = dsource[i].getURLIFNOTEXT();
				tmpresult['APISCRIPTSOURCE'] = dsource[i].getAPISCRIPTSOURCE();
				tmpresult['APPICON'] = dsource[i].getAPPICON();
				tmpresult['EXTRACSS'] = dsource[i].getEXTRACSS();
				tmpresult['EXTRACODE'] = dsource[i].getEXTRACODE();
				tmpresult['PERSONNELIDNO'] = dsource[i].getPERSONNELIDNO();
				tmpresult['APPROVED'] = dsource[i].getAPPROVED();
				tmpresult['ACTIONBY'] = dsource[i].getACTIONBY();
				tmpresult['EFORMID'] = dsource[i].getEFORMID();
				tmpresult['PROCESSID'] = dsource[i].getPROCESSID();
				tmpresult['DATELASTUPDATE'] = dsource[i].getDATELASTUPDATE();
				tmpresult['DATEACTIONWASDONE'] = dsource[i].getDATEACTIONWASDONE();
				tmpresult['RECDATECREATED'] = dsource[i].getRECDATECREATED();

				ArrayAppend(resultArr,tmpresult);
			}
			dsourceCount = ORMExecuteQuery("SELECT COUNT(*) AS TOTALREC FROM EGRGUSERAPP #PreserveSingleQuotes(WHERE)#",true);
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

	public struct function ReadUserMenu(required string page,
										required string start,
										required string limit,
										required any sort,
										required any filter)
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
	    ORDERBY = dresult['orderby'];

	    try {
        	rootstruct = StructNew();
			tmpresult = StructNew();
			resultArr = ArrayNew(1);
			dsource = ORMExecuteQuery("FROM EGRGMENU #PreserveSingleQuotes(WHERE)#
			                           ORDER BY #ORDERBY#", false, {maxResults=#limit#, offset=#start#, timeout=500});

			for(i=1; i<=ArrayLen(dsource); i++) {

				tmpresult = StructNew();
				tmpresult['MENUID'] = dsource[i].getMENUID();
				tmpresult['MENUORDER'] = dsource[i].getMENUORDER();
				tmpresult['HIERARCHYLEVEL'] = dsource[i].getHIERARCHYLEVEL();
				tmpresult['MENUNAME'] = dsource[i].getMENUNAME();
				tmpresult['MENUHINT'] = dsource[i].getMENUHINT();
				tmpresult['MENULOGO'] = dsource[i].getMENULOGO();
				tmpresult['PARENTMENUID'] = dsource[i].getPARENTMENUID();
				tmpresult['SOURCELINK'] = dsource[i].getSOURCELINK();
				tmpresult['STYLE'] = dsource[i].getSTYLE();
				tmpresult['EXTRAS'] = dsource[i].getEXTRAS();
				tmpresult['TABIDFK'] = dsource[i].getTABIDFK();
				tmpresult['OBJECTIDFK'] = dsource[i].getOBJECTIDFK();
				tmpresult['FOLDERIDFK'] = dsource[i].getFOLDERIDFK();
				tmpresult['PERSONNELIDNO'] = dsource[i].getPERSONNELIDNO();
				tmpresult['APPROVED'] = dsource[i].getAPPROVED();
				tmpresult['ACTIONBY'] = dsource[i].getACTIONBY();
				tmpresult['EFORMID'] = dsource[i].getEFORMID();
				tmpresult['PROCESSID'] = dsource[i].getPROCESSID();
				tmpresult['DATELASTUPDATE'] = dsource[i].getDATELASTUPDATE();
				tmpresult['DATEACTIONWASDONE'] = dsource[i].getDATEACTIONWASDONE();
				tmpresult['RECDATECREATED'] = dsource[i].getRECDATECREATED();

				ArrayAppend(resultArr,tmpresult);
			}
			dsourceCount = ORMExecuteQuery("SELECT COUNT(*) AS TOTALREC FROM EGRGMENU #PreserveSingleQuotes(WHERE)#",true);
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

	public struct function ReadAppUser(required string page,
										required string start,
										required string limit,
										required any sort,
										required any filter,
										required string appcode)
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
			WHERE = "WHERE A.USERID = B.USERID AND A.APPID = '#appcode#'";
		} else {
			WHERE = "#WHERE# AND A.USERID = B.USERID AND A.APPID = '#appcode#'";
		}

	    ORDERBY = dresult['orderby'];

	    try {
        	rootstruct = StructNew();
			tmpresult = StructNew();
			resultArr = ArrayNew(1);
			dsource = ORMExecuteQuery("SELECT A.USERID, A.APPID, B.FIRSTNAME, B.LASTNAME
									     FROM EGRTUSERAPP A, GMFPEOPLE B #PreserveSingleQuotes(WHERE)# ORDER BY #ORDERBY#",
										 false, {maxResults=#limit#, offset=#start#, timeout=500});

			for(var i = 1; i <= ArrayLen(dsource); i++) {

				tmpresult = StructNew();
				tmpresult['A_USERID'] 		= dsource[i][1];
				tmpresult['A_APPID'] 		= dsource[i][2];
				tmpresult['B_FIRSTNAME'] 		= dsource[i][3];
				tmpresult['B_LASTNAME'] 		= dsource[i][4];

				ArrayAppend(resultArr,tmpresult);
			}
			dsourceCount = ORMExecuteQuery("SELECT COUNT(A.USERID) AS TOTALREC
										     FROM EGRTUSERAPP A, GMFPEOPLE B #PreserveSingleQuotes(WHERE)#",true);
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

	public struct function RemoveAppUser(required any args) ExtDirect=true {
		var retVal = StructNew();
		if (!isArray(args)) {
			var ar = ArrayNew(1);
			ar[1] = args;
			args = ArrayNew(1);
			args = ar;
		}

		for (b = 1; b <= ArrayLen(args); b++) {
			try {
				var otd = EntityLoad("EGRTUSERAPP", {USERID=#trim(args[b]["A_USERID"])#, APPID=#trim(args[b]["A_APPID"])#}, true);
				EntityDelete(otd);
			} catch (Any e) {
				//Do nothing here. Cannot delete file
			}
		}

		OrmFlush();

		retVal["message"] = args;
		retVal["success"] = true;
		return retVal;
	}

	public struct function ReadAppUserRole(required string page,
										required string start,
										required string limit,
										required any sort,
										required any filter,
										required string appcode)
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
			WHERE = "WHERE C.USERGRPID = D.USERGRPID AND C.APPID = '#appcode#'";
		} else {
			WHERE = "#WHERE# AND C.USERGRPID = D.USERGRPID AND C.APPID = '#appcode#'";
		}

	    ORDERBY = dresult['orderby'];

	    try {
        	rootstruct = StructNew();
			tmpresult = StructNew();
			resultArr = ArrayNew(1);
			dsource = ORMExecuteQuery("SELECT C.USERGRPID, C.APPID, D.DESCRIPTION
									     FROM EGRTUSERAPPGROUP C, EGRGUSERGROUPS D #PreserveSingleQuotes(WHERE)# ORDER BY #ORDERBY#",
										 false, {maxResults=#limit#, offset=#start#, timeout=500});

			for(var i = 1; i <= ArrayLen(dsource); i++) {

				tmpresult = StructNew();
				tmpresult['C_USERGRPID'] 		= dsource[i][1];
				tmpresult['C_APPID'] 		= dsource[i][2];
				tmpresult['D_DESCRIPTION'] = dsource[i][3];

				ArrayAppend(resultArr,tmpresult);
			}
			dsourceCount = ORMExecuteQuery("SELECT COUNT(C.USERGRPID) AS TOTALREC
										      FROM EGRTUSERAPPGROUP C, EGRGUSERGROUPS D #PreserveSingleQuotes(WHERE)#",true);
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

	public struct function RemoveAppUserRole(required any args) ExtDirect=true {
		var retVal = StructNew();
		if (!isArray(args)) {
			var ar = ArrayNew(1);
			ar[1] = args;
			args = ArrayNew(1);
			args = ar;
		}

		for (b = 1; b <= ArrayLen(args); b++) {
			try {
				var otd = EntityLoad("EGRTUSERAPPGROUP", {APPID=#trim(args[b]["C_APPID"])#, USERGRPID=#trim(args[b]["C_USERGRPID"])#}, true);
				EntityDelete(otd);
			} catch (Any e) {
				//Do nothing here. Cannot delete file
			}
		}

		OrmFlush();

		retVal["message"] = args;
		retVal["success"] = true;
		return retVal;
	}

	public struct function assignUserToApp(required array ddata, required string userpid, required string dtype)
		ExtDirect="true"
	{
		if (trim(dtype) == "user") {
			for (var a = 1; a <= ArrayLen(ddata); a++) {
				var wo = EntityNew("EGRTUSERAPP");
				wo.setUSERID(trim(userpid));
				wo.setAPPID(ddata[a]);
				EntitySave(wo);
			}
		} else { // dtype = "userrole"
			for (var a = 1; a <= ArrayLen(ddata); a++) {
				var wo = EntityNew("EGRTUSERAPPGROUP");
				wo.setUSERGRPID(trim(userpid));
				wo.setAPPID(ddata[a]);
				EntitySave(wo);
			}
		}

		OrmFlush();
		var rs = StructNew();
		rs["success"] = true;
		rs["message"] = ddata;
		return rs;
	}



	public struct function ReadMenuUser(required string page,
										required string start,
										required string limit,
										required any sort,
										required any filter,
										required string menucode)
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
			WHERE = "WHERE A.USERID = B.USERID AND A.MENUID = '#menucode#'";
		} else {
			WHERE = "#WHERE# AND A.USERID = B.USERID AND A.MENUID = '#menucode#'";
		}

	    ORDERBY = dresult['orderby'];

	    try {
        	rootstruct = StructNew();
			tmpresult = StructNew();
			resultArr = ArrayNew(1);
			dsource = ORMExecuteQuery("SELECT A.USERID, A.MENUID, B.FIRSTNAME, B.LASTNAME
									     FROM EGRTMENU A, GMFPEOPLE B #PreserveSingleQuotes(WHERE)# ORDER BY #ORDERBY#",
										 false, {maxResults=#limit#, offset=#start#, timeout=500});

			for(var i = 1; i <= ArrayLen(dsource); i++) {

				tmpresult = StructNew();
				tmpresult['A_USERID'] 		= dsource[i][1];
				tmpresult['A_MENUID'] 		= dsource[i][2];
				tmpresult['B_FIRSTNAME'] 		= dsource[i][3];
				tmpresult['B_LASTNAME'] 		= dsource[i][4];

				ArrayAppend(resultArr,tmpresult);
			}
			dsourceCount = ORMExecuteQuery("SELECT COUNT(A.USERID) AS TOTALREC
										     FROM EGRTMENU A, GMFPEOPLE B #PreserveSingleQuotes(WHERE)#",true);
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

	public struct function RemoveMenuUser(required any args) ExtDirect=true {
		var retVal = StructNew();
		if (!isArray(args)) {
			var ar = ArrayNew(1);
			ar[1] = args;
			args = ArrayNew(1);
			args = ar;
		}

		for (b = 1; b <= ArrayLen(args); b++) {
			try {
				var otd = EntityLoad("EGRTMENU", {USERID=#trim(args[b]["A_USERID"])#, MENUID=#trim(args[b]["A_MENUID"])#}, true);
				EntityDelete(otd);
			} catch (Any e) {
				//Do nothing here. Cannot delete file
			}
		}

		OrmFlush();

		retVal["message"] = args;
		retVal["success"] = true;
		return retVal;
	}

	public struct function ReadMenuUserRole(required string page,
										required string start,
										required string limit,
										required any sort,
										required any filter,
										required string menucode)
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
			WHERE = "WHERE C.USERGRPID = D.USERGRPID AND C.MENUID = '#menucode#'";
		} else {
			WHERE = "#WHERE# AND C.USERGRPID = D.USERGRPID AND C.MENUID = '#menucode#'";
		}

	    ORDERBY = dresult['orderby'];

	    try {
        	rootstruct = StructNew();
			tmpresult = StructNew();
			resultArr = ArrayNew(1);
			dsource = ORMExecuteQuery("SELECT C.USERGRPID, C.MENUID, D.DESCRIPTION
									     FROM EGRTMENUGROUP C, EGRGUSERGROUPS D #PreserveSingleQuotes(WHERE)# ORDER BY #ORDERBY#",
										 false, {maxResults=#limit#, offset=#start#, timeout=500});

			for(var i = 1; i <= ArrayLen(dsource); i++) {

				tmpresult = StructNew();
				tmpresult['C_USERGRPID'] 		= dsource[i][1];
				tmpresult['C_MENUID'] 		= dsource[i][2];
				tmpresult['D_DESCRIPTION'] = dsource[i][3];

				ArrayAppend(resultArr,tmpresult);
			}
			dsourceCount = ORMExecuteQuery("SELECT COUNT(C.USERGRPID) AS TOTALREC
										      FROM EGRTMENUGROUP C, EGRGUSERGROUPS D #PreserveSingleQuotes(WHERE)#",true);
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

	public struct function RemoveMenuUserRole(required any args) ExtDirect=true {
		var retVal = StructNew();
		if (!isArray(args)) {
			var ar = ArrayNew(1);
			ar[1] = args;
			args = ArrayNew(1);
			args = ar;
		}

		for (b = 1; b <= ArrayLen(args); b++) {
			try {
				var otd = EntityLoad("EGRTMENUGROUP", {MENUID=#trim(args[b]["C_MENUID"])#, USERGRPID=#trim(args[b]["C_USERGRPID"])#}, true);
				EntityDelete(otd);
			} catch (Any e) {
				//Do nothing here. Cannot delete file
			}
		}

		OrmFlush();

		retVal["message"] = args;
		retVal["success"] = true;
		return retVal;
	}

	public struct function assignUserToMenu(required array ddata, required string userpid, required string dtype)
		ExtDirect="true"
	{
		if (trim(dtype) == "user") {
			for (var a = 1; a <= ArrayLen(ddata); a++) {
				var wo = EntityNew("EGRTMENU");
				wo.setUSERID(trim(userpid));
				wo.setMENUID(ddata[a]);
				EntitySave(wo);
			}
		} else { // dtype = "userrole"
			for (var a = 1; a <= ArrayLen(ddata); a++) {
				var wo = EntityNew("EGRTMENUGROUP");
				wo.setUSERGRPID(trim(userpid));
				wo.setMENUID(ddata[a]);
				EntitySave(wo);
			}
		}

		OrmFlush();
		var rs = StructNew();
		rs["success"] = true;
		rs["message"] = ddata;
		return rs;
	}



	public struct function ReadRoleMember(required string page,
										required string start,
										required string limit,
										required any sort,
										required any filter,
										required string rolecode)
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
			WHERE = "WHERE A.USERGRPMEMBERSIDX = B.USERID AND A.USERGRPIDFK = '#rolecode#'";
		} else {
			WHERE = "#WHERE# AND A.USERGRPMEMBERSIDX = B.USERID AND A.USERGRPIDFK = '#rolecode#'";
		}

	    ORDERBY = dresult['orderby'];

	    try {
        	rootstruct = StructNew();
			tmpresult = StructNew();
			resultArr = ArrayNew(1);
			dsource = ORMExecuteQuery("SELECT A.USERGRPIDFK, A.USERGRPMEMBERSIDX, B.FIRSTNAME, B.LASTNAME
									     FROM EGRGROLEINDEX A, GMFPEOPLE B #PreserveSingleQuotes(WHERE)# ORDER BY #ORDERBY#",
										 false, {maxResults=#limit#, offset=#start#, timeout=500});

			for(var i = 1; i <= ArrayLen(dsource); i++) {

				tmpresult = StructNew();
				tmpresult['A_USERGRPIDFK'] = dsource[i][1];
				tmpresult['A_USERGRPMEMBERSIDX'] = dsource[i][2];
				tmpresult['B_FIRSTNAME'] = dsource[i][3];
				tmpresult['B_LASTNAME'] = dsource[i][4];

				ArrayAppend(resultArr,tmpresult);
			}
			dsourceCount = ORMExecuteQuery("SELECT COUNT(A.USERGRPIDFK) AS TOTALREC
										     FROM EGRGROLEINDEX A, GMFPEOPLE B #PreserveSingleQuotes(WHERE)#",true);
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

	public struct function RemoveRoleMember(required any args) ExtDirect=true {
		var retVal = StructNew();
		if (!isArray(args)) {
			var ar = ArrayNew(1);
			ar[1] = args;
			args = ArrayNew(1);
			args = ar;
		}

		for (b = 1; b <= ArrayLen(args); b++) {
			try {
				var otd = EntityLoad("EGRGROLEINDEX", {USERGRPIDFK=#trim(args[b]["A_USERGRPIDFK"])#, USERGRPMEMBERSIDX=#trim(args[b]["A_USERGRPMEMBERSIDX"])#}, true);
				EntityDelete(otd);
			} catch (Any e) {
				//Do nothing here. Cannot delete file
			}
		}

		OrmFlush();

		retVal["message"] = args;
		retVal["success"] = true;
		return retVal;
	}


	public struct function assignToUserRoleMember(required array ddata, required string userpid)
		ExtDirect="true"
	{
		for (var a = 1; a <= ArrayLen(ddata); a++) {
			var wo = EntityNew("EGRGROLEINDEX");
			wo.setUSERGRPMEMBERSIDX(trim(userpid));
			wo.setUSERGRPIDFK(ddata[a]);
			EntitySave(wo);
		}

		OrmFlush();
		var rs = StructNew();
		rs["success"] = true;
		rs["message"] = ddata;
		return rs;
	}

}
