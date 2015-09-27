
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
		WHERE = "";
	} else {
		WHERE = "#WHERE# ";
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

	Usql = "SELECT clkposition.POSITIONCODE AS 'Position Code',
					clkposition.DESCRIPTION AS 'Description',
					clkposition.BUDGETEDHEADCOUNT AS 'Budgeted Head Count',
					clkposition.TOOLTIP AS 'Org Chart Tooltip',
					clkposition.JOBSTYLE AS 'Org Chart Style',
					cmfpa.PERSONNELIDNO AS 'PERSONNELIDNO',
					cmfpa.SUPERIORCODE AS 'SUPERIORCODE',
					cmfpa.FIRSTNAME AS 'First Name',
					cmfpa.LASTNAME AS 'Last Name',
					cmfpa.MIDDLENAME AS 'Middle Name',
					ecrgmyibose.AVATAR AS 'Profile Picture'
			 FROM clkposition
			 			LEFT OUTER JOIN cmfpa  cmfpa ON clkposition.POSITIONCODE = cmfpa.POSITIONCODE
			 			LEFT OUTER JOIN ecrgmyibose  ecrgmyibose ON cmfpa.PERSONNELIDNO = ecrgmyibose.PERSONNELIDNO
			 #WHERE#
			 #ORDERBY#";

	queryService = new query();
	queryService.setDatasource("#session.company_dsn#");
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

    			tmpresult["clkposition-POSITIONCODE"] = dquery["POSITION CODE"][b];
    			tmpresult["clkposition-DESCRIPTION"] = dquery["DESCRIPTION"][b];
    			tmpresult["clkposition-BUDGETEDHEADCOUNT"] = dquery["BUDGETED HEAD COUNT"][b];
    			tmpresult["clkposition-TOOLTIP"] = dquery["ORG CHART TOOLTIP"][b];
    			tmpresult["clkposition-JOBSTYLE"] = dquery["ORG CHART STYLE"][b];
    			tmpresult["cmfpa-PERSONNELIDNO"] = dquery["PERSONNELIDNO"][b];
    			tmpresult["cmfpa-SUPERIORCODE"] = dquery["SUPERIORCODE"][b];
    			tmpresult["cmfpa-FIRSTNAME"] = dquery["FIRST NAME"][b];
    			tmpresult["cmfpa-LASTNAME"] = dquery["LAST NAME"][b];
    			tmpresult["cmfpa-MIDDLENAME"] = dquery["MIDDLE NAME"][b];
    			tmpresult["ecrgmyibose-AVATAR"] = dquery["Profile Picture"][b];
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
		queryService.addParam(name="POSITIONCODE",value="#args[b]['clkposition-POSITIONCODE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="DESCRIPTION",value="#args[b]['clkposition-DESCRIPTION']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="BUDGETEDHEADCOUNT",value="#args[b]['clkposition-BUDGETEDHEADCOUNT']#",cfsqltype="CF_SQL_FLOAT");
		queryService.addParam(name="TOOLTIP",value="#args[b]['clkposition-TOOLTIP']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="JOBSTYLE",value="#args[b]['clkposition-JOBSTYLE']#",cfsqltype="CF_SQL_VARCHAR");

		Usql = 'INSERT INTO clkposition (POSITIONCODE,DESCRIPTION,BUDGETEDHEADCOUNT,TOOLTIP,JOBSTYLE)
		          VALUES (:POSITIONCODE, :DESCRIPTION, :BUDGETEDHEADCOUNT, :TOOLTIP, :JOBSTYLE)';
		queryService.setDatasource(session.company_dsn);
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
		queryService.addParam(name="POSITIONCODE",value="#args[b]['clkposition-POSITIONCODE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="DESCRIPTION",value="#args[b]['clkposition-DESCRIPTION']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="BUDGETEDHEADCOUNT",value="#args[b]['clkposition-BUDGETEDHEADCOUNT']#",cfsqltype="CF_SQL_FLOAT");
		queryService.addParam(name="TOOLTIP",value="#args[b]['clkposition-TOOLTIP']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="JOBSTYLE",value="#args[b]['clkposition-JOBSTYLE']#",cfsqltype="CF_SQL_VARCHAR");

		Usql = 'UPDATE clkposition
						SET POSITIONCODE = :POSITIONCODE,DESCRIPTION = :DESCRIPTION,BUDGETEDHEADCOUNT = :BUDGETEDHEADCOUNT,TOOLTIP = :TOOLTIP,JOBSTYLE = :JOBSTYLE
			          WHERE POSITIONCODE = :POSITIONCODE';
		queryService.setDatasource(session.company_dsn);
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
		queryService.addParam(name="POSITIONCODE",value="#args[b]['clkposition-POSITIONCODE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="DESCRIPTION",value="#args[b]['clkposition-DESCRIPTION']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="BUDGETEDHEADCOUNT",value="#args[b]['clkposition-BUDGETEDHEADCOUNT']#",cfsqltype="CF_SQL_FLOAT");
		queryService.addParam(name="TOOLTIP",value="#args[b]['clkposition-TOOLTIP']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="JOBSTYLE",value="#args[b]['clkposition-JOBSTYLE']#",cfsqltype="CF_SQL_VARCHAR");

		Usql = 'DELETE FROM clkposition
					  WHERE POSITIONCODE = :POSITIONCODE AND DESCRIPTION = :DESCRIPTION AND BUDGETEDHEADCOUNT = :BUDGETEDHEADCOUNT AND TOOLTIP = :TOOLTIP AND JOBSTYLE = :JOBSTYLE';
		queryService.setDatasource(session.company_dsn);
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
	Usql = "SELECT clkposition.POSITIONCODE AS 'Position Code', clkposition.DESCRIPTION AS 'Description', clkposition.BUDGETEDHEADCOUNT AS 'Budgeted Head Count', clkposition.TOOLTIP AS 'Org Chart Tooltip', clkposition.JOBSTYLE AS 'Org Chart Style', cmfpa.FIRSTNAME AS 'First Name', cmfpa.LASTNAME AS 'Last Name', cmfpa.MIDDLENAME AS 'Middle Name'
			 FROM clkposition  clkposition LEFT OUTER JOIN cmfpa  cmfpa ON clkposition.POSITIONCODE = cmfpa.POSITIONCODE LEFT OUTER JOIN ecrgmyibose  ecrgmyibose ON cmfpa.PERSONNELIDNO = ecrgmyibose.PERSONNELIDNO



			 ";
	var res = qrydef.exportQueryToExcel(querytitle,trim(Usql));
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