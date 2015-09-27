
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
		WHERE = "WHERE  cin21workhistory.PERSONNELIDNO = '#session.chapa#'";
	} else {
		WHERE = "#WHERE#  AND  cin21workhistory.PERSONNELIDNO = '#session.chapa#'";
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

	Usql = "SELECT cin21workhistory.ENTITYCODE AS 'Company Name', cin21workhistory.MAINDUTIES AS 'Company Address', cin21workhistory.COMPANYCONTACT AS 'Contact Information', cin21workhistory.LASTPOSITIONHELD AS 'Last Position Held', cin21workhistory.ACCOMPLISHMENT AS 'Major Accomplishments', cin21workhistory.REASONFORLEAVING AS 'Reasons for Leaving', cin21workhistory.DATEHIRED AS 'Date Employed', cin21workhistory.SEPARATIONDATE AS 'Date Separated', cin21workhistory.WORKSTARTINGSALARY AS 'Starting Salary', cin21workhistory.WORKENDINGSALARY AS 'Last Salary', cin21workhistory.DEPARTMENT AS 'Department', cin21workhistory.SUPERIOR AS 'Immediate Superior', cin21workhistory.SUPERIORPOSITION AS 'Position of Superior', cin21workhistory.SUPERIORCONTACT AS 'Contact No of Superior'
			 FROM #session.companycode#_cbose.cin21workhistory cin21workhistory
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
 
    			tmpresult["cin21workhistory-ENTITYCODE"] = dquery["COMPANY NAME"][b];
    			tmpresult["cin21workhistory-MAINDUTIES"] = dquery["COMPANY ADDRESS"][b];
    			tmpresult["cin21workhistory-COMPANYCONTACT"] = dquery["CONTACT INFORMATION"][b];
    			tmpresult["cin21workhistory-LASTPOSITIONHELD"] = dquery["LAST POSITION HELD"][b];
    			tmpresult["cin21workhistory-ACCOMPLISHMENT"] = dquery["MAJOR ACCOMPLISHMENTS"][b];
    			tmpresult["cin21workhistory-REASONFORLEAVING"] = dquery["REASONS FOR LEAVING"][b];
    			tmpresult["cin21workhistory-DATEHIRED"] = dquery["DATE EMPLOYED"][b];
    			tmpresult["cin21workhistory-SEPARATIONDATE"] = dquery["DATE SEPARATED"][b];
    			tmpresult["cin21workhistory-WORKSTARTINGSALARY"] = dquery["STARTING SALARY"][b];
    			tmpresult["cin21workhistory-WORKENDINGSALARY"] = dquery["LAST SALARY"][b];
    			tmpresult["cin21workhistory-DEPARTMENT"] = dquery["DEPARTMENT"][b];
    			tmpresult["cin21workhistory-SUPERIOR"] = dquery["IMMEDIATE SUPERIOR"][b];
    			tmpresult["cin21workhistory-SUPERIORPOSITION"] = dquery["POSITION OF SUPERIOR"][b];
    			tmpresult["cin21workhistory-SUPERIORCONTACT"] = dquery["CONTACT NO OF SUPERIOR"][b];
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
		queryService.addParam(name="ENTITYCODE",value="#args[b]['cin21workhistory-ENTITYCODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="MAINDUTIES",value="#args[b]['cin21workhistory-MAINDUTIES']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="COMPANYCONTACT",value="#args[b]['cin21workhistory-COMPANYCONTACT']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="LASTPOSITIONHELD",value="#args[b]['cin21workhistory-LASTPOSITIONHELD']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="ACCOMPLISHMENT",value="#args[b]['cin21workhistory-ACCOMPLISHMENT']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="REASONFORLEAVING",value="#args[b]['cin21workhistory-REASONFORLEAVING']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="DATEHIRED",value="#rereplace(args[b]['cin21workhistory-DATEHIRED'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="SEPARATIONDATE",value="#rereplace(args[b]['cin21workhistory-SEPARATIONDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="WORKSTARTINGSALARY",value="#args[b]['cin21workhistory-WORKSTARTINGSALARY']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="WORKENDINGSALARY",value="#args[b]['cin21workhistory-WORKENDINGSALARY']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="DEPARTMENT",value="#args[b]['cin21workhistory-DEPARTMENT']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="SUPERIOR",value="#args[b]['cin21workhistory-SUPERIOR']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="SUPERIORPOSITION",value="#args[b]['cin21workhistory-SUPERIORPOSITION']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="SUPERIORCONTACT",value="#args[b]['cin21workhistory-SUPERIORCONTACT']#",cfsqltype="CF_SQL_VARCHAR");
			
		Usql = 'INSERT INTO {COMPANYCODE}_cbose.cin21workhistory (ENTITYCODE,MAINDUTIES,COMPANYCONTACT,LASTPOSITIONHELD,ACCOMPLISHMENT,REASONFORLEAVING,DATEHIRED,SEPARATIONDATE,WORKSTARTINGSALARY,WORKENDINGSALARY,DEPARTMENT,SUPERIOR,SUPERIORPOSITION,SUPERIORCONTACT)
		          VALUES (:ENTITYCODE, :MAINDUTIES, :COMPANYCONTACT, :LASTPOSITIONHELD, :ACCOMPLISHMENT, :REASONFORLEAVING, :DATEHIRED, :SEPARATIONDATE, :WORKSTARTINGSALARY, :WORKENDINGSALARY, :DEPARTMENT, :SUPERIOR, :SUPERIORPOSITION, :SUPERIORCONTACT)';
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
		queryService.addParam(name="ENTITYCODE",value="#args[b]['cin21workhistory-ENTITYCODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="MAINDUTIES",value="#args[b]['cin21workhistory-MAINDUTIES']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="COMPANYCONTACT",value="#args[b]['cin21workhistory-COMPANYCONTACT']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="LASTPOSITIONHELD",value="#args[b]['cin21workhistory-LASTPOSITIONHELD']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="ACCOMPLISHMENT",value="#args[b]['cin21workhistory-ACCOMPLISHMENT']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="REASONFORLEAVING",value="#args[b]['cin21workhistory-REASONFORLEAVING']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="DATEHIRED",value="#rereplace(args[b]['cin21workhistory-DATEHIRED'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="SEPARATIONDATE",value="#rereplace(args[b]['cin21workhistory-SEPARATIONDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="WORKSTARTINGSALARY",value="#args[b]['cin21workhistory-WORKSTARTINGSALARY']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="WORKENDINGSALARY",value="#args[b]['cin21workhistory-WORKENDINGSALARY']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="DEPARTMENT",value="#args[b]['cin21workhistory-DEPARTMENT']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="SUPERIOR",value="#args[b]['cin21workhistory-SUPERIOR']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="SUPERIORPOSITION",value="#args[b]['cin21workhistory-SUPERIORPOSITION']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="SUPERIORCONTACT",value="#args[b]['cin21workhistory-SUPERIORCONTACT']#",cfsqltype="CF_SQL_VARCHAR");
			
		Usql = 'UPDATE {COMPANYCODE}_cbose.cin21workhistory
						SET ENTITYCODE = :ENTITYCODE,MAINDUTIES = :MAINDUTIES,COMPANYCONTACT = :COMPANYCONTACT,LASTPOSITIONHELD = :LASTPOSITIONHELD,ACCOMPLISHMENT = :ACCOMPLISHMENT,REASONFORLEAVING = :REASONFORLEAVING,DATEHIRED = :DATEHIRED,SEPARATIONDATE = :SEPARATIONDATE,WORKSTARTINGSALARY = :WORKSTARTINGSALARY,WORKENDINGSALARY = :WORKENDINGSALARY,DEPARTMENT = :DEPARTMENT,SUPERIOR = :SUPERIOR,SUPERIORPOSITION = :SUPERIORPOSITION,SUPERIORCONTACT = :SUPERIORCONTACT
			          WHERE ENTITYCODE = :ENTITYCODE';
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
		queryService.addParam(name="ENTITYCODE",value="#args[b]['cin21workhistory-ENTITYCODE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="MAINDUTIES",value="#args[b]['cin21workhistory-MAINDUTIES']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="COMPANYCONTACT",value="#args[b]['cin21workhistory-COMPANYCONTACT']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="LASTPOSITIONHELD",value="#args[b]['cin21workhistory-LASTPOSITIONHELD']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="ACCOMPLISHMENT",value="#args[b]['cin21workhistory-ACCOMPLISHMENT']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="REASONFORLEAVING",value="#args[b]['cin21workhistory-REASONFORLEAVING']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="DATEHIRED",value="#rereplace(args[b]['cin21workhistory-DATEHIRED'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
			queryService.addParam(name="SEPARATIONDATE",value="#rereplace(args[b]['cin21workhistory-SEPARATIONDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
			queryService.addParam(name="WORKSTARTINGSALARY",value="#args[b]['cin21workhistory-WORKSTARTINGSALARY']#",cfsqltype="CF_SQL_FLOAT");
		queryService.addParam(name="WORKENDINGSALARY",value="#args[b]['cin21workhistory-WORKENDINGSALARY']#",cfsqltype="CF_SQL_FLOAT");
		queryService.addParam(name="DEPARTMENT",value="#args[b]['cin21workhistory-DEPARTMENT']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="SUPERIOR",value="#args[b]['cin21workhistory-SUPERIOR']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="SUPERIORPOSITION",value="#args[b]['cin21workhistory-SUPERIORPOSITION']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="SUPERIORCONTACT",value="#args[b]['cin21workhistory-SUPERIORCONTACT']#",cfsqltype="CF_SQL_VARCHAR");
		
		Usql = 'DELETE FROM {COMPANYCODE}_cbose.cin21workhistory
					  WHERE ENTITYCODE = :ENTITYCODE AND MAINDUTIES = :MAINDUTIES AND COMPANYCONTACT = :COMPANYCONTACT AND LASTPOSITIONHELD = :LASTPOSITIONHELD AND ACCOMPLISHMENT = :ACCOMPLISHMENT AND REASONFORLEAVING = :REASONFORLEAVING AND DATEHIRED = :DATEHIRED AND SEPARATIONDATE = :SEPARATIONDATE AND WORKSTARTINGSALARY = :WORKSTARTINGSALARY AND WORKENDINGSALARY = :WORKENDINGSALARY AND DEPARTMENT = :DEPARTMENT AND SUPERIOR = :SUPERIOR AND SUPERIORPOSITION = :SUPERIORPOSITION AND SUPERIORCONTACT = :SUPERIORCONTACT';
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
	Usql = "SELECT cin21workhistory.ENTITYCODE AS 'Company Name', cin21workhistory.MAINDUTIES AS 'Company Address', cin21workhistory.COMPANYCONTACT AS 'Contact Information', cin21workhistory.LASTPOSITIONHELD AS 'Last Position Held', cin21workhistory.ACCOMPLISHMENT AS 'Major Accomplishments', cin21workhistory.REASONFORLEAVING AS 'Reasons for Leaving', cin21workhistory.DATEHIRED AS 'Date Employed', cin21workhistory.SEPARATIONDATE AS 'Date Separated', cin21workhistory.WORKSTARTINGSALARY AS 'Starting Salary', cin21workhistory.WORKENDINGSALARY AS 'Last Salary', cin21workhistory.DEPARTMENT AS 'Department', cin21workhistory.SUPERIOR AS 'Immediate Superior', cin21workhistory.SUPERIORPOSITION AS 'Position of Superior', cin21workhistory.SUPERIORCONTACT AS 'Contact No of Superior'
			 FROM #session.companycode#_cbose.cin21workhistory cin21workhistory
			 WHERE  cin21workhistory.PERSONNELIDNO = '#session.chapa#'
			 
			 
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