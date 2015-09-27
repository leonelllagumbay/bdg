<cfquery name="qryEmail" datasource="#session.company_dsn#" maxrows="1">
	SELECT *
	  FROM ECINEMAIL
	 WHERE EFORMID = '#eformid#' AND PROCESSID = '#newprocessid#'
</cfquery>

<cfinvoke component="IBOSE.administrator.Email" method="setUpMailAttr" returnvariable="acoll">
	<cfinvokeargument name="ms" value="#session.ms#">
	<cfinvokeargument name="mu" value="#session.mu#">
	<cfinvokeargument name="mp" value="#session.mp#">
	<cfinvokeargument name="mt" value="#session.mt#">
	<cfinvokeargument name="mpt" value="#session.mpt#">
	<cfinvokeargument name="mtls" value="#session.mtls#">
	<cfinvokeargument name="mssl" value="#session.mssl#">
</cfinvoke>

<cfloop query="qryEmail" >
	<cfmail
			attributeCollection="#acoll#"
			from="#qryEmail.EMAILTO#"
			to="#qryEmail.EMAILTO#"
			subject="#qryEmail.EMAILSUBJECT#"
			type="html"
			>
			<cfoutput>#qryEmail.EMAILBODY#</cfoutput>
			<!---Attachment only--->
			<cfif trim(qryEmail.EMAILATTACHMENT) neq "" AND trim(lcase(qryEmail.EMAILATTACHMENT)) neq "no file" >
				<cfset dFile = ExpandPath( "../../../unDB/forms/#session.companycode#/#qryEmail.EMAILATTACHMENT#" ) >
				<cfmailparam
				   disposition="attachment"
			       file = "#dFile#"
			     >
			</cfif>
	</cfmail>


</cfloop>


<cfquery name="updateFormTable" datasource="#theLevel#" >
	UPDATE #thetable#
	   SET EMAILSTATUS          = <cfqueryparam cfsqltype="cf_sql_varchar"   value="SENT" >
     WHERE PROCESSID 		 = <cfqueryparam cfsqltype="cf_sql_varchar"   value="#newprocessid#" > AND
	       EFORMID 			 = <cfqueryparam cfsqltype="cf_sql_varchar"   value="#eformid#" >
</cfquery>