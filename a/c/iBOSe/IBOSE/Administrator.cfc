<!---
  --- Administrator
  --- -------------
  ---
  --- author: Leonell
  --- date:   05/03/16
  --->
<cfcomponent ExtDirect="true" name="Administrator">
	<cffunction name="hasComponentAccess" access="remote" ExtDirect="true">
		<cfargument name="xtype" type="string" required="true" hint="" displayname="xtype">

		<cfset returnValue = StructNew() />
		<cfset returnValue["success"] = "true" />
		<cfset returnValue["allowed"] = "true">

		<cfreturn returnValue />
	</cffunction>
</cfcomponent>