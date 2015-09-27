
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

	Usql = "SELECT eginpmsempopr.OPRCODE AS 'Overall Performance Rating Code', eginpmsempopr.KRACODEFK AS 'KRA Code Fk', eginpmsempopr.NAMEANDSIGOFEMPLOYEE AS 'Name and Signature of Employee', eginpmsempopr.NAMEANDSIGDATE AS 'Date', eginpmsempopr.HRADRECEIVEDBY AS 'Received By', eginpmsempopr.HRADRECEIVEDBYDATE AS 'Received By Date', eginpmsempopr.RATEDBY AS 'Rated By', eginpmsempopr.RATEDBYDATE AS 'Date Rated', eginpmsempopr.REVIEWEDBY AS 'Reviewed By', eginpmsempopr.REVIEWEDBYDATE AS 'Date Reviewed', eginpmsempopr.APPROVEDBY AS 'Approved By', eginpmsempopr.APPROVEDBYDATE AS 'Date Approved', eginpmsempopr.REMARKS AS 'Remarks', eginpmsempopr.COMMENTSOFIMMEDSUP AS 'Comments of Immediate Supervisor', eginpmsempkra.KRACODE AS 'KRA Code'
			 FROM ibose_global.eginpmsempopr  eginpmsempopr LEFT OUTER JOIN ibose_global.eginpmsempkra  eginpmsempkra ON eginpmsempopr.KRACODEFK = eginpmsempkra.KRACODE
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
 
    			tmpresult["eginpmsempopr-OPRCODE"] = dquery["OVERALL PERFORMANCE RATING CODE"][b];
    			tmpresult["eginpmsempopr-KRACODEFK"] = dquery["KRA CODE FK"][b];
    			tmpresult["eginpmsempopr-NAMEANDSIGOFEMPLOYEE"] = dquery["NAME AND SIGNATURE OF EMPLOYEE"][b];
    			tmpresult["eginpmsempopr-NAMEANDSIGDATE"] = dquery["DATE"][b];
    			tmpresult["eginpmsempopr-HRADRECEIVEDBY"] = dquery["RECEIVED BY"][b];
    			tmpresult["eginpmsempopr-HRADRECEIVEDBYDATE"] = dquery["RECEIVED BY DATE"][b];
    			tmpresult["eginpmsempopr-RATEDBY"] = dquery["RATED BY"][b];
    			tmpresult["eginpmsempopr-RATEDBYDATE"] = dquery["DATE RATED"][b];
    			tmpresult["eginpmsempopr-REVIEWEDBY"] = dquery["REVIEWED BY"][b];
    			tmpresult["eginpmsempopr-REVIEWEDBYDATE"] = dquery["DATE REVIEWED"][b];
    			tmpresult["eginpmsempopr-APPROVEDBY"] = dquery["APPROVED BY"][b];
    			tmpresult["eginpmsempopr-APPROVEDBYDATE"] = dquery["DATE APPROVED"][b];
    			tmpresult["eginpmsempopr-REMARKS"] = dquery["REMARKS"][b];
    			tmpresult["eginpmsempopr-COMMENTSOFIMMEDSUP"] = dquery["COMMENTS OF IMMEDIATE SUPERVISOR"][b];
    			tmpresult["eginpmsempkra-KRACODE"] = dquery["KRA CODE"][b];
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
		queryService.addParam(name="OPRCODE",value="#args[b]['eginpmsempopr-OPRCODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="KRACODEFK",value="#args[b]['eginpmsempopr-KRACODEFK']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="NAMEANDSIGOFEMPLOYEE",value="#args[b]['eginpmsempopr-NAMEANDSIGOFEMPLOYEE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="NAMEANDSIGDATE",value="#rereplace(args[b]['eginpmsempopr-NAMEANDSIGDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="HRADRECEIVEDBY",value="#args[b]['eginpmsempopr-HRADRECEIVEDBY']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="HRADRECEIVEDBYDATE",value="#rereplace(args[b]['eginpmsempopr-HRADRECEIVEDBYDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="RATEDBY",value="#args[b]['eginpmsempopr-RATEDBY']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="RATEDBYDATE",value="#rereplace(args[b]['eginpmsempopr-RATEDBYDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="REVIEWEDBY",value="#args[b]['eginpmsempopr-REVIEWEDBY']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="REVIEWEDBYDATE",value="#rereplace(args[b]['eginpmsempopr-REVIEWEDBYDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="APPROVEDBY",value="#args[b]['eginpmsempopr-APPROVEDBY']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="APPROVEDBYDATE",value="#rereplace(args[b]['eginpmsempopr-APPROVEDBYDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="REMARKS",value="#args[b]['eginpmsempopr-REMARKS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="COMMENTSOFIMMEDSUP",value="#args[b]['eginpmsempopr-COMMENTSOFIMMEDSUP']#",cfsqltype="CF_SQL_VARCHAR");
			
		Usql = 'INSERT INTO ibose_global.eginpmsempopr (OPRCODE,KRACODEFK,NAMEANDSIGOFEMPLOYEE,NAMEANDSIGDATE,HRADRECEIVEDBY,HRADRECEIVEDBYDATE,RATEDBY,RATEDBYDATE,REVIEWEDBY,REVIEWEDBYDATE,APPROVEDBY,APPROVEDBYDATE,REMARKS,COMMENTSOFIMMEDSUP)
		          VALUES (:OPRCODE, :KRACODEFK, :NAMEANDSIGOFEMPLOYEE, :NAMEANDSIGDATE, :HRADRECEIVEDBY, :HRADRECEIVEDBYDATE, :RATEDBY, :RATEDBYDATE, :REVIEWEDBY, :REVIEWEDBYDATE, :APPROVEDBY, :APPROVEDBYDATE, :REMARKS, :COMMENTSOFIMMEDSUP)';
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
		queryService.addParam(name="OPRCODE",value="#args[b]['eginpmsempopr-OPRCODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="KRACODEFK",value="#args[b]['eginpmsempopr-KRACODEFK']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="NAMEANDSIGOFEMPLOYEE",value="#args[b]['eginpmsempopr-NAMEANDSIGOFEMPLOYEE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="NAMEANDSIGDATE",value="#rereplace(args[b]['eginpmsempopr-NAMEANDSIGDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="HRADRECEIVEDBY",value="#args[b]['eginpmsempopr-HRADRECEIVEDBY']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="HRADRECEIVEDBYDATE",value="#rereplace(args[b]['eginpmsempopr-HRADRECEIVEDBYDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="RATEDBY",value="#args[b]['eginpmsempopr-RATEDBY']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="RATEDBYDATE",value="#rereplace(args[b]['eginpmsempopr-RATEDBYDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="REVIEWEDBY",value="#args[b]['eginpmsempopr-REVIEWEDBY']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="REVIEWEDBYDATE",value="#rereplace(args[b]['eginpmsempopr-REVIEWEDBYDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="APPROVEDBY",value="#args[b]['eginpmsempopr-APPROVEDBY']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="APPROVEDBYDATE",value="#rereplace(args[b]['eginpmsempopr-APPROVEDBYDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="REMARKS",value="#args[b]['eginpmsempopr-REMARKS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="COMMENTSOFIMMEDSUP",value="#args[b]['eginpmsempopr-COMMENTSOFIMMEDSUP']#",cfsqltype="CF_SQL_VARCHAR");
			
		Usql = 'UPDATE ibose_global.eginpmsempopr
						SET OPRCODE = :OPRCODE,KRACODEFK = :KRACODEFK,NAMEANDSIGOFEMPLOYEE = :NAMEANDSIGOFEMPLOYEE,NAMEANDSIGDATE = :NAMEANDSIGDATE,HRADRECEIVEDBY = :HRADRECEIVEDBY,HRADRECEIVEDBYDATE = :HRADRECEIVEDBYDATE,RATEDBY = :RATEDBY,RATEDBYDATE = :RATEDBYDATE,REVIEWEDBY = :REVIEWEDBY,REVIEWEDBYDATE = :REVIEWEDBYDATE,APPROVEDBY = :APPROVEDBY,APPROVEDBYDATE = :APPROVEDBYDATE,REMARKS = :REMARKS,COMMENTSOFIMMEDSUP = :COMMENTSOFIMMEDSUP
			          WHERE OPRCODE = :OPRCODE';
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
		queryService.addParam(name="OPRCODE",value="#args[b]['eginpmsempopr-OPRCODE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="KRACODEFK",value="#args[b]['eginpmsempopr-KRACODEFK']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="NAMEANDSIGOFEMPLOYEE",value="#args[b]['eginpmsempopr-NAMEANDSIGOFEMPLOYEE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="NAMEANDSIGDATE",value="#rereplace(args[b]['eginpmsempopr-NAMEANDSIGDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
			queryService.addParam(name="HRADRECEIVEDBY",value="#args[b]['eginpmsempopr-HRADRECEIVEDBY']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="HRADRECEIVEDBYDATE",value="#rereplace(args[b]['eginpmsempopr-HRADRECEIVEDBYDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
			queryService.addParam(name="RATEDBY",value="#args[b]['eginpmsempopr-RATEDBY']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="RATEDBYDATE",value="#rereplace(args[b]['eginpmsempopr-RATEDBYDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
			queryService.addParam(name="REVIEWEDBY",value="#args[b]['eginpmsempopr-REVIEWEDBY']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="REVIEWEDBYDATE",value="#rereplace(args[b]['eginpmsempopr-REVIEWEDBYDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
			queryService.addParam(name="APPROVEDBY",value="#args[b]['eginpmsempopr-APPROVEDBY']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="APPROVEDBYDATE",value="#rereplace(args[b]['eginpmsempopr-APPROVEDBYDATE'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
			queryService.addParam(name="REMARKS",value="#args[b]['eginpmsempopr-REMARKS']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="COMMENTSOFIMMEDSUP",value="#args[b]['eginpmsempopr-COMMENTSOFIMMEDSUP']#",cfsqltype="CF_SQL_VARCHAR");
		
		Usql = 'DELETE FROM ibose_global.eginpmsempopr
					  WHERE OPRCODE = :OPRCODE AND KRACODEFK = :KRACODEFK AND NAMEANDSIGOFEMPLOYEE = :NAMEANDSIGOFEMPLOYEE AND NAMEANDSIGDATE = :NAMEANDSIGDATE AND HRADRECEIVEDBY = :HRADRECEIVEDBY AND HRADRECEIVEDBYDATE = :HRADRECEIVEDBYDATE AND RATEDBY = :RATEDBY AND RATEDBYDATE = :RATEDBYDATE AND REVIEWEDBY = :REVIEWEDBY AND REVIEWEDBYDATE = :REVIEWEDBYDATE AND APPROVEDBY = :APPROVEDBY AND APPROVEDBYDATE = :APPROVEDBYDATE AND REMARKS = :REMARKS AND COMMENTSOFIMMEDSUP = :COMMENTSOFIMMEDSUP';
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
	Usql = "SELECT eginpmsempopr.OPRCODE AS 'Overall Performance Rating Code', eginpmsempopr.KRACODEFK AS 'KRA Code Fk', eginpmsempopr.NAMEANDSIGOFEMPLOYEE AS 'Name and Signature of Employee', eginpmsempopr.NAMEANDSIGDATE AS 'Date', eginpmsempopr.HRADRECEIVEDBY AS 'Received By', eginpmsempopr.HRADRECEIVEDBYDATE AS 'Received By Date', eginpmsempopr.RATEDBY AS 'Rated By', eginpmsempopr.RATEDBYDATE AS 'Date Rated', eginpmsempopr.REVIEWEDBY AS 'Reviewed By', eginpmsempopr.REVIEWEDBYDATE AS 'Date Reviewed', eginpmsempopr.APPROVEDBY AS 'Approved By', eginpmsempopr.APPROVEDBYDATE AS 'Date Approved', eginpmsempopr.REMARKS AS 'Remarks', eginpmsempopr.COMMENTSOFIMMEDSUP AS 'Comments of Immediate Supervisor', eginpmsempkra.KRACODE AS 'KRA Code'
			 FROM ibose_global.eginpmsempopr  eginpmsempopr LEFT OUTER JOIN ibose_global.eginpmsempkra  eginpmsempkra ON eginpmsempopr.KRACODEFK = eginpmsempkra.KRACODE
			 
			 
			 
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