<cfcomponent displayname="Access" >
	<cffunction name="hasAccessToApp" returntype="string">
		<cfargument name="columnInterest" >
		<cfargument name="tableOfInterest" >
		<cfargument name="appName" >
		<cfargument name="useridColumn" >

		<cfquery name="hasAccess" datasource="#session.global_dsn#" >
			SELECT #columnInterest#
			  FROM EGRGUSERAPPS
			 WHERE #columnInterest# = '#appName#' AND #useridColumn# = '#session.userid#';
		</cfquery>

		<cfif hasAccess.recordCount gt 0 >
			<cfreturn 'true' >
		<cfelse>
			<cfreturn 'false' >
		</cfif>
	</cffunction>

	<cffunction name="checkUserAppAccess" returntype="string">
		<cfargument name="theAppID" >
		<cfargument name="theUID" >
		<!--- Check if the user has access to the app --->
		<cfset appidres = ORMExecuteQuery("SELECT APPID FROM EGRTUSERAPP WHERE USERID = '#theUID#' AND APPID = '#theAppID#'", false) />
		<cfif ArrayLen(appidres) gt 0>
			<cfreturn "true" >
		<cfelse> <!--- If not, check further in the group if the user has access to the app --->
			<cfset appidresGrp = ORMExecuteQuery("SELECT APPID FROM EGRTUSERAPPGROUP
												   WHERE APPID = '#theAppID#' AND USERGRPID IN (SELECT USERGRPIDFK FROM EGRGROLEINDEX
														                                         WHERE USERGRPMEMBERSIDX = '#theUID#')", false) />
			<cfif ArrayLen(appidresGrp) gt 0>
				<cfreturn "true" >
			<cfelse>
				<cfreturn "false" >
			</cfif>
		</cfif>
	</cffunction>

	<cffunction name="checkUserQueryAccess" returntype="string">
		<cfargument name="theQueryID" >
		<cfargument name="theUID" >
		<!--- Check if the user has access to the query --->
		<cfset queryidres = ORMExecuteQuery("SELECT EQRYCODE FROM EGRTQUERY WHERE USERID = '#theUID#' AND EQRYCODE = '#theQueryID#'", false) />
		<cfif ArrayLen(queryidres) gt 0>
			<cfreturn "true" >
		<cfelse> <!--- If not, check further in the group if the user has access to the app --->
			<cfset queryidresGrp = ORMExecuteQuery("SELECT EQRYCODE FROM EGRTQUERYGROUP
												   WHERE EQRYCODE = '#theQueryID#' AND USERGRPID IN (SELECT USERGRPIDFK FROM EGRGROLEINDEX
														                                         WHERE USERGRPMEMBERSIDX = '#theUID#')", false) />
			<cfif ArrayLen(queryidresGrp) gt 0>
				<cfreturn "true" >
			<cfelse>
				<cfreturn "false" >
			</cfif>
		</cfif>
	</cffunction>




	<cffunction name="getAppUsers" returntype="Query" access="public" hint="This function is depricated">
		<cfargument name="columnlist" > <!---column statement to select in app table--->
		<cfargument name="apptable" >   <!---app main table--->
		<cfargument name="apptableid" > <!---app id--->
		<cfargument name="sessionchapa" > <!---pid of user to check access to--->
		<cfargument name="sessionuserid" > <!---userid of user to check access to--->
		<cfargument name="accesstable" >   <!---RT table--- app id has same name with rt table app id fk --->
		<cfargument name="accesstablepid" > <!---RT table user pid that has access to app--->
		<cfargument name="apporderby" > <!---order statement--->
		<cfargument name="extracondition" required="false" >

		<!---*note: In user access table or RT table, Applicant Number and User Group ID is saved in only one column.
		       That is the reason why the following query was used.--->

		<cfquery name="qryApps" datasource="#session.global_dsn#" >
			SELECT #columnlist#
			  FROM #apptable#
			 WHERE #apptableid# IN (SELECT #apptableid#
			                          FROM #accesstable#
			                         WHERE #accesstablepid# = '#sessionchapa#' OR #accesstablepid# IN (SELECT USERGRPIDFK FROM EGRGROLEINDEX WHERE USERGRPMEMBERSIDX = '#sessionuserid#')
			                  )
			       <cfif IsDefined("extracondition") >
				       <cfif trim(extracondition) neq '' >
				       		AND #preserveSingleQuotes(extracondition)#
				       </cfif>
			       </cfif>
			ORDER BY #apporderby#;
		</cfquery>
		<cfreturn qryApps >
	</cffunction>
</cfcomponent>