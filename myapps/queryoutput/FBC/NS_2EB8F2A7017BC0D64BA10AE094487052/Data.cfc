
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
		WHERE = "WHERE  cin21familybkgrnd.PERSONNELIDNO = '#session.chapa#'";
	} else {
		WHERE = "#WHERE#  AND  cin21familybkgrnd.PERSONNELIDNO = '#session.chapa#'";
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

	Usql = "SELECT cin21familybkgrnd.NAME AS 'Name', cin21familybkgrnd.RELATIONSHIP AS 'Relationship', cin21familybkgrnd.AGE AS 'Age', cin21familybkgrnd.COMPANY AS 'Company', cin21familybkgrnd.OCCUPATION AS 'Occupation', cin21familybkgrnd.ADDRESS AS 'Address', cin21familybkgrnd.BIRTHDAY AS 'Birthday', cin21familybkgrnd.CIVILSTATUS AS 'Civil Status', cin21familybkgrnd.CITIZENSHIP AS 'Citizenship', cin21familybkgrnd.COMPANYADDRESS AS 'Company Address', cin21familybkgrnd.LIVINGORDEAD AS 'Deceased', cin21familybkgrnd.DEPENDENT AS 'Dependent', cin21familybkgrnd.SEX AS 'Gender', cin21familybkgrnd.TELEPHONENUMBER AS 'Telephone Number', cin21familybkgrnd.TIN AS 'TIN', cin21familybkgrnd.IMMEDIATE AS 'Superior', cin21familybkgrnd.NOOFCHILDREN AS 'No of Children', cin21familybkgrnd.NOOFSISTERS AS 'No of Sisters', cin21familybkgrnd.NOOFBROTHERS AS 'No of Brothers', cin21familybkgrnd.LIVEWITH AS 'Live With', cin21familybkgrnd.HOBBIES AS 'Hobbies'
			 FROM #session.companycode#_cbose.cin21familybkgrnd cin21familybkgrnd
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
 
    			tmpresult["cin21familybkgrnd-NAME"] = dquery["NAME"][b];
    			tmpresult["cin21familybkgrnd-RELATIONSHIP"] = dquery["RELATIONSHIP"][b];
    			tmpresult["cin21familybkgrnd-AGE"] = dquery["AGE"][b];
    			tmpresult["cin21familybkgrnd-COMPANY"] = dquery["COMPANY"][b];
    			tmpresult["cin21familybkgrnd-OCCUPATION"] = dquery["OCCUPATION"][b];
    			tmpresult["cin21familybkgrnd-ADDRESS"] = dquery["ADDRESS"][b];
    			tmpresult["cin21familybkgrnd-BIRTHDAY"] = dquery["BIRTHDAY"][b];
    			tmpresult["cin21familybkgrnd-CIVILSTATUS"] = dquery["CIVIL STATUS"][b];
    			tmpresult["cin21familybkgrnd-CITIZENSHIP"] = dquery["CITIZENSHIP"][b];
    			tmpresult["cin21familybkgrnd-COMPANYADDRESS"] = dquery["COMPANY ADDRESS"][b];
    			tmpresult["cin21familybkgrnd-LIVINGORDEAD"] = dquery["DECEASED"][b];
    			tmpresult["cin21familybkgrnd-DEPENDENT"] = dquery["DEPENDENT"][b];
    			tmpresult["cin21familybkgrnd-SEX"] = dquery["GENDER"][b];
    			tmpresult["cin21familybkgrnd-TELEPHONENUMBER"] = dquery["TELEPHONE NUMBER"][b];
    			tmpresult["cin21familybkgrnd-TIN"] = dquery["TIN"][b];
    			tmpresult["cin21familybkgrnd-IMMEDIATE"] = dquery["SUPERIOR"][b];
    			tmpresult["cin21familybkgrnd-NOOFCHILDREN"] = dquery["NO OF CHILDREN"][b];
    			tmpresult["cin21familybkgrnd-NOOFSISTERS"] = dquery["NO OF SISTERS"][b];
    			tmpresult["cin21familybkgrnd-NOOFBROTHERS"] = dquery["NO OF BROTHERS"][b];
    			tmpresult["cin21familybkgrnd-LIVEWITH"] = dquery["LIVE WITH"][b];
    			tmpresult["cin21familybkgrnd-HOBBIES"] = dquery["HOBBIES"][b];
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
		queryService.addParam(name="NAME",value="#args[b]['cin21familybkgrnd-NAME']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="RELATIONSHIP",value="#args[b]['cin21familybkgrnd-RELATIONSHIP']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="AGE",value="#args[b]['cin21familybkgrnd-AGE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="COMPANY",value="#args[b]['cin21familybkgrnd-COMPANY']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="OCCUPATION",value="#args[b]['cin21familybkgrnd-OCCUPATION']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="ADDRESS",value="#args[b]['cin21familybkgrnd-ADDRESS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="BIRTHDAY",value="#rereplace(args[b]['cin21familybkgrnd-BIRTHDAY'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="CIVILSTATUS",value="#args[b]['cin21familybkgrnd-CIVILSTATUS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CITIZENSHIP",value="#args[b]['cin21familybkgrnd-CITIZENSHIP']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="COMPANYADDRESS",value="#args[b]['cin21familybkgrnd-COMPANYADDRESS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="LIVINGORDEAD",value="#args[b]['cin21familybkgrnd-LIVINGORDEAD']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="DEPENDENT",value="#args[b]['cin21familybkgrnd-DEPENDENT']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="SEX",value="#args[b]['cin21familybkgrnd-SEX']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="TELEPHONENUMBER",value="#args[b]['cin21familybkgrnd-TELEPHONENUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="TIN",value="#args[b]['cin21familybkgrnd-TIN']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="IMMEDIATE",value="#args[b]['cin21familybkgrnd-IMMEDIATE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="NOOFCHILDREN",value="#args[b]['cin21familybkgrnd-NOOFCHILDREN']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="NOOFSISTERS",value="#args[b]['cin21familybkgrnd-NOOFSISTERS']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="NOOFBROTHERS",value="#args[b]['cin21familybkgrnd-NOOFBROTHERS']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="LIVEWITH",value="#args[b]['cin21familybkgrnd-LIVEWITH']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="HOBBIES",value="#args[b]['cin21familybkgrnd-HOBBIES']#",cfsqltype="CF_SQL_VARCHAR");
			
		Usql = 'INSERT INTO {COMPANYCODE}_cbose.cin21familybkgrnd (NAME,RELATIONSHIP,AGE,COMPANY,OCCUPATION,ADDRESS,BIRTHDAY,CIVILSTATUS,CITIZENSHIP,COMPANYADDRESS,LIVINGORDEAD,DEPENDENT,SEX,TELEPHONENUMBER,TIN,IMMEDIATE,NOOFCHILDREN,NOOFSISTERS,NOOFBROTHERS,LIVEWITH,HOBBIES)
		          VALUES (:NAME, :RELATIONSHIP, :AGE, :COMPANY, :OCCUPATION, :ADDRESS, :BIRTHDAY, :CIVILSTATUS, :CITIZENSHIP, :COMPANYADDRESS, :LIVINGORDEAD, :DEPENDENT, :SEX, :TELEPHONENUMBER, :TIN, :IMMEDIATE, :NOOFCHILDREN, :NOOFSISTERS, :NOOFBROTHERS, :LIVEWITH, :HOBBIES)';
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
		queryService.addParam(name="NAME",value="#args[b]['cin21familybkgrnd-NAME']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="RELATIONSHIP",value="#args[b]['cin21familybkgrnd-RELATIONSHIP']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="AGE",value="#args[b]['cin21familybkgrnd-AGE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="COMPANY",value="#args[b]['cin21familybkgrnd-COMPANY']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="OCCUPATION",value="#args[b]['cin21familybkgrnd-OCCUPATION']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="ADDRESS",value="#args[b]['cin21familybkgrnd-ADDRESS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="BIRTHDAY",value="#rereplace(args[b]['cin21familybkgrnd-BIRTHDAY'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
				queryService.addParam(name="CIVILSTATUS",value="#args[b]['cin21familybkgrnd-CIVILSTATUS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="CITIZENSHIP",value="#args[b]['cin21familybkgrnd-CITIZENSHIP']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="COMPANYADDRESS",value="#args[b]['cin21familybkgrnd-COMPANYADDRESS']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="LIVINGORDEAD",value="#args[b]['cin21familybkgrnd-LIVINGORDEAD']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="DEPENDENT",value="#args[b]['cin21familybkgrnd-DEPENDENT']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="SEX",value="#args[b]['cin21familybkgrnd-SEX']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="TELEPHONENUMBER",value="#args[b]['cin21familybkgrnd-TELEPHONENUMBER']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="TIN",value="#args[b]['cin21familybkgrnd-TIN']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="IMMEDIATE",value="#args[b]['cin21familybkgrnd-IMMEDIATE']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="NOOFCHILDREN",value="#args[b]['cin21familybkgrnd-NOOFCHILDREN']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="NOOFSISTERS",value="#args[b]['cin21familybkgrnd-NOOFSISTERS']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="NOOFBROTHERS",value="#args[b]['cin21familybkgrnd-NOOFBROTHERS']#",cfsqltype="CF_SQL_FLOAT");
			queryService.addParam(name="LIVEWITH",value="#args[b]['cin21familybkgrnd-LIVEWITH']#",cfsqltype="CF_SQL_VARCHAR");
			queryService.addParam(name="HOBBIES",value="#args[b]['cin21familybkgrnd-HOBBIES']#",cfsqltype="CF_SQL_VARCHAR");
			
		Usql = 'UPDATE {COMPANYCODE}_cbose.cin21familybkgrnd
						SET NAME = :NAME,RELATIONSHIP = :RELATIONSHIP,AGE = :AGE,COMPANY = :COMPANY,OCCUPATION = :OCCUPATION,ADDRESS = :ADDRESS,BIRTHDAY = :BIRTHDAY,CIVILSTATUS = :CIVILSTATUS,CITIZENSHIP = :CITIZENSHIP,COMPANYADDRESS = :COMPANYADDRESS,LIVINGORDEAD = :LIVINGORDEAD,DEPENDENT = :DEPENDENT,SEX = :SEX,TELEPHONENUMBER = :TELEPHONENUMBER,TIN = :TIN,IMMEDIATE = :IMMEDIATE,NOOFCHILDREN = :NOOFCHILDREN,NOOFSISTERS = :NOOFSISTERS,NOOFBROTHERS = :NOOFBROTHERS,LIVEWITH = :LIVEWITH,HOBBIES = :HOBBIES
			          WHERE NAME = :NAME';
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
		queryService.addParam(name="NAME",value="#args[b]['cin21familybkgrnd-NAME']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="RELATIONSHIP",value="#args[b]['cin21familybkgrnd-RELATIONSHIP']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="AGE",value="#args[b]['cin21familybkgrnd-AGE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="COMPANY",value="#args[b]['cin21familybkgrnd-COMPANY']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="OCCUPATION",value="#args[b]['cin21familybkgrnd-OCCUPATION']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="ADDRESS",value="#args[b]['cin21familybkgrnd-ADDRESS']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="BIRTHDAY",value="#rereplace(args[b]['cin21familybkgrnd-BIRTHDAY'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
			queryService.addParam(name="CIVILSTATUS",value="#args[b]['cin21familybkgrnd-CIVILSTATUS']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="CITIZENSHIP",value="#args[b]['cin21familybkgrnd-CITIZENSHIP']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="COMPANYADDRESS",value="#args[b]['cin21familybkgrnd-COMPANYADDRESS']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="LIVINGORDEAD",value="#args[b]['cin21familybkgrnd-LIVINGORDEAD']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="DEPENDENT",value="#args[b]['cin21familybkgrnd-DEPENDENT']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="SEX",value="#args[b]['cin21familybkgrnd-SEX']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="TELEPHONENUMBER",value="#args[b]['cin21familybkgrnd-TELEPHONENUMBER']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="TIN",value="#args[b]['cin21familybkgrnd-TIN']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="IMMEDIATE",value="#args[b]['cin21familybkgrnd-IMMEDIATE']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="NOOFCHILDREN",value="#args[b]['cin21familybkgrnd-NOOFCHILDREN']#",cfsqltype="CF_SQL_FLOAT");
		queryService.addParam(name="NOOFSISTERS",value="#args[b]['cin21familybkgrnd-NOOFSISTERS']#",cfsqltype="CF_SQL_FLOAT");
		queryService.addParam(name="NOOFBROTHERS",value="#args[b]['cin21familybkgrnd-NOOFBROTHERS']#",cfsqltype="CF_SQL_FLOAT");
		queryService.addParam(name="LIVEWITH",value="#args[b]['cin21familybkgrnd-LIVEWITH']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="HOBBIES",value="#args[b]['cin21familybkgrnd-HOBBIES']#",cfsqltype="CF_SQL_VARCHAR");
		
		Usql = 'DELETE FROM {COMPANYCODE}_cbose.cin21familybkgrnd
					  WHERE NAME = :NAME AND RELATIONSHIP = :RELATIONSHIP AND AGE = :AGE AND COMPANY = :COMPANY AND OCCUPATION = :OCCUPATION AND ADDRESS = :ADDRESS AND BIRTHDAY = :BIRTHDAY AND CIVILSTATUS = :CIVILSTATUS AND CITIZENSHIP = :CITIZENSHIP AND COMPANYADDRESS = :COMPANYADDRESS AND LIVINGORDEAD = :LIVINGORDEAD AND DEPENDENT = :DEPENDENT AND SEX = :SEX AND TELEPHONENUMBER = :TELEPHONENUMBER AND TIN = :TIN AND IMMEDIATE = :IMMEDIATE AND NOOFCHILDREN = :NOOFCHILDREN AND NOOFSISTERS = :NOOFSISTERS AND NOOFBROTHERS = :NOOFBROTHERS AND LIVEWITH = :LIVEWITH AND HOBBIES = :HOBBIES';
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
	Usql = "SELECT cin21familybkgrnd.NAME AS 'Name', cin21familybkgrnd.RELATIONSHIP AS 'Relationship', cin21familybkgrnd.AGE AS 'Age', cin21familybkgrnd.COMPANY AS 'Company', cin21familybkgrnd.OCCUPATION AS 'Occupation', cin21familybkgrnd.ADDRESS AS 'Address', cin21familybkgrnd.BIRTHDAY AS 'Birthday', cin21familybkgrnd.CIVILSTATUS AS 'Civil Status', cin21familybkgrnd.CITIZENSHIP AS 'Citizenship', cin21familybkgrnd.COMPANYADDRESS AS 'Company Address', cin21familybkgrnd.LIVINGORDEAD AS 'Deceased', cin21familybkgrnd.DEPENDENT AS 'Dependent', cin21familybkgrnd.SEX AS 'Gender', cin21familybkgrnd.TELEPHONENUMBER AS 'Telephone Number', cin21familybkgrnd.TIN AS 'TIN', cin21familybkgrnd.IMMEDIATE AS 'Superior', cin21familybkgrnd.NOOFCHILDREN AS 'No of Children', cin21familybkgrnd.NOOFSISTERS AS 'No of Sisters', cin21familybkgrnd.NOOFBROTHERS AS 'No of Brothers', cin21familybkgrnd.LIVEWITH AS 'Live With', cin21familybkgrnd.HOBBIES AS 'Hobbies'
			 FROM #session.companycode#_cbose.cin21familybkgrnd cin21familybkgrnd
			 WHERE  cin21familybkgrnd.PERSONNELIDNO = '#session.chapa#'
			 
			 
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