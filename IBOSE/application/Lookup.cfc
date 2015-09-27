/**
 * Lookup
 *
 * @author LEONELL
 * @date 5/21/15
 **/
component accessors=true output=false persistent=false {

	public struct function getMasterUserId(required string limit,
											required string page,
											required string query,
											required any start)
		ExtDirect=true
	{
		resultArr = ArrayNew(1);
    	rootstuct = StructNew();

    	if (trim(query) != "") {
			WHERE = "WHERE FIRSTNAME LIKE '%#query#%' OR LASTNAME LIKE '%#query#%'";
    	} else {
    		WHERE = "";
    	}

		m = ORMExecuteQuery("FROM GMFPEOPLE #PreserveSingleQuotes(WHERE)#",
    								false, {maxResults=#limit#, offset=#start#, timeout=500});


		for (var b = 1; b <= ArrayLen(m); b++) {
			tmpresult = StructNew();
			tmpresult["usercode"] = m[b].getUSERID();
			tmpresult["username"] = m[b].getLASTNAME() & ", " & m[b].getFIRSTNAME();
			ArrayAppend(resultArr, tmpresult);
		}

		dsourceCount = ORMExecuteQuery("SELECT COUNT(*) AS TOTALREC FROM GMFPEOPLE #PreserveSingleQuotes(WHERE)#",true);
		rootstuct['totalCount'] = dsourceCount;
		rootstuct['topics'] = resultArr;
		return rootstuct;
	}

}