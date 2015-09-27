
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
    dresult = bcObj.buildCondition(argumentCollection="#theargs#");
	WHERE = dresult["where"];
    ORDERBY = dresult["orderby"];



	Usql = "SELECT egintestquery.ADATETIME AS 'A Date Time', egintestquery.AFLOAT AS 'A Float', egintestquery.ANUMBER AS 'A Number', egintestquery.ASTRING AS 'A String', egintestquery.ATEXT AS 'A Text', egintestquery.ATIME AS 'A Time', egintestquery.TESTID
			 FROM EGINTESTQUERY egintestquery
			 
			 
			 
			 ";

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
 
    			tmpresult["egintestquery~ADATETIME"] = dquery["A DATE TIME"][b];
    			tmpresult["egintestquery~AFLOAT"] = dquery["A FLOAT"][b];
    			tmpresult["egintestquery~ANUMBER"] = dquery["A NUMBER"][b];
    			tmpresult["egintestquery~ASTRING"] = dquery["A STRING"][b];
    			tmpresult["egintestquery~ATEXT"] = dquery["A TEXT"][b];
    			tmpresult["egintestquery~ATIME"] = dquery["A TIME"][b];
    			tmpresult["egintestquery~TESTID"] = dquery["TESTID"][b];
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
		queryService.addParam(name="ADATETIME",value="#rereplace(args[b]['egintestquery~ADATETIME'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
			queryService.addParam(name="AFLOAT",value="#args[b]['egintestquery~AFLOAT']#",cfsqltype="CF_SQL_FLOAT");
		queryService.addParam(name="ANUMBER",value="#args[b]['egintestquery~ANUMBER']#",cfsqltype="CF_SQL_INTEGER");
		queryService.addParam(name="ASTRING",value="#args[b]['egintestquery~ASTRING']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="ATEXT",value="#args[b]['egintestquery~ATEXT']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="ATIME",value="#args[b]['egintestquery~ATIME']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="TESTID",value="#args[b]['egintestquery~TESTID']#",cfsqltype="CF_SQL_INTEGER");
		
		Usql = 'INSERT INTO EGINTESTQUERY (ADATETIME,AFLOAT,ANUMBER,ASTRING,ATEXT,ATIME,TESTID)
		          VALUES (:ADATETIME, :AFLOAT, :ANUMBER, :ASTRING, :ATEXT, :ATIME, :TESTID)';
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
		queryService.addParam(name="ADATETIME",value="#rereplace(args[b]['egintestquery~ADATETIME'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
			queryService.addParam(name="AFLOAT",value="#args[b]['egintestquery~AFLOAT']#",cfsqltype="CF_SQL_FLOAT");
		queryService.addParam(name="ANUMBER",value="#args[b]['egintestquery~ANUMBER']#",cfsqltype="CF_SQL_INTEGER");
		queryService.addParam(name="ASTRING",value="#args[b]['egintestquery~ASTRING']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="ATEXT",value="#args[b]['egintestquery~ATEXT']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="ATIME",value="#args[b]['egintestquery~ATIME']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="TESTID",value="#args[b]['egintestquery~TESTID']#",cfsqltype="CF_SQL_INTEGER");
		
		Usql = 'UPDATE EGINTESTQUERY
						SET ADATETIME = :ADATETIME,AFLOAT = :AFLOAT,ANUMBER = :ANUMBER,ASTRING = :ASTRING,ATEXT = :ATEXT,ATIME = :ATIME,TESTID = :TESTID
			          WHERE ADATETIME = :ADATETIME';
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
		queryService.addParam(name="ADATETIME",value="#rereplace(args[b]['egintestquery~ADATETIME'],'[a-zA-Z]',' ')#",cfsqltype="CF_SQL_TIMESTAMP");
			queryService.addParam(name="AFLOAT",value="#args[b]['egintestquery~AFLOAT']#",cfsqltype="CF_SQL_FLOAT");
		queryService.addParam(name="ANUMBER",value="#args[b]['egintestquery~ANUMBER']#",cfsqltype="CF_SQL_INTEGER");
		queryService.addParam(name="ASTRING",value="#args[b]['egintestquery~ASTRING']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="ATEXT",value="#args[b]['egintestquery~ATEXT']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="ATIME",value="#args[b]['egintestquery~ATIME']#",cfsqltype="CF_SQL_VARCHAR");
		queryService.addParam(name="TESTID",value="#args[b]['egintestquery~TESTID']#",cfsqltype="CF_SQL_INTEGER");
		
		Usql = 'DELETE FROM EGINTESTQUERY
					  WHERE ADATETIME = :ADATETIME AND AFLOAT = :AFLOAT AND ANUMBER = :ANUMBER AND ASTRING = :ASTRING AND ATEXT = :ATEXT AND ATIME = :ATIME AND TESTID = :TESTID';
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
		if (ArrayLen(qryres) > 0) { // if assigned to a user
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
		} else { // if assigned to a group
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
	Usql = "SELECT egintestquery.ADATETIME AS 'A Date Time', egintestquery.AFLOAT AS 'A Float', egintestquery.ANUMBER AS 'A Number', egintestquery.ASTRING AS 'A String', egintestquery.ATEXT AS 'A Text', egintestquery.ATIME AS 'A Time', egintestquery.TESTID
			 FROM EGINTESTQUERY egintestquery
			 
			 
			 
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