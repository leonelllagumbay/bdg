<cfdirectory action="list" directory="#Expandpath('../../unDB/document/FBC/ADMIN/')#"  listinfo="all" name="myfolder" type="file">
<cfdump var="#myfolder#">
<cfset dsum = 0 />
<cfloop query="myfolder">
	<cfset dsum += myfolder.Size >

</cfloop>
<cfset currentDriveSizeKb = dsum / 1024 />
<cfset limitDriveSizeKb = session.maxdrivesize>
<cfif limitDriveSizeKb gt currentDriveSizeKb>
	<!--- <cfreturn "true"> --->
<cfelse>
	<!--- <cfreturn "false"> --->
</cfif>
<cfoutput>#dsum/1024#</cfoutput>
<cfoutput>#session.maxdrivesize#</cfoutput>