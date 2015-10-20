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


	if (trim(ORDERBY) == "") {
		ORDERBY = "ORDER BY ecrgnotesdtl.DATELASTUPDATE DESC, ecrgnotesdtl.NOTETITLE ASC";
	} else {
		ORDERBY = "ORDER BY #ORDERBY# ,ecrgnotesdtl.DATELASTUPDATE DESC, ecrgnotesdtl.NOTETITLE ASC";
	}

	if (trim(WHERE) == "") {
		WHERE = "WHERE" & " ecrgnotesdtl.PERSONNELIDNO = '#session.chapa#'";
	} else {
		WHERE = "#WHERE# " & "AND ecrgnotesdtl.PERSONNELIDNO = '#session.chapa#'";
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

	Usql = "SELECT ecrgnotesdtl.NOTECODE AS 'Code',
					ecrgnotesdtl.NOTEGROUP AS 'Group',
					ecrgnotesdtl.NOTETITLE AS 'Title',
					ecrgnotesdtl.NOTECONTENT AS 'Content',
					ecrgnotesdtl.PERSONNELIDNO AS 'Owner',
					ecrgnotesdtl.RECDATECREATED AS 'Date Created',
					ecrgnotesdtl.DATELASTUPDATE AS 'Date Last Update',
					cmfpa.FIRSTNAME AS 'First Name',
					cmfpa.LASTNAME AS 'Last Name'
			 FROM ecrgnotesdtl ecrgnotesdtl left join cmfpa cmfpa on (ecrgnotesdtl.PERSONNELIDNO = cmfpa.PERSONNELIDNO)
			 #WHERE# #ORDERBY#";

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
			tmpresult["ecrgnotesdtl-NOTECODE"] = dquery["CODE"][b];
  			tmpresult["ecrgnotesdtl-NOTEGROUP"] = dquery["GROUP"][b];
  			tmpresult["ecrgnotesdtl-NOTETITLE"] = dquery["TITLE"][b];
  			tmpresult["ecrgnotesdtl-NOTECONTENT"] = dquery["CONTENT"][b];
  			tmpresult["ecrgnotesdtl-PERSONNELIDNO"] = dquery["OWNER"][b];
  			tmpresult["ecrgnotesdtl-RECDATECREATED"] = dquery["DATE CREATED"][b];
  			tmpresult["ecrgnotesdtl-DATELASTUPDATE"] = dquery["DATE LAST UPDATE"][b];
  			tmpresult["cmfpa-FIRSTNAME"] = dquery["FIRST NAME"][b];
  			tmpresult["cmfpa-LASTNAME"] = dquery["LAST NAME"][b];
		ArrayAppend(resultArr, tmpresult);
    }
    rootstuct["topics"] = resultArr;
	return rootstuct;
}


public struct function ReadShared(required string page,
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


	if (trim(ORDERBY) == "") {
		ORDERBY = "ORDER BY ecrgnotesdtl.DATELASTUPDATE DESC, ecrgnotesdtl.NOTETITLE ASC";
	} else {
		ORDERBY = "ORDER BY #ORDERBY# ,ecrgnotesdtl.DATELASTUPDATE DESC, ecrgnotesdtl.NOTETITLE ASC";
	}


	// Get all the notecode the user has access to:
	var bookCodeArr = ArrayNew(1);
	var bcsql = "SELECT NOTECODE FROM ECRTNOTE WHERE APPLICANTNUMBER = '#session.chapa#'";
	var bcsvc = new query();

	bcsvc.setDatasource("#session.company_dsn#");
  	bcsvc.setName("bookcquery");
	bcsvc.setSQL(bcsql);

	var dres = bcsvc.execute();

	var bcquery = dres.getResult();

	for (var f = 1; f <= bcquery.recordCount; f++) {
		ArrayAppend(bookCodeArr, bcquery["NOTECODE"][f]);
	}

	if (session.dbms == "MSSQL") {
		var dtable = "#session.company_dsn#.dbo.ECRTNOTEBYROLE";
	} else {
		var dtable = "#session.company_dsn#.ECRTNOTEBYROLE";
	}
	var bookcodeStmt = "SELECT NOTECODE FROM #dtable#
												   WHERE USERGRPID IN (SELECT USERGRPIDFK FROM EGRGROLEINDEX
														                                         WHERE USERGRPMEMBERSIDX = '#session.userid#')";
	var bookcodeG = new query();
	bookcodeG.setDatasource("#session.global_dsn#");
  	bookcodeG.setName("bookcqueryg");
	bookcodeG.setSQL(bookcodeStmt);
	var dresg = bookcodeG.execute();
	bookcodeGqry = dresg.getResult();
	for (var g = 1; g <= bookcodeGqry.recordCount; g++) {
		ArrayAppend(bookCodeArr, bookcodeGqry["NOTECODE"][g]);
	}

	// Arrange to fit in where in clause
	var incond = "('" & ArrayToList(bookCodeArr, "','") & "')";


	if (trim(WHERE) == "") {
		WHERE = "WHERE" & " NOTECODE IN #PreserveSingleQuotes(incond)#";
	} else {
		WHERE = "#WHERE# " & "AND NOTECODE IN #PreserveSingleQuotes(incond)#";
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

	Usql = "SELECT ecrgnotesdtl.NOTECODE AS 'Code',
					ecrgnotesdtl.NOTEGROUP AS 'Group',
					ecrgnotesdtl.NOTETITLE AS 'Title',
					ecrgnotesdtl.NOTECONTENT AS 'Content',
					ecrgnotesdtl.PERSONNELIDNO AS 'Owner',
					ecrgnotesdtl.RECDATECREATED AS 'Date Created',
					ecrgnotesdtl.DATELASTUPDATE AS 'Date Last Update',
					cmfpa.FIRSTNAME AS 'First Name',
					cmfpa.LASTNAME AS 'Last Name'
			 FROM ecrgnotesdtl ecrgnotesdtl left join cmfpa cmfpa on (ecrgnotesdtl.PERSONNELIDNO = cmfpa.PERSONNELIDNO)
			 #WHERE# #ORDERBY#";

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
			tmpresult["ecrgnotesdtl-NOTECODE"] = dquery["CODE"][b];
  			tmpresult["ecrgnotesdtl-NOTEGROUP"] = dquery["GROUP"][b];
  			tmpresult["ecrgnotesdtl-NOTETITLE"] = dquery["TITLE"][b];
  			tmpresult["ecrgnotesdtl-NOTECONTENT"] = dquery["CONTENT"][b];
  			tmpresult["ecrgnotesdtl-PERSONNELIDNO"] = dquery["OWNER"][b];
  			tmpresult["ecrgnotesdtl-RECDATECREATED"] = dquery["DATE CREATED"][b];
  			tmpresult["ecrgnotesdtl-DATELASTUPDATE"] = dquery["DATE LAST UPDATE"][b];
  			tmpresult["cmfpa-FIRSTNAME"] = dquery["FIRST NAME"][b];
  			tmpresult["cmfpa-LASTNAME"] = dquery["LAST NAME"][b];
		ArrayAppend(resultArr, tmpresult);
    }
    rootstuct["topics"] = resultArr;
	return rootstuct;
}





}