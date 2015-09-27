<cfcomponent hint="Scheduler own application to avoid no login validation.">
	<cfset this.name               = "AccountAppiBOSeSsSS" />
	<cfset this.clientmanagement   = "true" >
	<cfset this.sessionmanagement  = "true" >
	<cfset this.setclientcookies   = "true" >
	<cfset this.applicationtimeout = "#CreateTimeSpan(2,0,0,0)#" >
	<cfset this.ormenabled         = "true" >
	<cfset this.ormsettings        = {datasource = 'IBOSE_GLOBAL', logsql = 'true'} >
</cfcomponent>


