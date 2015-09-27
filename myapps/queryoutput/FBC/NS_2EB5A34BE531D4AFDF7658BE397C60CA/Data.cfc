
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
		WHERE = "WHERE  cin21evaluations.PERSONNELIDNO = '#session.chapa#'";
	} else {
		WHERE = "#WHERE#  AND  cin21evaluations.PERSONNELIDNO = '#session.chapa#'";
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

	Usql = "SELECT cin21evaluations.INTELLRATING AS 'Intel Rating', cin21evaluations.INTELREMARKS AS 'Intel Remarks', cin21evaluations.OVERALLRATING AS 'Overall Rating', cin21evaluations.OVERALLREMARKS AS 'Overall Remarks', cin21evaluations.PERSONALITYRATING AS 'Personality Rating', cin21evaluations.PERSONALITYREMARKS AS 'Personality Remarks', cin21evaluations.RECOMMENDATION AS 'Recommendation', cin21evaluations.VISIONRATING AS 'Vision Rating', cin21evaluations.VISIONREMARKS AS 'Vision Remarks', cin21evaluations.WORKEXPRATING AS 'Work Experience Rating', cin21evaluations.WORKEXPREMARKS AS 'Work Experience Remarks'
			 FROM #session.companycode#_cbose.cin21evaluations cin21evaluations
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
 
    			tmpresult["cin21evaluations-INTELLRATING"] = dquery["INTEL RATING"][b];
    			tmpresult["cin21evaluations-INTELREMARKS"] = dquery["INTEL REMARKS"][b];
    			tmpresult["cin21evaluations-OVERALLRATING"] = dquery["OVERALL RATING"][b];
    			tmpresult["cin21evaluations-OVERALLREMARKS"] = dquery["OVERALL REMARKS"][b];
    			tmpresult["cin21evaluations-PERSONALITYRATING"] = dquery["PERSONALITY RATING"][b];
    			tmpresult["cin21evaluations-PERSONALITYREMARKS"] = dquery["PERSONALITY REMARKS"][b];
    			tmpresult["cin21evaluations-RECOMMENDATION"] = dquery["RECOMMENDATION"][b];
    			tmpresult["cin21evaluations-VISIONRATING"] = dquery["VISION RATING"][b];
    			tmpresult["cin21evaluations-VISIONREMARKS"] = dquery["VISION REMARKS"][b];
    			tmpresult["cin21evaluations-WORKEXPRATING"] = dquery["WORK EXPERIENCE RATING"][b];
    			tmpresult["cin21evaluations-WORKEXPREMARKS"] = dquery["WORK EXPERIENCE REMARKS"][b];
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
		queryService.addParam(name="INTELLRATING",value="#args[b]['cin21evaluations-INTELLRATING']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="INTELREMARKS",value="#args[b]['cin21evaluations-INTELREMARKS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="OVERALLRATING",value="#args[b]['cin21evaluations-OVERALLRATING']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="OVERALLREMARKS",value="#args[b]['cin21evaluations-OVERALLREMARKS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PERSONALITYRATING",value="#args[b]['cin21evaluations-PERSONALITYRATING']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="PERSONALITYREMARKS",value="#args[b]['cin21evaluations-PERSONALITYREMARKS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="RECOMMENDATION",value="#args[b]['cin21evaluations-RECOMMENDATION']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="VISIONRATING",value="#args[b]['cin21evaluations-VISIONRATING']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="VISIONREMARKS",value="#args[b]['cin21evaluations-VISIONREMARKS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="WORKEXPRATING",value="#args[b]['cin21evaluations-WORKEXPRATING']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="WORKEXPREMARKS",value="#args[b]['cin21evaluations-WORKEXPREMARKS']#",cfsqltype="CF_SQL_VARCHAR");
			
		Usql = 'INSERT INTO {COMPANYCODE}_cbose.cin21evaluations (INTELLRATING,INTELREMARKS,OVERALLRATING,OVERALLREMARKS,PERSONALITYRATING,PERSONALITYREMARKS,RECOMMENDATION,VISIONRATING,VISIONREMARKS,WORKEXPRATING,WORKEXPREMARKS)
		          VALUES (:INTELLRATING, :INTELREMARKS, :OVERALLRATING, :OVERALLREMARKS, :PERSONALITYRATING, :PERSONALITYREMARKS, :RECOMMENDATION, :VISIONRATING, :VISIONREMARKS, :WORKEXPRATING, :WORKEXPREMARKS)';
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
		queryService.addParam(name="INTELLRATING",value="#args[b]['cin21evaluations-INTELLRATING']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="INTELREMARKS",value="#args[b]['cin21evaluations-INTELREMARKS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="OVERALLRATING",value="#args[b]['cin21evaluations-OVERALLRATING']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="OVERALLREMARKS",value="#args[b]['cin21evaluations-OVERALLREMARKS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PERSONALITYRATING",value="#args[b]['cin21evaluations-PERSONALITYRATING']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="PERSONALITYREMARKS",value="#args[b]['cin21evaluations-PERSONALITYREMARKS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="RECOMMENDATION",value="#args[b]['cin21evaluations-RECOMMENDATION']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="VISIONRATING",value="#args[b]['cin21evaluations-VISIONRATING']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="VISIONREMARKS",value="#args[b]['cin21evaluations-VISIONREMARKS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="WORKEXPRATING",value="#args[b]['cin21evaluations-WORKEXPRATING']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="WORKEXPREMARKS",value="#args[b]['cin21evaluations-WORKEXPREMARKS']#",cfsqltype="CF_SQL_VARCHAR");
			
		Usql = 'UPDATE {COMPANYCODE}_cbose.cin21evaluations
						SET INTELLRATING = :INTELLRATING,INTELREMARKS = :INTELREMARKS,OVERALLRATING = :OVERALLRATING,OVERALLREMARKS = :OVERALLREMARKS,PERSONALITYRATING = :PERSONALITYRATING,PERSONALITYREMARKS = :PERSONALITYREMARKS,RECOMMENDATION = :RECOMMENDATION,VISIONRATING = :VISIONRATING,VISIONREMARKS = :VISIONREMARKS,WORKEXPRATING = :WORKEXPRATING,WORKEXPREMARKS = :WORKEXPREMARKS
			          WHERE INTELLRATING = :INTELLRATING';
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
		queryService.addParam(name="INTELLRATING",value="#args[b]['cin21evaluations-INTELLRATING']#",cfsqltype="CF_SQL_FLOAT");
		queryService.addParam(name="INTELREMARKS",value="#args[b]['cin21evaluations-INTELREMARKS']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="OVERALLRATING",value="#args[b]['cin21evaluations-OVERALLRATING']#",cfsqltype="CF_SQL_FLOAT");
		queryService.addParam(name="OVERALLREMARKS",value="#args[b]['cin21evaluations-OVERALLREMARKS']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="PERSONALITYRATING",value="#args[b]['cin21evaluations-PERSONALITYRATING']#",cfsqltype="CF_SQL_FLOAT");
		queryService.addParam(name="PERSONALITYREMARKS",value="#args[b]['cin21evaluations-PERSONALITYREMARKS']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="RECOMMENDATION",value="#args[b]['cin21evaluations-RECOMMENDATION']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="VISIONRATING",value="#args[b]['cin21evaluations-VISIONRATING']#",cfsqltype="CF_SQL_FLOAT");
		queryService.addParam(name="VISIONREMARKS",value="#args[b]['cin21evaluations-VISIONREMARKS']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="WORKEXPRATING",value="#args[b]['cin21evaluations-WORKEXPRATING']#",cfsqltype="CF_SQL_FLOAT");
		queryService.addParam(name="WORKEXPREMARKS",value="#args[b]['cin21evaluations-WORKEXPREMARKS']#",cfsqltype="CF_SQL_VARCHAR");
		
		Usql = 'DELETE FROM {COMPANYCODE}_cbose.cin21evaluations
					  WHERE INTELLRATING = :INTELLRATING AND INTELREMARKS = :INTELREMARKS AND OVERALLRATING = :OVERALLRATING AND OVERALLREMARKS = :OVERALLREMARKS AND PERSONALITYRATING = :PERSONALITYRATING AND PERSONALITYREMARKS = :PERSONALITYREMARKS AND RECOMMENDATION = :RECOMMENDATION AND VISIONRATING = :VISIONRATING AND VISIONREMARKS = :VISIONREMARKS AND WORKEXPRATING = :WORKEXPRATING AND WORKEXPREMARKS = :WORKEXPREMARKS';
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
	Usql = "SELECT cin21evaluations.INTELLRATING AS 'Intel Rating', cin21evaluations.INTELREMARKS AS 'Intel Remarks', cin21evaluations.OVERALLRATING AS 'Overall Rating', cin21evaluations.OVERALLREMARKS AS 'Overall Remarks', cin21evaluations.PERSONALITYRATING AS 'Personality Rating', cin21evaluations.PERSONALITYREMARKS AS 'Personality Remarks', cin21evaluations.RECOMMENDATION AS 'Recommendation', cin21evaluations.VISIONRATING AS 'Vision Rating', cin21evaluations.VISIONREMARKS AS 'Vision Remarks', cin21evaluations.WORKEXPRATING AS 'Work Experience Rating', cin21evaluations.WORKEXPREMARKS AS 'Work Experience Remarks'
			 FROM #session.companycode#_cbose.cin21evaluations cin21evaluations
			 WHERE  cin21evaluations.PERSONNELIDNO = '#session.chapa#'
			 
			 
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