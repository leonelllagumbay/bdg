
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

	Usql = "SELECT clkposition.POSITIONCODE AS 'Position Code', clkposition.PARENTPOSITION AS 'Parent Position', clkposition.DESCRIPTION AS 'Description', clkposition.BUDGETEDHEADCOUNT AS 'Budgeted Head Count', clkposition.TOOLTIP AS 'Org Chart Tooltip', clkposition.JOBSTYLE AS 'Org Chart Style', clkdepartment.DESCRIPTION AS 'Department', clkjobgrade.DESCRIPTION AS 'Job Grade', clkjobclasscode.DESCRIPTION AS 'Job Class', clklabortype.DESCRIPTION AS 'Labor Type', clkposition.DEPARTMENTCODE AS 'Department Code', clkposition.JOBCLASSCODE AS 'Job Class Code', clkposition.JOBGRADECODE AS 'Job Grade Code', clkposition.LABORTYPE AS 'Labor Type Code', clkposition.RECDATECREATED AS 'Date Created', clkposition.DATELASTUPDATE AS 'Date Last Update', clkposition.RECCREATEDBY AS 'Created By'
			 FROM #session.companycode#_cbose.clkposition  clkposition LEFT OUTER JOIN #session.companycode#_cbose.clkdepartment  clkdepartment ON clkposition.DEPARTMENTCODE = clkdepartment.DEPARTMENTCODE LEFT OUTER JOIN #session.companycode#_cbose.clkjobgrade  clkjobgrade ON clkposition.JOBGRADECODE = clkjobgrade.JOBGRADECODE LEFT OUTER JOIN #session.companycode#_cbose.clkjobclasscode  clkjobclasscode ON clkposition.JOBCLASSCODE = clkjobclasscode.JOBCLASSCODE LEFT OUTER JOIN #session.companycode#_cbose.clklabortype  clklabortype ON clkposition.LABORTYPE = clklabortype.LABORTYPECODE
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
 
    			tmpresult["clkposition-POSITIONCODE"] = dquery["POSITION CODE"][b];
    			tmpresult["clkposition-PARENTPOSITION"] = dquery["PARENT POSITION"][b];
    			tmpresult["clkposition-DESCRIPTION"] = dquery["DESCRIPTION"][b];
    			tmpresult["clkposition-BUDGETEDHEADCOUNT"] = dquery["BUDGETED HEAD COUNT"][b];
    			tmpresult["clkposition-TOOLTIP"] = dquery["ORG CHART TOOLTIP"][b];
    			tmpresult["clkposition-JOBSTYLE"] = dquery["ORG CHART STYLE"][b];
    			tmpresult["clkdepartment-DESCRIPTION"] = dquery["DEPARTMENT"][b];
    			tmpresult["clkjobgrade-DESCRIPTION"] = dquery["JOB GRADE"][b];
    			tmpresult["clkjobclasscode-DESCRIPTION"] = dquery["JOB CLASS"][b];
    			tmpresult["clklabortype-DESCRIPTION"] = dquery["LABOR TYPE"][b];
    			tmpresult["clkposition-DEPARTMENTCODE"] = dquery["DEPARTMENT CODE"][b];
    			tmpresult["clkposition-JOBCLASSCODE"] = dquery["JOB CLASS CODE"][b];
    			tmpresult["clkposition-JOBGRADECODE"] = dquery["JOB GRADE CODE"][b];
    			tmpresult["clkposition-LABORTYPE"] = dquery["LABOR TYPE CODE"][b];
    			tmpresult["clkposition-RECDATECREATED"] = dquery["DATE CREATED"][b];
    			tmpresult["clkposition-DATELASTUPDATE"] = dquery["DATE LAST UPDATE"][b];
    			tmpresult["clkposition-RECCREATEDBY"] = dquery["CREATED BY"][b];
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
			queryService.addParam(name="PARENTPOSITION",value="#args[b]['clkposition-PARENTPOSITION']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="DESCRIPTION",value="#args[b]['clkposition-DESCRIPTION']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="BUDGETEDHEADCOUNT",value="#args[b]['clkposition-BUDGETEDHEADCOUNT']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="TOOLTIP",value="#args[b]['clkposition-TOOLTIP']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="JOBSTYLE",value="#args[b]['clkposition-JOBSTYLE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="DEPARTMENTCODE",value="#args[b]['clkposition-DEPARTMENTCODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="JOBCLASSCODE",value="#args[b]['clkposition-JOBCLASSCODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="JOBGRADECODE",value="#args[b]['clkposition-JOBGRADECODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="LABORTYPE",value="#args[b]['clkposition-LABORTYPE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="RECDATECREATED",value="#rereplace(args[b]['clkposition-RECDATECREATED'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="DATELASTUPDATE",value="#rereplace(args[b]['clkposition-DATELASTUPDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="RECCREATEDBY",value="#args[b]['clkposition-RECCREATEDBY']#",cfsqltype="CF_SQL_VARCHAR");
			
		Usql = 'INSERT INTO #session.companycode#_cbose.clkposition (POSITIONCODE,PARENTPOSITION,DESCRIPTION,BUDGETEDHEADCOUNT,TOOLTIP,JOBSTYLE,DEPARTMENTCODE,JOBCLASSCODE,JOBGRADECODE,LABORTYPE,RECDATECREATED,DATELASTUPDATE,RECCREATEDBY)
		          VALUES (:POSITIONCODE, :PARENTPOSITION, :DESCRIPTION, :BUDGETEDHEADCOUNT, :TOOLTIP, :JOBSTYLE, :DEPARTMENTCODE, :JOBCLASSCODE, :JOBGRADECODE, :LABORTYPE, :RECDATECREATED, :DATELASTUPDATE, :RECCREATEDBY)';
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
		queryService.addParam(name="POSITIONCODE",value="#args[b]['clkposition-POSITIONCODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PARENTPOSITION",value="#args[b]['clkposition-PARENTPOSITION']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="DESCRIPTION",value="#args[b]['clkposition-DESCRIPTION']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="BUDGETEDHEADCOUNT",value="#args[b]['clkposition-BUDGETEDHEADCOUNT']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="TOOLTIP",value="#args[b]['clkposition-TOOLTIP']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="JOBSTYLE",value="#args[b]['clkposition-JOBSTYLE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="DEPARTMENTCODE",value="#args[b]['clkposition-DEPARTMENTCODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="JOBCLASSCODE",value="#args[b]['clkposition-JOBCLASSCODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="JOBGRADECODE",value="#args[b]['clkposition-JOBGRADECODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="LABORTYPE",value="#args[b]['clkposition-LABORTYPE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="RECDATECREATED",value="#rereplace(args[b]['clkposition-RECDATECREATED'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="DATELASTUPDATE",value="#rereplace(args[b]['clkposition-DATELASTUPDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="RECCREATEDBY",value="#args[b]['clkposition-RECCREATEDBY']#",cfsqltype="CF_SQL_VARCHAR");
			
		Usql = 'UPDATE #session.companycode#_cbose.clkposition
						SET POSITIONCODE = :POSITIONCODE,PARENTPOSITION = :PARENTPOSITION,DESCRIPTION = :DESCRIPTION,BUDGETEDHEADCOUNT = :BUDGETEDHEADCOUNT,TOOLTIP = :TOOLTIP,JOBSTYLE = :JOBSTYLE,DEPARTMENTCODE = :DEPARTMENTCODE,JOBCLASSCODE = :JOBCLASSCODE,JOBGRADECODE = :JOBGRADECODE,LABORTYPE = :LABORTYPE,RECDATECREATED = :RECDATECREATED,DATELASTUPDATE = :DATELASTUPDATE,RECCREATEDBY = :RECCREATEDBY
			          WHERE POSITIONCODE = :POSITIONCODE';
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
		queryService.addParam(name="POSITIONCODE",value="#args[b]['clkposition-POSITIONCODE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="PARENTPOSITION",value="#args[b]['clkposition-PARENTPOSITION']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="DESCRIPTION",value="#args[b]['clkposition-DESCRIPTION']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="BUDGETEDHEADCOUNT",value="#args[b]['clkposition-BUDGETEDHEADCOUNT']#",cfsqltype="CF_SQL_FLOAT");
		queryService.addParam(name="TOOLTIP",value="#args[b]['clkposition-TOOLTIP']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="JOBSTYLE",value="#args[b]['clkposition-JOBSTYLE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="DEPARTMENTCODE",value="#args[b]['clkposition-DEPARTMENTCODE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="JOBCLASSCODE",value="#args[b]['clkposition-JOBCLASSCODE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="JOBGRADECODE",value="#args[b]['clkposition-JOBGRADECODE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="LABORTYPE",value="#args[b]['clkposition-LABORTYPE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="RECDATECREATED",value="#args[b]['clkposition-RECDATECREATED']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="DATELASTUPDATE",value="#args[b]['clkposition-DATELASTUPDATE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="RECCREATEDBY",value="#args[b]['clkposition-RECCREATEDBY']#",cfsqltype="CF_SQL_VARCHAR");
		
		Usql = 'DELETE FROM #session.companycode#_cbose.clkposition
					  WHERE POSITIONCODE = :POSITIONCODE AND PARENTPOSITION = :PARENTPOSITION AND DESCRIPTION = :DESCRIPTION AND BUDGETEDHEADCOUNT = :BUDGETEDHEADCOUNT AND TOOLTIP = :TOOLTIP AND JOBSTYLE = :JOBSTYLE AND DEPARTMENTCODE = :DEPARTMENTCODE AND JOBCLASSCODE = :JOBCLASSCODE AND JOBGRADECODE = :JOBGRADECODE AND LABORTYPE = :LABORTYPE AND RECDATECREATED = :RECDATECREATED AND DATELASTUPDATE = :DATELASTUPDATE AND RECCREATEDBY = :RECCREATEDBY';
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
	Usql = "SELECT clkposition.POSITIONCODE AS 'Position Code', clkposition.PARENTPOSITION AS 'Parent Position', clkposition.DESCRIPTION AS 'Description', clkposition.BUDGETEDHEADCOUNT AS 'Budgeted Head Count', clkposition.TOOLTIP AS 'Org Chart Tooltip', clkposition.JOBSTYLE AS 'Org Chart Style', clkdepartment.DESCRIPTION AS 'Department', clkjobgrade.DESCRIPTION AS 'Job Grade', clkjobclasscode.DESCRIPTION AS 'Job Class', clklabortype.DESCRIPTION AS 'Labor Type', clkposition.DEPARTMENTCODE AS 'Department Code', clkposition.JOBCLASSCODE AS 'Job Class Code', clkposition.JOBGRADECODE AS 'Job Grade Code', clkposition.LABORTYPE AS 'Labor Type Code', clkposition.RECDATECREATED AS 'Date Created', clkposition.DATELASTUPDATE AS 'Date Last Update', clkposition.RECCREATEDBY AS 'Created By'
			 FROM #session.companycode#_cbose.clkposition  clkposition LEFT OUTER JOIN #session.companycode#_cbose.clkdepartment  clkdepartment ON clkposition.DEPARTMENTCODE = clkdepartment.DEPARTMENTCODE LEFT OUTER JOIN #session.companycode#_cbose.clkjobgrade  clkjobgrade ON clkposition.JOBGRADECODE = clkjobgrade.JOBGRADECODE LEFT OUTER JOIN #session.companycode#_cbose.clkjobclasscode  clkjobclasscode ON clkposition.JOBCLASSCODE = clkjobclasscode.JOBCLASSCODE LEFT OUTER JOIN #session.companycode#_cbose.clklabortype  clklabortype ON clkposition.LABORTYPE = clklabortype.LABORTYPECODE
			 
			 
			 
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