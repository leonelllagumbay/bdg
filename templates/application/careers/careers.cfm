
<cfset callback = url.callback />
<cfset page     = url.page />
<cfset start    = url.start />
<cfset sort     = url.sort />
<cfset dir      = url.dir />
<cfset limit    = url.limit />
<cfset _dc      = url._dc />

<cfif isdefined('url.query')>
	<cfset cond = "WHERE POSITIONDESC LIKE '%#url.query#%'" />
<cfelse>
	<cfset cond = "">
</cfif>

<cfset personnelObj = OrmExecuteQuery("FROM GRGPERSONELREQUEST #PreserveSingleQuotes(cond)# ORDER BY #sort# #dir#", false, {maxResults=#limit#, offset=#start#, timeout=500}) />

<cfset dsourceCount = ORMExecuteQuery("SELECT COUNT(*) AS TOTALREC FROM GRGPERSONELREQUEST #PreserveSingleQuotes(cond)#" ,true) />

<cfset retStruct = StructNew() />
<cfset tmpResult = StructNew() />
<cfset tmpArr = ArrayNew(1) />

<cfset retStruct["totalCount"] = dsourceCount />

<cfloop from="1" to="#ArrayLen(personnelObj)#" index="a">
	<cfset tmpResult = StructNew() />
	<cfset tmpResult["POSITIONDESC"] = personnelObj[a].getPOSITIONDESC() />
	<cfset tmpResult["POSITIONCODE"] = personnelObj[a].getPOSITIONCODE() />
	<cfset tmpResult["REQUISITIONNO"] = personnelObj[a].getREQUISITIONNO() />
	<cfset tmpResult["REQUESTEDBY"] = personnelObj[a].getREQUESTEDBY() />
	<cfset tmpResult["USERID"] = personnelObj[a].getUSERID() />
	<cfset tmpResult["DATENEEDED"] = personnelObj[a].getDATENEEDED() />
	<cfset tmpResult["DEPARTMENTCODE"] = personnelObj[a].getDEPARTMENTCODE() />
	<cfset tmpResult["DIVISIONCODE"] = personnelObj[a].getDIVISIONCODE() />
	<cfset tmpResult["REQUIREDNO"] = personnelObj[a].getREQUIREDNO() />
	<cfset tmpResult["COMPANYCODE"] = personnelObj[a].getCOMPANYCODE() />
	<cfset tmpResult["COMPANYDSN"] = personnelObj[a].getCOMPANYDSN() />
	<cfset tmpResult["DBMS"] = personnelObj[a].getDBMS() />
	<cfset tmpResult["DATELASTUPDATE"] = personnelObj[a].getDATELASTUPDATE() />
	<cfset ArrayAppend(tmpArr, tmpResult) />
</cfloop>

<cfset retStruct["topics"] = tmpArr />

<cfoutput>#callback#(#SerializeJson(retStruct)#);</cfoutput>
<cfsetting showdebugoutput="false" >