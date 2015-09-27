<link rel="icon" type="image/ico" href="../../../resource/image/mainicon/diginfologo.ico">

<cfset requisitionnoval = trim(url.reqno) />
<cfset companydsn = trim(url.cd) />
<cfset dbms = trim(url.dbms) />
<cfset site = "./" />

<cfif IsDefined("url.norevert")>
	<cfset norevert = "&norevert=NOREVERT" >
<cfelse>
	<cfset norevert = "&yesrevert=YESREVERT" >
</cfif>

<cfquery name="getMRF" datasource="#companydsn#" maxrows="1">
	SELECT  A.POSITIONCODEFK AS POSITIONCODE,
            B.DESCRIPTION AS DESCRIPTION,
	        A.REQUISITIONNO AS REQUISITIONNO,
			A.JOBSUMMARY AS JOBSUMMARY,
	        REQUESTEDBY,
	        A.USERID AS USERID,
	        DATENEEDED,
            BRIEFDESC,
            SKILLSREQ,
	        DEPARTMENTCODEFK,
			DIVISIONCODE,
			REQUIREDNO,
            COMPANYCODE,
			A.DATELASTUPDATE AS DATELASTUPDATE
	   FROM CRGPERSONELREQUEST A LEFT JOIN CLKPOSITION B
         ON (A.POSITIONCODEFK = B.POSITIONCODE)

   WHERE A.REQUISITIONNO = '#requisitionnoval#'
   ;
</cfquery>


<ul  style="list-style: none; font-family:Arial, Helvetica, sans-serif; border: #c0c9ed 1px solid; margin: 50 200 40 200;">

<li style="background-color: #e8eff8; font-size: 1.4em; font-weight: bold; text-align: center; margin: 10 50 0 50; padding: 5px;"><cfoutput>#getMRF.DESCRIPTION#</cfoutput></li>
<cfquery name="getCompany" datasource="IBOSE_GLOBAL" maxrows="1">
	SELECT DESCRIPTION
	  FROM GLKCOMPANY
     WHERE COMPANYCODE = '#getMRF.COMPANYCODE#'
   ;
</cfquery>
<cfquery name="getLogo" datasource="IBOSE_GLOBAL" maxrows="1">
	SELECT COMPANYLOGO, MYIBOSELOGO
	  FROM EGRGTHEMES
     WHERE COMPANYCODE = '#getMRF.COMPANYCODE#'
   ;
</cfquery>

<li style="background-color: #e8eff8; font-size: 1em; font-weight: bold; text-align: center; margin: 0 50 0 50; padding: 5px;"><cfoutput><img width="150" height="50" src="../../../resource/image/companylogo/#getLogo.COMPANYLOGO#"></cfoutput></li>

<li style="background-color: #e8eff8; font-size: 1.3em; font-weight: normal; text-align: left; font-weight: bold; margin: 20 50 0 50; padding: 5px;">Job Summary:</li>
<li style="font-size: 1em; font-weight: normal; text-align: left; font-weight: bold; margin: 7 50 0 40; padding: 5px;">
	<ul style="font-size: 1em; font-weight: normal; text-align: left; margin: 10 0 20 40; padding-top: 5px;">
    	<li><cfoutput>#getMRF.JOBSUMMARY#</cfoutput></li>
    </ul>
</li>
<li style="background-color: #e8eff8; font-size: 1.3em; font-weight: normal; text-align: left; font-weight: bold; margin: 10 50 0 50; padding: 5px;">Requirements:</li>
<li style="font-size: 1em; font-weight: normal; text-align: left; font-weight: bold; margin: 7 50 0 40; padding: 5px;">
	<ul style="font-size: 1em; font-weight: normal; text-align: left; margin: 10 0 20 40; padding-top: 5px;">
    	<li><cfoutput>#getMRF.SKILLSREQ#</cfoutput></li>
    </ul>
</li>
<li style="background-color: #e8eff8; font-size: 1.3em; font-weight: normal; text-align: left; font-weight: bold; margin: 10 50 0 50; padding: 5px;">Date Needed: <span style="font-size: .8em; font-weight: normal;"><cfoutput>#DateFormat(getMRF.DATENEEDED, "MM/DD/YYYY")#</cfoutput></span></li>
<li style="font-size: 1em; font-weight: normal; text-align: center; margin: 20 50 10 50;"><a target="_self" style="background-color: #FD0; font-size: 1em; padding: 5px; font-weight: normal;" href="<cfoutput>../../application/?companyname=#getCompany.DESCRIPTION#&companycode=#getMRF.COMPANYCODE#&position=#getMRF.POSITIONCODE##norevert#&logopath=../../resource/image/companylogo/#getLogo.COMPANYLOGO#&cd=#companydsn#&gd=IBOSE_GLOBAL&dbms=#dbms#&site=#site#</cfoutput>">Click here to apply</a></li>

</ul>