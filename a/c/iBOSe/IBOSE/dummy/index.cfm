
<cfset retArray = ArrayNew(1) />
<cfset qryMsg = ORMExecuteQuery("SELECT DATECREATED FROM Lstickynotes WHERE DATECREATED >= '2016-02-28' AND DATECREATED <= '2016-04-09' AND CREATEDBYUSERID = 'administrator'" ) />
			<cfif IsDefined("qryMsg")>
				<cfloop array="#qryMsg#" index="qry">
					<cfset ArrayAppend(retArray, dateformat(qry, "YYYY-MM-DD")) >
				</cfloop>
			</cfif>
<cfdump var="#retArray#">
<cfdump var="#qryMsg#">
