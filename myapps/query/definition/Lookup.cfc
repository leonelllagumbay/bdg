/**
 * Lookup
 *
 * @author LEONELL
 * @date 5/26/15
 **/
component accessors=true output=false persistent=false ExtDirect=true {

	public struct function getQueryColumnNames(required numeric limit,
											required numeric page,
											required string dquery,
											required numeric start,
											required string equerycode)
		ExtDirect=true
	{



		resultArr = ArrayNew(1);
    	rootstuct = StructNew();

    	if (trim(dquery) neq "") var WHERE = "WHERE EQRYCODEFK='#trim(equerycode)#'AND FIELDNAME LIKE '%#dquery#%'";
		else var WHERE = "WHERE EQRYCODEFK='#trim(equerycode)#'";

		var wo = ORMExecuteQuery("FROM EGRGEVIEWFIELDS #PreserveSingleQuotes(WHERE)#
				                           ORDER BY FIELDNAME ASC", false, {maxResults=#limit#, offset=#start#, timeout=500});
		for (var a = 1; a <= ArrayLen(wo); a++) {
			tmpresult = StructNew();
			tmpresult['querycolumncode']  = wo[a].getTABLENAME() & "-" & wo[a].getFIELDNAME();
			tmpresult['querycolumnname']  = wo[a].getTABLENAME() & "-" & wo[a].getFIELDNAME();
			ArrayAppend(resultArr,tmpresult);
		}
		rootstuct['topics'] = resultArr;

		var dsourceCount = ORMExecuteQuery("SELECT COUNT(*) AS TOTALREC FROM EGRGEVIEWFIELDS #PreserveSingleQuotes(WHERE)#" ,true);
    	rootstuct['totalCount'] = dsourceCount;


		return rootstuct;

	}

}