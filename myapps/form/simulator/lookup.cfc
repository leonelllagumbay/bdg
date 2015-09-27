﻿<cfcomponent name="lookup" ExtDirect="true">


<cffunction name="getComment" ExtDirect="true">
<cfargument name="limit" >
<cfargument name="page" >
<cfargument name="query" >
<cfargument name="start" >
<cfargument name="personnelidno" >
<cfargument name="processid" >
<cftry>

	<cfset resultArr = ArrayNew(1) >
    <cfset rootstuct = StructNew() >

	<cfset formProcessData = EntityLoad("EGINFORMPROCESSDETAILS", #processid#) >
	<cfloop array="#formProcessData#" index="processIndex" >
		<cfset formRouterData = EntityLoad("EGINROUTERDETAILS", {PROCESSIDFK = #processIndex.getPROCESSDETAILSID()#}, "ROUTERORDER ASC") >
		<cfloop array="#formRouterData#" index="routerIndex" >
			<cfset formApproversData = EntityLoad("EGINAPPROVERDETAILS", {ROUTERIDFK =#routerIndex.getROUTERDETAILSID()#}, "APPROVERORDER ASC" ) >
				<cfloop array="#formApproversData#" index="approverIndex" >
					<cfif trim(approverIndex.getCOMMENTS()) neq "" >
						<cfquery name="getPersonal" datasource="#session.company_dsn#" maxrows="1" >
							SELECT FIRSTNAME,
								   LASTNAME,
								   MIDDLENAME
							  FROM #session.maintable#
							 WHERE PERSONNELIDNO = '#approverIndex.getPERSONNELIDNO()#'
						</cfquery>
						<cfset tmpresult = StructNew() >
						<cfset tmpresult['name']  = getPersonal.LASTNAME & ', ' & getPersonal.FIRSTNAME & ' ' & getPersonal.MIDDLENAME >
						<cfset tmpresult['dateaction']  = dateformat(approverIndex.getDATEACTIONWASDONE(), "MM/DD/YYYY") & ' ' & timeformat(approverIndex.getDATEACTIONWASDONE(), "short") >
						<cfset tmpresult['comments']  = approverIndex.getCOMMENTS() >
						<cfset tmpresult['action']  = approverIndex.getACTION() >
						<cfset ArrayAppend(resultArr, tmpresult)    >
					<cfelse>
					</cfif>
				</cfloop>
		</cfloop>
	</cfloop>

	<cfset getTotalprocessID = ORMExecuteQuery("SELECT count(*) AS TOTPROCESSID
	  								      FROM EGINFORMPROCESSDETAILS A,EGINROUTERDETAILS B,EGINAPPROVERDETAILS C
	 								      WHERE A.PROCESSDETAILSID = B.PROCESSIDFK
	 								      		AND B.ROUTERDETAILSID = C.ROUTERIDFK
	 								      		AND A.PROCESSDETAILSID = '#processid#'", true) >

    <cfset rootstuct['totalCount'] = getTotalprocessID >
	<cfset rootstuct['topics'] = resultArr >

<cfreturn rootstuct />
<cfcatch>
	<cfreturn cfcatch.detail & ' ' & cfcatch.message  >
</cfcatch>
</cftry>
</cffunction>

<cffunction name="getMaineForm" ExtDirect="true">
<cfargument name="limit" >
<cfargument name="page" >
<cfargument name="query" >
<cfargument name="start" >
<cftry>

<cfif query NEQ "" >
	<cfset WHERE = "WHERE EFORMNAME LIKE '%#query#%'" >
<cfelse>
	<cfset WHERE = "" >
</cfif>
<cfset processData = ORMExecuteQuery("FROM EGRGEFORMS #WHERE#", false, {offset=#start#, maxResults=#limit#, timeout=60} ) >

<cfset countAll = ORMExecuteQuery("FROM EGRGEFORMS #WHERE#" )>


	<cfset resultArr = ArrayNew(1) >
    <cfset rootstuct = StructNew() >

    <cfset rootstuct['totalCount'] = ArrayLen(countAll) >
	  <cfloop array="#processData#" index="calIndex" >
	  	<cfset tmpresult = StructNew() >
		<cfset tmpresult['eformmaincode']  = calIndex.getEFORMID() >
		<cfset tmpresult['eformmainname']  = calIndex.getEFORMNAME() >
		<cfset tmpresult['eformmaintotalnew']  = len(calIndex.getEFORMNAME()) >
		<cfset tmpresult['eformmaintotalpending']  = len(calIndex.getEFORMNAME()) >
		<cfset ArrayAppend(resultArr, tmpresult)    >
	  </cfloop>
	<cfset rootstuct['topics'] = resultArr >

<cfreturn rootstuct />
<cfcatch>
	<cfreturn cfcatch.detail & ' ' & cfcatch.message  >
</cfcatch>
</cftry>
</cffunction>


<cffunction name="getUser" ExtDirect="true">
<cfargument name="limit" >
<cfargument name="page" >
<cfargument name="query" >
<cfargument name="start" >
<cftry>

<cfif query NEQ "" >
	<cfset WHERE = "WHERE FIRSTNAME LIKE '%#query#%' OR LASTNAME LIKE '%#query#%'" >
<cfelse>
	<cfset WHERE = "" >
</cfif>

<cfquery name="qryUser" datasource="#session.company_dsn#" >
	SELECT #session.mainpk# AS PERSONNELIDNO, FIRSTNAME, LASTNAME
	  FROM #session.maintable#
	  #preservesinglequotes(WHERE)#
</cfquery>

	<cfset resultArr = ArrayNew(1) >
    <cfset rootstuct = StructNew() >

    <cfset rootstuct['totalCount'] = qryUser.recordcount >
		<cfif start lt 1 >
			<cfset start = 1>
		</cfif>
	  <cfloop query="qryUser" startrow="#start#" endrow="#start + limit#">
	  	<cfset tmpresult = StructNew() >
		<cfset tmpresult['usercode']  = PERSONNELIDNO >
		<cfset tmpresult['username']  = FIRSTNAME & ' ' & LASTNAME >
		<cfset ArrayAppend(resultArr, tmpresult)    >
	  </cfloop>
	<cfset rootstuct['topics'] = resultArr >

<cfreturn rootstuct />
<cfcatch>
	<cfreturn cfcatch.detail & ' ' & cfcatch.message  >
</cfcatch>
</cftry>
</cffunction>



<cffunction name="formQueryLookup" ExtDirect="true">
<cfargument name="limit" >
<cfargument name="page" >
<cfargument name="query" >
<cfargument name="start" >
<cfargument name="tablename" >
<cfargument name="columnDisplay" >
<cfargument name="columnValue" >
<cfargument name="columnDepends" >
<cfargument name="columnDependValues" >
<cfargument name="columnOrder" >
<cftry>

<cfif start gt 0 >
	<cfset start -= 1 >
	<cfset limit -= 1 >
<cfelse>
	<cfset start += 1 >
	<cfset limit -= 1 >
</cfif>

<cfif trim(columnDepends) neq "" >
	<cfset condArr = ArrayNew(1) >
	<cfloop from="1" to="#ListLen(columnDepends)#" index="counterA">
		<cftry>
			<cfset conditionhere = "#listgetat(columnDepends, counterA)# = '#listgetat(columnDependValues, counterA)#'" >
			<cfset arrayappend(condArr, conditionhere) >
		<cfcatch> <!---columnDependValues may be empty and listgetat will throw an error. This is used because of the 2 lists--->
			<cfset conditionhere = "#listgetat(columnDepends, counterA)# = ''" >
			<cfset arrayappend(condArr, conditionhere) >
		</cfcatch>
		</cftry>
	</cfloop>
	<cfset conditionhere = arraytolist(condArr, " AND ") >
	<cfset conditionhere = "WHERE " & conditionhere >
<cfelse>
	<cfset conditionhere = "" >
</cfif>



<cfif query NEQ "" >
	<cfset queryArr = ArrayNew(1) >
	<cfloop from="1" to="#ListLen(columnDisplay)#" index="counterB">
		<cfset queryhere = "#listgetat(columnDisplay, counterB)# LIKE '%#query#%'" >
		<cfset arrayappend(queryArr, queryhere) >
	</cfloop>
	<cfset extraQuery = arraytolist(queryArr, ' OR ') >
	<cfif trim(columnDepends) eq "" >
		<cfset extraQuery = "WHERE " & extraQuery  >
	<cfelse>
		<cfset extraQuery = "AND (" & extraQuery & ")" >
	</cfif>
<cfelse>
	<cfset extraQuery = "" >
</cfif>


<cfset dispArr = ArrayNew(1) >
<cfloop from="1" to="#ListLen(columnDisplay)#" index="counterC">
	<cfset outputLabels = "##qryDynamic.#listgetat(columnDisplay, counterC)###" >
	<cfset arrayappend(dispArr, outputLabels) >
</cfloop>
<cfset outputLabels = arraytolist(dispArr, " | ") >
<cfset outputLabels = """#outputLabels#""" >



<cfset tableList = ORMExecuteQuery("SELECT TABLENAME, LEVELID, TABLETYPE
										FROM EGRGIBOSETABLE
									   WHERE TABLENAME = '#tablename#'") >

<cfset thecolumnValue = ", #columnValue#" >

<cfif trim(columnOrder) neq "" >
	<cfset ORDERBY = "ORDER BY " & columnOrder >
<cfelse>
    <cfset ORDERBY = "" >
</cfif>



<cfif ArrayLen(tableList) gt 0 >
	<cfloop array="#tableList#" index="theTableInd" >
		<cfset thetablelevel = theTableInd[2] >
	</cfloop>


	<cfif thetablelevel eq 'G' >
		<cfquery name="qryDynamic" datasource="#session.global_dsn#" >
			SELECT #columnDisplay##thecolumnValue#
			  FROM #tablename#
			 #preservesinglequotes(conditionhere)# #preservesinglequotes(extraQuery)#
		     #ORDERBY#
		</cfquery>

	<cfelseif thetablelevel eq 'C' >
		<cfquery name="qryDynamic" datasource="#session.company_dsn#" >
			SELECT #columnDisplay##thecolumnValue#
			  FROM #tablename#
			 #preservesinglequotes(conditionhere)# #preservesinglequotes(extraQuery)#
			 #ORDERBY#
		</cfquery>

	<cfelseif thetablelevel eq 'S' >
		<cfquery name="qryDynamic" datasource="#session.subco_dsn#" >
			SELECT #columnDisplay##thecolumnValue#
			  FROM #tablename#
			 #preservesinglequotes(conditionhere)# #preservesinglequotes(extraQuery)#
			 #ORDERBY#
		</cfquery>
	<cfelse>
		<cfquery name="qryDynamic" datasource="#theTableInd[3]#" >
			SELECT #columnDisplay##thecolumnValue#
			  FROM #tablename#
			#preservesinglequotes(conditionhere)# #preservesinglequotes(extraQuery)#
			#ORDERBY#
		</cfquery>

	</cfif>

<cfelse> <!---assume the table is global--->
	<cfquery name="qryDynamic" datasource="#session.global_dsn#" >
		SELECT #columnDisplay##thecolumnValue#
		  FROM #tablename#
		 #preservesinglequotes(conditionhere)# #preservesinglequotes(extraQuery)#
		 #ORDERBY#
	</cfquery>
</cfif>


	<cfset resultArr = ArrayNew(1) >
    <cfset rootstuct = StructNew() >

    <cfset rootstuct['totalCount'] = qryDynamic.recordcount >
		<cfset thecode = "qryDynamic.#columnValue#" >

		  <cfif start lt 1 >
		  	  <cfset start = 1 >
		  </cfif>

		  <cfloop query="qryDynamic" startrow="#start#" endrow="#start + limit#">
		  	<cfset tmpresult = StructNew() >

			<cfset tmpresult['codename']  = evaluate(thecode) >
			<cfset tmpresult['displayname']  = evaluate(outputLabels) >
			<cfset   arrayappend(resultArr,tmpresult)  >
		  </cfloop>
	<cfset rootstuct['topics'] = resultArr >

<cfreturn rootstuct />
<cfcatch>
	<cfreturn cfcatch.detail & ' ' & cfcatch.message  >
</cfcatch>
</cftry>
</cffunction>


<cffunction name="getRole" ExtDirect="true">
<cfargument name="inputargs" >

<cftry>

<cfset page = inputargs.page />
<cfset limit= inputargs.limit />
<cfset start= inputargs.start />
<cfif isdefined("inputargs.query") >
<cfset query= inputargs.query />
<cfelse>
<cfset query= "" />
</cfif>

<cfif query NEQ "" >
	<cfset WHERE = "WHERE DESCRIPTION LIKE '%#query#%'" >
<cfelse>
	<cfset WHERE = "" >
</cfif>
<cfset processData = ORMExecuteQuery(" SELECT USERGRPID, DESCRIPTION, count(*) AS TOTAL FROM EGRGUSERGROUPS #WHERE# GROUP BY USERGRPID, DESCRIPTION", false, {offset=#start#, maxResults=#limit#, timeout=60} ) >

<cfset countAll = ORMExecuteQuery("SELECT USERGRPID, count(*) AS TOTAL FROM EGRGUSERGROUPS #WHERE# GROUP BY USERGRPID" )>

	<cfset resultArr = ArrayNew(1) >
    <cfset rootstuct = StructNew() >

    <cfset rootstuct['totalCount'] = ArrayLen(countAll) >
	<cfset cnt = 1 >
	  <cfloop array="#processData#" index="calIndex" >
	  	<cfset tmpresult = StructNew() >
		<cfset tmpresult['rolecode']  = calIndex[1] >
		<cfset tmpresult['rolename']  = calIndex[2] >
		<cfset resultArr[cnt] = tmpresult    >
		<cfset cnt = cnt + 1 >
	  </cfloop>
	<cfset rootstuct['topics'] = resultArr >

<cfreturn rootstuct />
<cfcatch>
	<cfreturn cfcatch.detail & ' ' & cfcatch.message  >
</cfcatch>
</cftry>
</cffunction>


<cffunction name="getDirectoryList" ExtDirect="true">
	<cfargument name="limit">
	<cfargument name="page" >
	<cfargument name="dquery" >
	<cfargument name="start" >

	<cfset resultArr = ArrayNew(1) >
    <cfset rootstuct = StructNew() >

	<cfif trim(dquery) neq "">
		<cfset WHERE = "WHERE PERSONNELIDNO='#session.chapa#'AND FOLDERNAME LIKE '%#dquery#%'" >
	<cfelse>
		<cfset WHERE = "WHERE PERSONNELIDNO='#session.chapa#'" >
	</cfif>

	<cfset wo = ORMExecuteQuery("FROM EGRGFOLDER #PreserveSingleQuotes(WHERE)#
			                           ORDER BY DATELASTUPDATE DESC", false, {maxResults=#limit#, offset=#start#, timeout=500}) />
	<cfloop array="#wo#" index="farr">
		<cfset tmpresult = StructNew() >
		<cfset tmpresult['codename']  = farr.getFOLDERID() />
		<cfset tmpresult['displayname']  = farr.getFOLDERNAME() />
		<cfset ArrayAppend(resultArr,tmpresult)  />
	</cfloop>

	<cfset dsourceCount = ORMExecuteQuery("SELECT COUNT(*) AS TOTALREC FROM EGRGFOLDER #PreserveSingleQuotes(WHERE)#" ,true) />
    <cfset rootstuct['totalCount'] = dsourceCount />

	<cfset rootstuct['topics'] = resultArr >

	<cfreturn rootstuct />

</cffunction>


<cffunction name="getTheFiles" ExtDirect="true">
	<cfargument name="arg">

	<cfset resultArr = ArrayNew(1) >
    <cfset rootstuct = StructNew() >

	<cfset WHERE = "WHERE FOLDERIDFK='#trim(arg)#'" />

	<cfset wo = ORMExecuteQuery("FROM EGRGFILE #PreserveSingleQuotes(WHERE)#
			                           ORDER BY DATELASTUPDATE DESC", false) />
	<cfloop array="#wo#" index="farr">
		<cfset dpath = "./unDB/document/#session.companycode#/#session.userid#/" />
		<cfset tmpHref  = "<li><a href='#dpath##farr.getFILEID()#' target='_new'>#farr.getFILENAME()#</a></li>" />
		<cfset ArrayAppend(resultArr, tmpHref)  />
	</cfloop>

	<cfset rootstuct['totalCount'] = ArrayLen(wo) />

	<cfset rootstuct['filedisplay'] = "<ol>" & ArrayToList(resultArr, " ") & "</ol>"/>

	<cfreturn rootstuct />

</cffunction>

<cffunction name="getProcess" ExtDirect="true">
<cfargument name="limit" >
<cfargument name="page" >
<cfargument name="query" >
<cfargument name="start" >
<cftry>

<cfif query NEQ "" >
	<cfset WHERE = "WHERE PROCESSNAME LIKE '%#query#%'" >
<cfelse>
	<cfset WHERE = "" >
</cfif>
<cfset processData = ORMExecuteQuery(" SELECT PROCESSNAME, PROCESSID FROM EGINFORMPROCESS #WHERE#", false, {offset=#start#, maxResults=#limit#, timeout=220} ) >

<cfset countAll = ORMExecuteQuery("SELECT PROCESSNAME FROM EGINFORMPROCESS #WHERE#" )>


	<cfset resultArr = ArrayNew(1) >
    <cfset rootstuct = StructNew() >

    <cfset rootstuct['totalCount'] = ArrayLen(countAll) >
	<cfset cnt = 1 >
	  <cfloop array="#processData#" index="calIndex" >
	  	<cfset tmpresult = StructNew() >
		<cfset tmpresult['mainprocesscode']  = calIndex[2] >
		<cfset tmpresult['mainprocessname']  = calIndex[1] >
		<cfset resultArr[cnt] = tmpresult    >
		<cfset cnt = cnt + 1 >
	  </cfloop>
	<cfset rootstuct['topics'] = resultArr >

<cfreturn rootstuct />
<cfcatch>
	<cfreturn cfcatch.detail & ' ' & cfcatch.message  >
</cfcatch>
</cftry>
</cffunction>

</cfcomponent>