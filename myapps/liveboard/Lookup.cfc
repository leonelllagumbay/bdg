/**
 * Lookup
 *
 * @author LEONELL
 * @date 7/1/15
 **/
component accessors=true output=false persistent=false ExtDirect=true {

	public Struct function getQuery(required numeric limit,
									required numeric page,
									required string dquery,
									required numeric start) ExtDirect=true displayname="getQuery" hint="getQuery" output="false" {

	if (dquery != "") var WHERE = "WHERE EQRYNAME LIKE '%#dquery#%'";
	else WHERE = "";

	var dsource = ORMExecuteQuery("FROM EGRGQUERY #PreserveSingleQuotes(WHERE)# ORDER BY DATELASTUPDATE DESC", false, {offset=#start#, maxResults=#limit#, timeout=150} );
	var countAll = ORMExecuteQuery("SELECT COUNT(*) AS TOTALREC FROM EGRGQUERY #PreserveSingleQuotes(WHERE)#", true );

	var resultArr = ArrayNew(1);
	var rootstuct = StructNew();
	rootstuct['totalCount'] = countAll;

	//Creates an array of structure to be converted to JSON using serializeJSON
	for(a=1; a<=ArrayLen(dsource); a++) {
		tmpresult = StructNew();
		tmpresult['querycode'] = dsource[a].getEQRYCODE();
		tmpresult['queryname'] = dsource[a].getEQRYNAME();
		ArrayAppend(resultArr, tmpresult);
	}
	rootstuct['topics'] = resultArr;
	return rootstuct;
	}
}