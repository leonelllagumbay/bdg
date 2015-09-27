
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



	Usql = "SELECT cin21achievements.AWARDTITLE, cin21achievements.NATURECATEGORY, cin21achievements.PERSONNELIDNO
			 FROM fbc_cbose.cin21achievements cin21achievements
			 
			 
			 
			 ";

	queryService = new query();
	queryService.setDatasource("#session.global_dsn#");
  		queryService.setName("DQUERY");
	queryService.setSQL(Usql);
	theResultSet = queryService.execute();
	dquery = theResultSet.getResult();

	resultArr = ArrayNew(1);
	rootstuct = StructNew();
    rootstuct["totalCount"] = dquery.recordCount;

    /*Creates an array of structure to be converted to JSON using serializeJSON*/
	for (var b = start+1; b <= start+limit; b++) {
    	tmpresult = StructNew();
    			tmpresult["cin21achievements~AWARDTITLE"] = dquery["AWARDTITLE"][b];
    			tmpresult["cin21achievements~NATURECATEGORY"] = dquery["NATURECATEGORY"][b];
    			tmpresult["cin21achievements~PERSONNELIDNO"] = dquery["PERSONNELIDNO"][b];
		ArrayAppend(resultArr, tmpresult);
    }
    rootstuct["topics"] = resultArr;
	return rootstuct;
}
public struct function Create()
ExtDirect=true ExtFormHandler=true
{
	var rs = StructNew();
	rs["message"] = form;
	return rs;
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
			var fileWriter = EntityLoad("EGRGFILE", trim(args[b].FILEID), true);
			fileWriter.setFILENAME(trim(args[b].FILENAME));
			fileWriter.setFILECAPTION(trim(args[b].FILECAPTION));
			fileWriter.setDATELASTUPDATE(createOdbcDateTime(now()));
			EntitySave(fileWriter);
		}

		OrmFlush();

		retVal["message"] = args;
		retVal["success"] = true;
		return retVal;
}

public struct function Destroy(required any args)
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

		}


		retVal["message"] = args;
		retVal["success"] = true;
		return retVal;
}

}