
component  output=false persistent=false ExtDirect=true {
public struct function Read(required string page,
							required string start,
							required string limit,
							required any sort,
							required any filter,
							required string querycode,
							required struct extraparams)
ExtDirect=true
{
	var theargs = StructNew();
	theargs["page"] = page;
    theargs["start"] = start;
    theargs["limit"] = limit;
    theargs["sort"] = sort;
    theargs["filter"] = filter;

    bcObj = Createobject("component","IBOSE.application.GridQuery");
    dresult = bcObj.buildConditionDash(argumentCollection="#theargs#");
	WHERE = dresult["where"];
    ORDERBY = dresult["orderby"];



	if (trim(WHERE) == "") {
		WHERE = "WHERE  cin21exampass.PERSONNELIDNO = '#session.chapa#'";
	} else {
		WHERE = "#WHERE#  AND  cin21exampass.PERSONNELIDNO = '#session.chapa#'";
	}

	/* Dynamically processes extra parameters */
	if (!StructIsEmpty(extraparams)) {
		var extraparamKeys = StructKeyArray(extraparams);
		var extraCondArr = ArrayNew(1);
		for (var b=1; b <= ArrayLen(extraparamKeys); b++) {
			var excond = "#replace(extraparamKeys[b],'_','.')# = '" & extraparams["#extraparamKeys[b]#"] & "'";
			ArrayAppend(extraCondArr, excond);
		}
		var excondition = ArrayToList(extraCondArr, " AND ");
		if (WHERE == "") {
			WHERE = "WHERE " & excondition;
		} else {
			WHERE = WHERE & " AND " & excondition;
		}
	}



	if (trim(ORDERBY) == "") {
		ORDERBY = "";
	} else {
		ORDERBY = "ORDER BY #ORDERBY# ";
	}

	Usql = "SELECT cin21exampass.TYPEOFEXAM AS 'Type of Exam', cin21exampass.DATETAKENPASSED AS 'Date Taken', cin21exampass.RATING AS 'Rating', cin21exampass.LICENSENUMBER AS 'License Number', cin21exampass.PASSED AS 'Passed', cin21exampass.REMARKS AS 'Remarks', cin21exampass.EXPIRATIONDATE AS 'Expiration'
			 FROM #session.companycode#_cbose.cin21exampass cin21exampass
			 #WHERE#
			 
			 
			 #ORDERBY#";

	queryService = new query();
	queryService.setDatasource("#session.global_dsn#");
  		queryService.setName("dqueryname");
	queryService.setSQL(Usql);
	theResultSet = queryService.execute();
	dquery = theResultSet.getResult();

	resultArr = ArrayNew(1);
	rootstuct = StructNew();
    rootstuct["totalCount"] = dquery.recordCount;

	if (dquery.recordCount < limit) {
    	limit = dquery.recordCount;
    }
    /*Creates an array of structure to be converted to JSON using serializeJSON*/
	for (var b = start+1; b <= start+limit; b++) {
    	tmpresult = StructNew();
 
    			tmpresult["cin21exampass-TYPEOFEXAM"] = dquery["TYPE OF EXAM"][b];
    			tmpresult["cin21exampass-DATETAKENPASSED"] = dquery["DATE TAKEN"][b];
    			tmpresult["cin21exampass-RATING"] = dquery["RATING"][b];
    			tmpresult["cin21exampass-LICENSENUMBER"] = dquery["LICENSE NUMBER"][b];
    			tmpresult["cin21exampass-PASSED"] = dquery["PASSED"][b];
    			tmpresult["cin21exampass-REMARKS"] = dquery["REMARKS"][b];
    			tmpresult["cin21exampass-EXPIRATIONDATE"] = dquery["EXPIRATION"][b];
		ArrayAppend(resultArr, tmpresult);
    }
    rootstuct["topics"] = resultArr;
	return rootstuct;
}

public struct function Create(required any args) ExtDirect=true {
	var retVal = StructNew();
	if (!isArray(args)) {
		var ar = ArrayNew(1);
		ar[1] = args;
		args = ArrayNew(1);
		args = ar;
	}

	for (b = 1; b <= ArrayLen(args); b++) {
		queryService = new query();
		queryService.addParam(name="TYPEOFEXAM",value="#args[b]['cin21exampass-TYPEOFEXAM']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="DATETAKENPASSED",value="#rereplace(args[b]['cin21exampass-DATETAKENPASSED'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="RATING",value="#args[b]['cin21exampass-RATING']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="LICENSENUMBER",value="#args[b]['cin21exampass-LICENSENUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PASSED",value="#args[b]['cin21exampass-PASSED']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="REMARKS",value="#args[b]['cin21exampass-REMARKS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="EXPIRATIONDATE",value="#rereplace(args[b]['cin21exampass-EXPIRATIONDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				
		Usql = 'INSERT INTO {COMPANYCODE}_cbose.cin21exampass (TYPEOFEXAM,DATETAKENPASSED,RATING,LICENSENUMBER,PASSED,REMARKS,EXPIRATIONDATE)
		          VALUES (:TYPEOFEXAM, :DATETAKENPASSED, :RATING, :LICENSENUMBER, :PASSED, :REMARKS, :EXPIRATIONDATE)';
		queryService.setDatasource(session.global_dsn);
	  	queryService.setName('qryname');
		queryService.setSQL(Usql);
		var theResultSet = queryService.execute();
	}

	retVal["message"] = args;
	retVal["success"] = true;
	return retVal;
}


public struct function Update(required any args)
ExtDirect=true
{
	var retVal = StructNew();
	if (!isArray(args)) {
		var ar = ArrayNew(1);
		ar[1] = args;
		args = ArrayNew(1);
		args = ar;
	}

	for (b = 1; b <= ArrayLen(args); b++) {
		queryService = new query();
		queryService.addParam(name="TYPEOFEXAM",value="#args[b]['cin21exampass-TYPEOFEXAM']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="DATETAKENPASSED",value="#rereplace(args[b]['cin21exampass-DATETAKENPASSED'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="RATING",value="#args[b]['cin21exampass-RATING']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="LICENSENUMBER",value="#args[b]['cin21exampass-LICENSENUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PASSED",value="#args[b]['cin21exampass-PASSED']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="REMARKS",value="#args[b]['cin21exampass-REMARKS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="EXPIRATIONDATE",value="#rereplace(args[b]['cin21exampass-EXPIRATIONDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				
		Usql = 'UPDATE {COMPANYCODE}_cbose.cin21exampass
						SET TYPEOFEXAM = :TYPEOFEXAM,DATETAKENPASSED = :DATETAKENPASSED,RATING = :RATING,LICENSENUMBER = :LICENSENUMBER,PASSED = :PASSED,REMARKS = :REMARKS,EXPIRATIONDATE = :EXPIRATIONDATE
			          WHERE TYPEOFEXAM = :TYPEOFEXAM';
		queryService.setDatasource(session.global_dsn);
	  	queryService.setName('qryname');
		queryService.setSQL(Usql);
		var theResultSet = queryService.execute();
	}

	retVal["message"] = args;
	retVal["success"] = true;
	return retVal;
}


public struct function Destroy(required any args) ExtDirect=true {
	var retVal = StructNew();
	if (!isArray(args)) {
		var ar = ArrayNew(1);
		ar[1] = args;
		args = ArrayNew(1);
		args = ar;
	}

	for (b = 1; b <= ArrayLen(args); b++) {
		queryService = new query();
		queryService.addParam(name="TYPEOFEXAM",value="#args[b]['cin21exampass-TYPEOFEXAM']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="DATETAKENPASSED",value="#rereplace(args[b]['cin21exampass-DATETAKENPASSED'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
			queryService.addParam(name="RATING",value="#args[b]['cin21exampass-RATING']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="LICENSENUMBER",value="#args[b]['cin21exampass-LICENSENUMBER']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="PASSED",value="#args[b]['cin21exampass-PASSED']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="REMARKS",value="#args[b]['cin21exampass-REMARKS']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="EXPIRATIONDATE",value="#rereplace(args[b]['cin21exampass-EXPIRATIONDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
			
		Usql = 'DELETE FROM {COMPANYCODE}_cbose.cin21exampass
					  WHERE TYPEOFEXAM = :TYPEOFEXAM AND DATETAKENPASSED = :DATETAKENPASSED AND RATING = :RATING AND LICENSENUMBER = :LICENSENUMBER AND PASSED = :PASSED AND REMARKS = :REMARKS AND EXPIRATIONDATE = :EXPIRATIONDATE';
		queryService.setDatasource(session.global_dsn);
	  	queryService.setName('qryname');
		queryService.setSQL(Usql);
		var theResultSet = queryService.execute();
	}

	retVal["message"] = args;
	retVal["success"] = true;
	return retVal;
}


public struct function getUserToolbars(required string querycode) ExtDirect=true {
	var dockitems = StructNew();
	try {
		dockitems["xtype"] = "toolbar";
	   	dockitems["dock"] = "top";
	   	var itemArray = ArrayNew(1);
		var qryres = ORMExecuteQuery("SELECT SHOWPRINT,
											 SHOWVIEW,
											 SHOWADD,
											 SHOWEDIT,
											 SHOWCOPY,
											 SHOWDELETE,
											 SHOWEXPORT,
											 SHOWEMAIL
										FROM EGRTQUERY
										WHERE EQRYCODE = '#trim(querycode)#' AND userid = '#session.userid#'", false);
		actionlist = "Print,View,Add,Edit,Copy,Delete,Export,Email";
		actionlistimg = "print-icon,view-icon,add-icon,edit-icon,copy-icon,delete-icon,export-icon,email-icon";
		if (ArrayLen(qryres) > 0) { /* if assigned to a user */
			for (b = 1; b <= ListLen(actionlist); b++) {
				if (qryres[1][b] == true) {
					var xtypeS = StructNew();
				   	xtypeS["xtype"] = "button";
				   	xtypeS["action"] = "#ListGetAt(actionlist,b,',')#";
				   	xtypeS["tooltip"] = "#ListGetAt(actionlist,b,',')#";
				   	xtypeS["iconCls"] = "#ListGetAt(actionlistimg,b,',')#";
				   	ArrayAppend(itemArray, xtypeS);
				}
			}
			if (ArrayLen(itemArray) == 0) itemArray = setItemArrayWithGroup(itemArray, querycode);
		} else { /* if assigned to a group*/
			itemArray = setItemArrayWithGroup(itemArray, querycode);
		}

		if (ArrayLen(itemArray) > 0) {
			dockitems["items"] = itemArray;
			dockitems["success"] = true;
		} else {
			dockitems["false"] = true;
			dockitems["message"] = "No tools assigned to this user.";
		}

	return dockitems;

	} catch (Any e) {
		dockitems["false"] = true;
		dockitems["message"] = e.message & " ," & e.detail;
	}
}

private array function setItemArrayWithGroup(itemArray,querycode) {
	var qryresg = ORMExecuteQuery("SELECT SHOWPRINT,
										 SHOWVIEW,
										 SHOWADD,
										 SHOWEDIT,
										 SHOWCOPY,
										 SHOWDELETE,
										 SHOWEXPORT,
										 SHOWEMAIL
									FROM EGRTQUERYGROUP
								   WHERE EQRYCODE = '#trim(querycode)#'
										 AND USERGRPID IN (SELECT USERGRPIDFK FROM EGRGROLEINDEX
														    WHERE USERGRPMEMBERSIDX = '#session.userid#')", false);
		if (ArrayLen(qryresg) > 0) {
			for (b = 1; b <= ListLen(actionlist); b++) {
				if (qryresg[1][b] == true) {
					var xtypeS = StructNew();
				   	xtypeS["xtype"] = "button";
				   	xtypeS["action"] = "#ListGetAt(actionlist,b,',')#";
				   	xtypeS["tooltip"] = "#ListGetAt(actionlist,b,',')#";
				   	xtypeS["iconCls"] = "#ListGetAt(actionlistimg,b,',')#";
				   	ArrayAppend(itemArray, xtypeS);
				}
			}
		}
	return itemArray;
}

remote struct function exportGridToExcel(required String querycode, required String querytitle) ExtDirect=true {
	var retVal = StructNew();
	var qrydef = CreateObject("component", "myapps.query.definition.QueryDefinition");
	Usql = "SELECT cin21exampass.TYPEOFEXAM AS 'Type of Exam', cin21exampass.DATETAKENPASSED AS 'Date Taken', cin21exampass.RATING AS 'Rating', cin21exampass.LICENSENUMBER AS 'License Number', cin21exampass.PASSED AS 'Passed', cin21exampass.REMARKS AS 'Remarks', cin21exampass.EXPIRATIONDATE AS 'Expiration'
			 FROM #session.companycode#_cbose.cin21exampass cin21exampass
			 WHERE  cin21exampass.PERSONNELIDNO = '#session.chapa#'
			 
			 
			 ";
	var res = qrydef.exportQueryToExcel(querytitle,Usql.trim());
	retVal["result"] = res;
	return retVal;
}

remote struct function emailSelGridQuery(required String fromvalue,
										 required String tovalue,
										 required String subjectvalue,
										 required String bodyvalue) ExtDirect=true {
	var retVal = StructNew();
	retVal["success"] = true;
	try {
		var dmailObj = CreateObject("component", "mail");
		if (trim(session.ms) != "") {
			dmailObj.setServer(Decrypt(session.ms,"mailmng"));
			dmailObj.setUsername(Decrypt(session.mu,"mailmng"));
			dmailObj.setPassword(Decrypt(session.mp,"mailmng"));
		}
		if (trim(session.mt) != "") dmailObj.setTimeout(session.mt);
		if (trim(session.mpt) != "") dmailObj.setPort(session.mpt);
		if (trim(session.mtls) != "") dmailObj.setUseTLS(session.mtls);
		if (trim(session.mssl) != "") dmailObj.setUseSSL(session.mssl);
		dmailObj.setFrom(fromvalue);
		dmailObj.setTo(tovalue);
		dmailObj.setSubject(subjectvalue);
		dmailObj.setType("html");
		dmailObj.setBody(bodyvalue);
		dmailObj.send();
	} catch (Any e) {
		retVal["success"] = false;
		retVal["message"] = e.message & " - " & e.detail;
	}

	return retVal;
}

}