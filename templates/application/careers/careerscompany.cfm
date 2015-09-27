<cfset callback = url.callback />
<cfset page     = url.page />
<cfset start    = url.start />
<cfset sort     = url.sort />
<cfset dir      = url.dir />
<cfset limit    = url.limit />
<cfset _dc      = url._dc />
<cfset companydsn = url.companydsn>
<cfset companydbms = url.companydbms>

<cfquery name="getCmfpa" datasource="#companydsn#">
	SELECT  A.POSITIONCODE AS POSITIONCODE,
            B.DESCRIPTION AS DESCRIPTION,
	        REQUISITIONNO,
	        REQUESTEDBY,
	        A.USERID AS USERID,
	        DATENEEDED,
	        A.DEPARTMENTCODE,
			DIVISIONCODE,
			REQUIREDNO,
            COMPANYCODE,
			A.DATEACTIONWASDONE AS DATEACTIONWASDONE
	   FROM CRGPERSONELREQUEST A LEFT JOIN CLKPOSITION B
         ON (A.POSITIONCODE = B.POSITIONCODE)
      WHERE (A.POSTEDTO = 'Company' OR A.POSTEDTO = 'All') AND POSTEDBYIBOSE = 'Y'
     <cfif isdefined('url.query')>
	    AND B.DESCRIPTION LIKE '%#url.query#%'
     </cfif>
	ORDER BY #sort# #dir#


    <cfif Ucase(companydbms) EQ 'MYSQL'>
     	LIMIT #start#, #limit#
    <cfelseif Ucase(companydbms) EQ 'MSSQL'>
         OFFSET #start# ROWS
         FETCH NEXT #limit# ROWS ONLY
    <cfelse>
    	LIMIT #start#, #limit#
    </cfif>
	  ;
</cfquery>


<cfquery name="countTotal" datasource="#companydsn#" maxrows="1">
	 SELECT  COUNT(*) AS TOTALREC
	   FROM CRGPERSONELREQUEST A LEFT JOIN CLKPOSITION B
         ON (A.POSITIONCODE = B.POSITIONCODE)
      WHERE (A.POSTEDTO LIKE '%Company%' OR A.POSTEDTO = 'All') AND POSTEDBYIBOSE = 'Y'
     <cfif isdefined('url.query')>
	    AND B.DESCRIPTION LIKE '%#url.query#%'
     </cfif>
;
</cfquery>

<cfset retStruct = StructNew() />
<cfset tmpResult = StructNew() />
<cfset tmpArr = ArrayNew(1) />

<!---#SerializeJSON(getCmfpa, true)#--->
	<cfloop query="getCmfpa">
		<cfset tmpResult = StructNew() />
		<cfquery name="converttoFull" datasource="#companydsn#" maxrows="1">
			SELECT DESCRIPTION
			  FROM CLKPOSITION
			 WHERE POSITIONCODE = '#POSITIONCODE#';
		</cfquery>
		<cfset tmpResult["POSITIONCODE"] = converttoFull.DESCRIPTION />
		<cfset tmpResult["REQUISITIONNO"] = REQUISITIONNO />
		<cfset tmpResult["REQUESTEDBY"] = REQUESTEDBY />
		<cfset tmpResult["USERID"] = USERID />
		<cfset tmpResult["DATENEEDED"] = DATENEEDED />
		<cfset tmpResult["DEPARTMENTCODE"] = DEPARTMENTCODE />
		<cfset tmpResult["DIVISIONCODE"] = DIVISIONCODE />
		<cfset tmpResult["REQUIREDNO"] = REQUIREDNO />
		<cfset tmpResult["COMPANYCODE"] = COMPANYCODE />
		<cfset tmpResult["DATEACTIONWASDONE"] = DATEACTIONWASDONE />
		<cfset ArrayAppend(tmpArr, tmpResult) />
	</cfloop>

	<cfset retStruct["totalCount"] = countTotal.TOTALREC />
	<cfset retStruct["topics"] = tmpArr />

<cfoutput>#callback#(#SerializeJson(retStruct)#);</cfoutput>

<cfsetting showdebugoutput="false" >