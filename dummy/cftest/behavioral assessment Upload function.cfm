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