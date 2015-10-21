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
		ORDERBY = "ORDER BY ecinebooks.BOOKDATE DESC, ecinebooks.BOOKTITLE ASC";
	} else {
		ORDERBY = "ORDER BY #ORDERBY# ,ecinebooks.BOOKDATE DESC, ecinebooks.BOOKTITLE ASC";
	}


	// Get all the bookcode the user has access to:
	var bookCodeArr = ArrayNew(1);
	var bcsql = "SELECT BOOKCODE FROM ECRTEBOOKS WHERE APPLICANTNUMBER = '#session.chapa#'";
	var bcsvc = new query();

	bcsvc.setDatasource("#session.company_dsn#");
  	bcsvc.setName("bookcquery");
	bcsvc.setSQL(bcsql);

	var dres = bcsvc.execute();

	var bcquery = dres.getResult();

	for (var f = 1; f <= bcquery.recordCount; f++) {
		ArrayAppend(bookCodeArr, bcquery["BOOKCODE"][f]);
	}

	if (session.dbms == "MSSQL") {
		var dtable = "#session.company_dsn#.dbo.ECRTEBOOKSBYROLE";
	} else {
		var dtable = "#session.company_dsn#.ECRTEBOOKSBYROLE";
	}
	var bookcodeStmt = "SELECT BOOKCODE FROM #dtable#
												   WHERE USERGRPID IN (SELECT USERGRPIDFK FROM EGRGROLEINDEX
														                                         WHERE USERGRPMEMBERSIDX = '#session.userid#')";
	var bookcodeG = new query();
	bookcodeG.setDatasource("#session.global_dsn#");
  	bookcodeG.setName("bookcqueryg");
	bookcodeG.setSQL(bookcodeStmt);
	var dresg = bookcodeG.execute();
	bookcodeGqry = dresg.getResult();
	for (var g = 1; g <= bookcodeGqry.recordCount; g++) {
		ArrayAppend(bookCodeArr, bookcodeGqry["BOOKCODE"][g]);
	}

	// Arrange to fit in where in clause
	var incond = "('" & ArrayToList(bookCodeArr, "','") & "')";


	if (trim(WHERE) == "") {
		WHERE = "WHERE" & " BOOKCODE IN #PreserveSingleQuotes(incond)#";
	} else {
		WHERE = "#WHERE# " & "AND BOOKCODE IN #PreserveSingleQuotes(incond)#";
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

	Usql = "SELECT 	ecinebooks.BOOKCODE AS 'Book Code',
					ecinebooks.BOOKTITLE AS 'Book Title',
					ecinebooks.BOOKAUTHOR AS 'Book Author',
					ecinebooks.BOOKDATE AS 'Book Date',
					ecinebooks.BOOKOTHERDETAIL AS 'More Info',
					ecinebooks.PERSONNELIDNO AS 'Created By',
					ecinebooks.ICONLINK AS 'Icon Link'
			 FROM ecinebooks ecinebooks
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

    			tmpresult["ecinebooks-BOOKCODE"] = dquery["BOOK CODE"][b];
    			tmpresult["ecinebooks-BOOKTITLE"] = dquery["BOOK TITLE"][b];
    			tmpresult["ecinebooks-BOOKAUTHOR"] = dquery["BOOK AUTHOR"][b];
    			tmpresult["ecinebooks-BOOKDATE"] = dquery["BOOK DATE"][b];
    			tmpresult["ecinebooks-BOOKOTHERDETAIL"] = dquery["MORE INFO"][b];
    			tmpresult["ecinebooks-PERSONNELIDNO"] = dquery["CREATED BY"][b];
    			tmpresult["ecinebooks-ICONLINK"] = dquery["ICON LINK"][b];
		ArrayAppend(resultArr, tmpresult);
    }
    rootstuct["topics"] = resultArr;
	return rootstuct;
}


public struct function ReadSection(required string page,
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
		ORDERBY = "ORDER BY ecinebookscontent.CONTENTORDER ASC";
	} else {
		ORDERBY = "ORDER BY #ORDERBY# ,ecinebookscontent.CONTENTORDER ASC";
	}

	Usql = "SELECT 	ecinebookscontent.CONTENTCODE AS 'Content Code',
					ecinebookscontent.BOOKCODE AS 'Book Code',
					ecinebookscontent.ARTICLEORSECTION AS 'Article or Section',
					ecinebookscontent.PARENTARTICLEORSECTION AS 'Reference Article or Section',
					ecinebookscontent.CONTENTORDER AS 'Order',
					ecinebookscontent.KEYSTRINGS AS 'Key strings',
					ecinebookscontent.THECONTENT AS 'Content',
					ecinebookscontent.CONTENTHEADER AS 'Header',
					ecinebookscontent.CONTENTFOOTER AS 'Footer'
			 FROM ecinebookscontent ecinebookscontent
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

 			tmpresult["ecinebookscontent-CONTENTCODE"] = dquery["CONTENT CODE"][b];
 			tmpresult["ecinebookscontent-BOOKCODE"] = dquery["BOOK CODE"][b];
 			tmpresult["ecinebookscontent-ARTICLEORSECTION"] = dquery["ARTICLE OR SECTION"][b];
 			tmpresult["ecinebookscontent-PARENTARTICLEORSECTION"] = dquery["REFERENCE ARTICLE OR SECTION"][b];
 			tmpresult["ecinebookscontent-CONTENTORDER"] = dquery["ORDER"][b];
 			tmpresult["ecinebookscontent-KEYSTRINGS"] = dquery["KEY STRINGS"][b];
 			tmpresult["ecinebookscontent-THECONTENT"] = dquery["Content"][b];
 			tmpresult["ecinebookscontent-CONTENTHEADER"] = dquery["Header"][b];
 			tmpresult["ecinebookscontent-CONTENTFOOTER"] = dquery["Footer"][b];
		ArrayAppend(resultArr, tmpresult);
    }
    rootstuct["topics"] = resultArr;
	return rootstuct;
}



}