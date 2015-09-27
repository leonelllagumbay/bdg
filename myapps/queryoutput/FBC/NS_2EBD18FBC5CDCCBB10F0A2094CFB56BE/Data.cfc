
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
		WHERE = "WHERE  cin21medhistory.PERSONNELIDNO = '#session.chapa#'";
	} else {
		WHERE = "#WHERE#  AND  cin21medhistory.PERSONNELIDNO = '#session.chapa#'";
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

	Usql = "SELECT cin21medhistory.ALLERGIES AS 'Allergies', cin21medhistory.BLOODTYPE AS 'Blood Type', cin21medhistory.CLASSCODE AS 'Class Code', cin21medhistory.CLASSIFICATION AS 'Classification', cin21medhistory.DATECONSULT AS 'Date Consulted', cin21medhistory.DEPENDENTNAME AS 'Dependent Name', cin21medhistory.DOCTORSNAME AS 'Doctors Name', cin21medhistory.FINDINGS AS 'Findings', cin21medhistory.HOSPITAL AS 'Hospital', cin21medhistory.LEFTCONTACTGRADE AS 'Left Contact Grade', cin21medhistory.LEFTEYEGRADE AS 'Left Eye Grade', cin21medhistory.PHYSICALSPEC AS 'Physical Spec', cin21medhistory.MAJORDISEASES AS 'Major Diseases', cin21medhistory.RECOMMENDATIONS AS 'Recommendations', cin21medhistory.REMARKS AS 'Remarks', cin21medhistory.RIGHTCONTACTGRADE AS 'Right Contact Grade', cin21medhistory.RIGHTEYEGRADE AS 'Right Eye Grade', cin21medhistory.VISSION AS 'Vision', cin21medhistory.WEARCONTACTLENSES AS 'Wear Contact Lenses', cin21medhistory.WEAREYEGLASSES AS 'Wear Eye Glasses', cin21medhistory.XRAYRESULT AS 'X Ray Result', cin21medhistory.MAJORILLSURGERIES AS 'Major Ill Surgeries', cin21medhistory.MEDCASENUMBER AS 'Med Case Number'
			 FROM #session.companycode#_cbose.cin21medhistory cin21medhistory
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
 
    			tmpresult["cin21medhistory-ALLERGIES"] = dquery["ALLERGIES"][b];
    			tmpresult["cin21medhistory-BLOODTYPE"] = dquery["BLOOD TYPE"][b];
    			tmpresult["cin21medhistory-CLASSCODE"] = dquery["CLASS CODE"][b];
    			tmpresult["cin21medhistory-CLASSIFICATION"] = dquery["CLASSIFICATION"][b];
    			tmpresult["cin21medhistory-DATECONSULT"] = dquery["DATE CONSULTED"][b];
    			tmpresult["cin21medhistory-DEPENDENTNAME"] = dquery["DEPENDENT NAME"][b];
    			tmpresult["cin21medhistory-DOCTORSNAME"] = dquery["DOCTORS NAME"][b];
    			tmpresult["cin21medhistory-FINDINGS"] = dquery["FINDINGS"][b];
    			tmpresult["cin21medhistory-HOSPITAL"] = dquery["HOSPITAL"][b];
    			tmpresult["cin21medhistory-LEFTCONTACTGRADE"] = dquery["LEFT CONTACT GRADE"][b];
    			tmpresult["cin21medhistory-LEFTEYEGRADE"] = dquery["LEFT EYE GRADE"][b];
    			tmpresult["cin21medhistory-PHYSICALSPEC"] = dquery["PHYSICAL SPEC"][b];
    			tmpresult["cin21medhistory-MAJORDISEASES"] = dquery["MAJOR DISEASES"][b];
    			tmpresult["cin21medhistory-RECOMMENDATIONS"] = dquery["RECOMMENDATIONS"][b];
    			tmpresult["cin21medhistory-REMARKS"] = dquery["REMARKS"][b];
    			tmpresult["cin21medhistory-RIGHTCONTACTGRADE"] = dquery["RIGHT CONTACT GRADE"][b];
    			tmpresult["cin21medhistory-RIGHTEYEGRADE"] = dquery["RIGHT EYE GRADE"][b];
    			tmpresult["cin21medhistory-VISSION"] = dquery["VISION"][b];
    			tmpresult["cin21medhistory-WEARCONTACTLENSES"] = dquery["WEAR CONTACT LENSES"][b];
    			tmpresult["cin21medhistory-WEAREYEGLASSES"] = dquery["WEAR EYE GLASSES"][b];
    			tmpresult["cin21medhistory-XRAYRESULT"] = dquery["X RAY RESULT"][b];
    			tmpresult["cin21medhistory-MAJORILLSURGERIES"] = dquery["MAJOR ILL SURGERIES"][b];
    			tmpresult["cin21medhistory-MEDCASENUMBER"] = dquery["MED CASE NUMBER"][b];
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
		queryService.addParam(name="ALLERGIES",value="#args[b]['cin21medhistory-ALLERGIES']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="BLOODTYPE",value="#args[b]['cin21medhistory-BLOODTYPE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CLASSCODE",value="#args[b]['cin21medhistory-CLASSCODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CLASSIFICATION",value="#args[b]['cin21medhistory-CLASSIFICATION']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="DATECONSULT",value="#rereplace(args[b]['cin21medhistory-DATECONSULT'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="DEPENDENTNAME",value="#args[b]['cin21medhistory-DEPENDENTNAME']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="DOCTORSNAME",value="#args[b]['cin21medhistory-DOCTORSNAME']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="FINDINGS",value="#args[b]['cin21medhistory-FINDINGS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="HOSPITAL",value="#args[b]['cin21medhistory-HOSPITAL']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="LEFTCONTACTGRADE",value="#args[b]['cin21medhistory-LEFTCONTACTGRADE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="LEFTEYEGRADE",value="#args[b]['cin21medhistory-LEFTEYEGRADE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PHYSICALSPEC",value="#args[b]['cin21medhistory-PHYSICALSPEC']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="MAJORDISEASES",value="#args[b]['cin21medhistory-MAJORDISEASES']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="RECOMMENDATIONS",value="#args[b]['cin21medhistory-RECOMMENDATIONS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="REMARKS",value="#args[b]['cin21medhistory-REMARKS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="RIGHTCONTACTGRADE",value="#args[b]['cin21medhistory-RIGHTCONTACTGRADE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="RIGHTEYEGRADE",value="#args[b]['cin21medhistory-RIGHTEYEGRADE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="VISSION",value="#args[b]['cin21medhistory-VISSION']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="WEARCONTACTLENSES",value="#args[b]['cin21medhistory-WEARCONTACTLENSES']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="WEAREYEGLASSES",value="#args[b]['cin21medhistory-WEAREYEGLASSES']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="XRAYRESULT",value="#args[b]['cin21medhistory-XRAYRESULT']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="MAJORILLSURGERIES",value="#args[b]['cin21medhistory-MAJORILLSURGERIES']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="MEDCASENUMBER",value="#args[b]['cin21medhistory-MEDCASENUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			
		Usql = 'INSERT INTO {COMPANYCODE}_cbose.cin21medhistory (ALLERGIES,BLOODTYPE,CLASSCODE,CLASSIFICATION,DATECONSULT,DEPENDENTNAME,DOCTORSNAME,FINDINGS,HOSPITAL,LEFTCONTACTGRADE,LEFTEYEGRADE,PHYSICALSPEC,MAJORDISEASES,RECOMMENDATIONS,REMARKS,RIGHTCONTACTGRADE,RIGHTEYEGRADE,VISSION,WEARCONTACTLENSES,WEAREYEGLASSES,XRAYRESULT,MAJORILLSURGERIES,MEDCASENUMBER)
		          VALUES (:ALLERGIES, :BLOODTYPE, :CLASSCODE, :CLASSIFICATION, :DATECONSULT, :DEPENDENTNAME, :DOCTORSNAME, :FINDINGS, :HOSPITAL, :LEFTCONTACTGRADE, :LEFTEYEGRADE, :PHYSICALSPEC, :MAJORDISEASES, :RECOMMENDATIONS, :REMARKS, :RIGHTCONTACTGRADE, :RIGHTEYEGRADE, :VISSION, :WEARCONTACTLENSES, :WEAREYEGLASSES, :XRAYRESULT, :MAJORILLSURGERIES, :MEDCASENUMBER)';
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
		queryService.addParam(name="ALLERGIES",value="#args[b]['cin21medhistory-ALLERGIES']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="BLOODTYPE",value="#args[b]['cin21medhistory-BLOODTYPE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CLASSCODE",value="#args[b]['cin21medhistory-CLASSCODE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CLASSIFICATION",value="#args[b]['cin21medhistory-CLASSIFICATION']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="DATECONSULT",value="#rereplace(args[b]['cin21medhistory-DATECONSULT'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="DEPENDENTNAME",value="#args[b]['cin21medhistory-DEPENDENTNAME']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="DOCTORSNAME",value="#args[b]['cin21medhistory-DOCTORSNAME']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="FINDINGS",value="#args[b]['cin21medhistory-FINDINGS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="HOSPITAL",value="#args[b]['cin21medhistory-HOSPITAL']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="LEFTCONTACTGRADE",value="#args[b]['cin21medhistory-LEFTCONTACTGRADE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="LEFTEYEGRADE",value="#args[b]['cin21medhistory-LEFTEYEGRADE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="PHYSICALSPEC",value="#args[b]['cin21medhistory-PHYSICALSPEC']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="MAJORDISEASES",value="#args[b]['cin21medhistory-MAJORDISEASES']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="RECOMMENDATIONS",value="#args[b]['cin21medhistory-RECOMMENDATIONS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="REMARKS",value="#args[b]['cin21medhistory-REMARKS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="RIGHTCONTACTGRADE",value="#args[b]['cin21medhistory-RIGHTCONTACTGRADE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="RIGHTEYEGRADE",value="#args[b]['cin21medhistory-RIGHTEYEGRADE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="VISSION",value="#args[b]['cin21medhistory-VISSION']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="WEARCONTACTLENSES",value="#args[b]['cin21medhistory-WEARCONTACTLENSES']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="WEAREYEGLASSES",value="#args[b]['cin21medhistory-WEAREYEGLASSES']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="XRAYRESULT",value="#args[b]['cin21medhistory-XRAYRESULT']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="MAJORILLSURGERIES",value="#args[b]['cin21medhistory-MAJORILLSURGERIES']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="MEDCASENUMBER",value="#args[b]['cin21medhistory-MEDCASENUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			
		Usql = 'UPDATE {COMPANYCODE}_cbose.cin21medhistory
						SET ALLERGIES = :ALLERGIES,BLOODTYPE = :BLOODTYPE,CLASSCODE = :CLASSCODE,CLASSIFICATION = :CLASSIFICATION,DATECONSULT = :DATECONSULT,DEPENDENTNAME = :DEPENDENTNAME,DOCTORSNAME = :DOCTORSNAME,FINDINGS = :FINDINGS,HOSPITAL = :HOSPITAL,LEFTCONTACTGRADE = :LEFTCONTACTGRADE,LEFTEYEGRADE = :LEFTEYEGRADE,PHYSICALSPEC = :PHYSICALSPEC,MAJORDISEASES = :MAJORDISEASES,RECOMMENDATIONS = :RECOMMENDATIONS,REMARKS = :REMARKS,RIGHTCONTACTGRADE = :RIGHTCONTACTGRADE,RIGHTEYEGRADE = :RIGHTEYEGRADE,VISSION = :VISSION,WEARCONTACTLENSES = :WEARCONTACTLENSES,WEAREYEGLASSES = :WEAREYEGLASSES,XRAYRESULT = :XRAYRESULT,MAJORILLSURGERIES = :MAJORILLSURGERIES,MEDCASENUMBER = :MEDCASENUMBER
			          WHERE ALLERGIES = :ALLERGIES';
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
		queryService.addParam(name="ALLERGIES",value="#args[b]['cin21medhistory-ALLERGIES']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="BLOODTYPE",value="#args[b]['cin21medhistory-BLOODTYPE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="CLASSCODE",value="#args[b]['cin21medhistory-CLASSCODE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="CLASSIFICATION",value="#args[b]['cin21medhistory-CLASSIFICATION']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="DATECONSULT",value="#rereplace(args[b]['cin21medhistory-DATECONSULT'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
			queryService.addParam(name="DEPENDENTNAME",value="#args[b]['cin21medhistory-DEPENDENTNAME']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="DOCTORSNAME",value="#args[b]['cin21medhistory-DOCTORSNAME']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="FINDINGS",value="#args[b]['cin21medhistory-FINDINGS']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="HOSPITAL",value="#args[b]['cin21medhistory-HOSPITAL']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="LEFTCONTACTGRADE",value="#args[b]['cin21medhistory-LEFTCONTACTGRADE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="LEFTEYEGRADE",value="#args[b]['cin21medhistory-LEFTEYEGRADE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="PHYSICALSPEC",value="#args[b]['cin21medhistory-PHYSICALSPEC']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="MAJORDISEASES",value="#args[b]['cin21medhistory-MAJORDISEASES']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="RECOMMENDATIONS",value="#args[b]['cin21medhistory-RECOMMENDATIONS']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="REMARKS",value="#args[b]['cin21medhistory-REMARKS']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="RIGHTCONTACTGRADE",value="#args[b]['cin21medhistory-RIGHTCONTACTGRADE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="RIGHTEYEGRADE",value="#args[b]['cin21medhistory-RIGHTEYEGRADE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="VISSION",value="#args[b]['cin21medhistory-VISSION']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="WEARCONTACTLENSES",value="#args[b]['cin21medhistory-WEARCONTACTLENSES']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="WEAREYEGLASSES",value="#args[b]['cin21medhistory-WEAREYEGLASSES']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="XRAYRESULT",value="#args[b]['cin21medhistory-XRAYRESULT']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="MAJORILLSURGERIES",value="#args[b]['cin21medhistory-MAJORILLSURGERIES']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="MEDCASENUMBER",value="#args[b]['cin21medhistory-MEDCASENUMBER']#",cfsqltype="CF_SQL_VARCHAR");
		
		Usql = 'DELETE FROM {COMPANYCODE}_cbose.cin21medhistory
					  WHERE ALLERGIES = :ALLERGIES AND BLOODTYPE = :BLOODTYPE AND CLASSCODE = :CLASSCODE AND CLASSIFICATION = :CLASSIFICATION AND DATECONSULT = :DATECONSULT AND DEPENDENTNAME = :DEPENDENTNAME AND DOCTORSNAME = :DOCTORSNAME AND FINDINGS = :FINDINGS AND HOSPITAL = :HOSPITAL AND LEFTCONTACTGRADE = :LEFTCONTACTGRADE AND LEFTEYEGRADE = :LEFTEYEGRADE AND PHYSICALSPEC = :PHYSICALSPEC AND MAJORDISEASES = :MAJORDISEASES AND RECOMMENDATIONS = :RECOMMENDATIONS AND REMARKS = :REMARKS AND RIGHTCONTACTGRADE = :RIGHTCONTACTGRADE AND RIGHTEYEGRADE = :RIGHTEYEGRADE AND VISSION = :VISSION AND WEARCONTACTLENSES = :WEARCONTACTLENSES AND WEAREYEGLASSES = :WEAREYEGLASSES AND XRAYRESULT = :XRAYRESULT AND MAJORILLSURGERIES = :MAJORILLSURGERIES AND MEDCASENUMBER = :MEDCASENUMBER';
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
	Usql = "SELECT cin21medhistory.ALLERGIES AS 'Allergies', cin21medhistory.BLOODTYPE AS 'Blood Type', cin21medhistory.CLASSCODE AS 'Class Code', cin21medhistory.CLASSIFICATION AS 'Classification', cin21medhistory.DATECONSULT AS 'Date Consulted', cin21medhistory.DEPENDENTNAME AS 'Dependent Name', cin21medhistory.DOCTORSNAME AS 'Doctors Name', cin21medhistory.FINDINGS AS 'Findings', cin21medhistory.HOSPITAL AS 'Hospital', cin21medhistory.LEFTCONTACTGRADE AS 'Left Contact Grade', cin21medhistory.LEFTEYEGRADE AS 'Left Eye Grade', cin21medhistory.PHYSICALSPEC AS 'Physical Spec', cin21medhistory.MAJORDISEASES AS 'Major Diseases', cin21medhistory.RECOMMENDATIONS AS 'Recommendations', cin21medhistory.REMARKS AS 'Remarks', cin21medhistory.RIGHTCONTACTGRADE AS 'Right Contact Grade', cin21medhistory.RIGHTEYEGRADE AS 'Right Eye Grade', cin21medhistory.VISSION AS 'Vision', cin21medhistory.WEARCONTACTLENSES AS 'Wear Contact Lenses', cin21medhistory.WEAREYEGLASSES AS 'Wear Eye Glasses', cin21medhistory.XRAYRESULT AS 'X Ray Result', cin21medhistory.MAJORILLSURGERIES AS 'Major Ill Surgeries', cin21medhistory.MEDCASENUMBER AS 'Med Case Number'
			 FROM #session.companycode#_cbose.cin21medhistory cin21medhistory
			 WHERE  cin21medhistory.PERSONNELIDNO = '#session.chapa#'
			 
			 
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