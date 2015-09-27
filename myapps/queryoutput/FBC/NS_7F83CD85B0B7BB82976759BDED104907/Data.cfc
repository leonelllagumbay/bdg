
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
		ORDERBY = "ORDER BY eginpmsbehavioralcomp.BCORDER ASC";
	} else {
		ORDERBY = "ORDER BY #ORDERBY# ,eginpmsbehavioralcomp.BCORDER ASC";
	}

	Usql = "SELECT eginpmsempba.BACODE AS 'BA Code', eginpmsempba.KRACODEFK AS 'KRA Code FK', eginpmsempba.BEHAVIORALCOMPCODEFK AS 'BC Code Fk', eginpmsbehavioralcomp.DGROUP AS 'The Group', eginpmsbehavioralcomp.SUBGROUP AS 'Subgroup', eginpmsbehavioralcomp.BEHAVIORALCOMP AS 'BEHAVIORAL COMPETENCIES', eginpmsempba.RATING AS 'RATING', eginpmsempba.COMMENTS AS 'COMMENTS', eginpmsbehavioralcomp.BEHAVIORALCOMPCODE AS 'Behavioral Competency Code', eginpmsbehavioralcomp.BCORDER AS 'The Order', eginpmsempkra.KRACODE AS 'KRA Code'
			 FROM ibose_global.eginpmsempba  eginpmsempba RIGHT OUTER JOIN ibose_global.eginpmsempkra  eginpmsempkra ON eginpmsempkra.KRACODE = eginpmsempba.KRACODEFK RIGHT OUTER JOIN ibose_global.eginpmsbehavioralcomp  eginpmsbehavioralcomp ON eginpmsbehavioralcomp.BEHAVIORALCOMPCODE = eginpmsempba.BEHAVIORALCOMPCODEFK
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

    			tmpresult["eginpmsempba-BACODE"] = dquery["BA CODE"][b];
    			tmpresult["eginpmsempba-KRACODEFK"] = dquery["KRA CODE FK"][b];
    			tmpresult["eginpmsempba-BEHAVIORALCOMPCODEFK"] = dquery["BC CODE FK"][b];
    			tmpresult["eginpmsbehavioralcomp-DGROUP"] = dquery["THE GROUP"][b];
    			tmpresult["eginpmsbehavioralcomp-SUBGROUP"] = dquery["SUBGROUP"][b];
    			tmpresult["eginpmsbehavioralcomp-BEHAVIORALCOMP"] = dquery["BEHAVIORAL COMPETENCIES"][b];
    			tmpresult["eginpmsempba-RATING"] = dquery["RATING"][b];
    			tmpresult["eginpmsempba-COMMENTS"] = dquery["COMMENTS"][b];
    			tmpresult["eginpmsbehavioralcomp-BEHAVIORALCOMPCODE"] = dquery["BEHAVIORAL COMPETENCY CODE"][b];
    			tmpresult["eginpmsbehavioralcomp-BCORDER"] = dquery["THE ORDER"][b];
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
		queryService.addParam(name="BACODE",value="#args[b]['eginpmsempba-BACODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="KRACODEFK",value="#args[b]['eginpmsempba-KRACODEFK']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="BEHAVIORALCOMPCODEFK",value="#args[b]['eginpmsempba-BEHAVIORALCOMPCODEFK']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="RATING",value="#args[b]['eginpmsempba-RATING']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="COMMENTS",value="#args[b]['eginpmsempba-COMMENTS']#",cfsqltype="CF_SQL_VARCHAR");

		Usql = 'INSERT INTO ibose_global.eginpmsempba (BACODE,KRACODEFK,BEHAVIORALCOMPCODEFK,RATING,COMMENTS)
		          VALUES (:BACODE, :KRACODEFK, :BEHAVIORALCOMPCODEFK, :RATING, :COMMENTS)';
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
		if (trim(args[b]['eginpmsempba-BACODE']) == "") {
			queryService = new query();
			queryService.addParam(name="BACODE",value="#createUuid()#",cfsqltype="CF_SQL_VARCHAR");
				queryService.addParam(name="KRACODEFK",value="#args[b]['eginpmsempba-KRACODEFK']#",cfsqltype="CF_SQL_VARCHAR");
				queryService.addParam(name="BEHAVIORALCOMPCODEFK",value="#args[b]['eginpmsbehavioralcomp-BEHAVIORALCOMPCODE']#",cfsqltype="CF_SQL_VARCHAR");
				queryService.addParam(name="RATING",value="#args[b]['eginpmsempba-RATING']#",cfsqltype="CF_SQL_VARCHAR");
				queryService.addParam(name="COMMENTS",value="#args[b]['eginpmsempba-COMMENTS']#",cfsqltype="CF_SQL_VARCHAR");

			Usql = 'INSERT INTO ibose_global.eginpmsempba (BACODE,KRACODEFK,BEHAVIORALCOMPCODEFK,RATING,COMMENTS)
			          VALUES (:BACODE, :KRACODEFK, :BEHAVIORALCOMPCODEFK, :RATING, :COMMENTS)';
			queryService.setDatasource(session.global_dsn);
		  	queryService.setName('qryname');
			queryService.setSQL(Usql);
		} else {
			queryService = new query();
			queryService.addParam(name="BACODE",value="#args[b]['eginpmsempba-BACODE']#",cfsqltype="CF_SQL_VARCHAR");
				queryService.addParam(name="KRACODEFK",value="#args[b]['eginpmsempba-KRACODEFK']#",cfsqltype="CF_SQL_VARCHAR");
				queryService.addParam(name="BEHAVIORALCOMPCODEFK",value="#args[b]['eginpmsempba-BEHAVIORALCOMPCODEFK']#",cfsqltype="CF_SQL_VARCHAR");
				queryService.addParam(name="RATING",value="#args[b]['eginpmsempba-RATING']#",cfsqltype="CF_SQL_VARCHAR");
				queryService.addParam(name="COMMENTS",value="#args[b]['eginpmsempba-COMMENTS']#",cfsqltype="CF_SQL_VARCHAR");

			Usql = 'UPDATE ibose_global.eginpmsempba
							SET BACODE = :BACODE,KRACODEFK = :KRACODEFK,BEHAVIORALCOMPCODEFK = :BEHAVIORALCOMPCODEFK,RATING = :RATING,COMMENTS = :COMMENTS
				          WHERE BACODE = :BACODE';
			queryService.setDatasource(session.global_dsn);
		  	queryService.setName('qryname');
			queryService.setSQL(Usql);
		}

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
		queryService.addParam(name="BACODE",value="#args[b]['eginpmsempba-BACODE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="KRACODEFK",value="#args[b]['eginpmsempba-KRACODEFK']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="BEHAVIORALCOMPCODEFK",value="#args[b]['eginpmsempba-BEHAVIORALCOMPCODEFK']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="RATING",value="#args[b]['eginpmsempba-RATING']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="COMMENTS",value="#args[b]['eginpmsempba-COMMENTS']#",cfsqltype="CF_SQL_VARCHAR");

		Usql = 'DELETE FROM ibose_global.eginpmsempba
					  WHERE BACODE = :BACODE AND KRACODEFK = :KRACODEFK AND BEHAVIORALCOMPCODEFK = :BEHAVIORALCOMPCODEFK AND RATING = :RATING AND COMMENTS = :COMMENTS';
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
	Usql = "SELECT eginpmsempba.BACODE AS 'BA Code', eginpmsempba.KRACODEFK AS 'KRA Code FK', eginpmsempba.BEHAVIORALCOMPCODEFK AS 'BC Code Fk', eginpmsbehavioralcomp.DGROUP AS 'The Group', eginpmsbehavioralcomp.SUBGROUP AS 'Subgroup', eginpmsbehavioralcomp.BEHAVIORALCOMP AS 'BEHAVIORAL COMPETENCIES', eginpmsempba.RATING AS 'RATING', eginpmsempba.COMMENTS AS 'COMMENTS', eginpmsbehavioralcomp.BEHAVIORALCOMPCODE AS 'Behavioral Competency Code', eginpmsbehavioralcomp.BCORDER AS 'The Order', eginpmsempkra.KRACODE AS 'KRA Code'
			 FROM ibose_global.eginpmsempba  eginpmsempba RIGHT OUTER JOIN ibose_global.eginpmsempkra  eginpmsempkra ON eginpmsempkra.KRACODE = eginpmsempba.KRACODEFK RIGHT OUTER JOIN ibose_global.eginpmsbehavioralcomp  eginpmsbehavioralcomp ON eginpmsbehavioralcomp.BEHAVIORALCOMPCODE = eginpmsempba.BEHAVIORALCOMPCODEFK



			 ORDER BY eginpmsbehavioralcomp.BCORDER ASC";
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