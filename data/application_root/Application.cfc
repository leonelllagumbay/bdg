﻿<cfcomponent displayname="Main Application" hint="This is the main application. It is called in every page requests.">
	<!--- Gives the server a name. We can use the hash of the Application.cfc file path,
		  which will always be unique, e.g. <cfset this.name = hash(getCurrentTemplatePath()) />
    --->
	<cfset this.name               = "cf14v01172015" />
	<!--- Array of structs containing the channels you want to provide.
	--->
	<cfset this.wschannels         = [{name="chat"}] />
	<cfset this.clientmanagement   = "true" >
	<cfset this.sessionmanagement  = "true" >
	<cfset this.setclientcookies   = "true" >
	<cfset this.applicationtimeout = "#CreateTimeSpan(2,0,0,0)#">

	<cfset this.ormenabled         = "true" >
	<cfset this.ormsettings        = {datasource = 'IBOSE_GLOBAL', logsql = 'true'} >


	<cffunction name="onApplicationStart" returnType="boolean">
	    <!---code goes here...--->
	    <cfreturn true>
	</cffunction>

	<cffunction name="onRequestStart" returnType="boolean">
	    <cfargument name="requestname" required=true/>
		<!---<cfdump var="#url#" >--->
	    <!--- Authentication code, generated by the Dreamweaver Login wizard. --->
		<cfinclude template="signin.cfm" >
		<cfreturn true>

	</cffunction>

	<!---<cffunction name="onAbort" returnType="boolean">
	    <cfargument type="string" name="targetPage" required=true/>
		   <!---Used to test session timeout since login.cfm is aborted,
		        it is useful to check if the calling page is not the root
				to AVOID INFINITE LOOP
				-This is critical to avoid redirect loop --->
			<!---<cfif cgi.SCRIPT_NAME NEQ "/index.cfm" >
				<cfif findnocase("HTTPS",cgi.SERVER_PROTOCOL) >
	    			<cflocation url="https://#CGI.HTTP_HOST#">
				<cfelse>
					<cflocation url="http://#CGI.HTTP_HOST#">
				</cfif>
			</cfif>--->
	    <cfreturn true>
	</cffunction>--->

	<cffunction name="onApplicationEnd" returnType="void">
	    <cfargument name="ApplicationScope" required=true/>
	    <!---code goes here...--->
	</cffunction>

	<cffunction name="oncfcRequest" returnType="void">
	          <cfargument type="string" name="cfcname">
	          <cfargument type="string" name="method">
	          <cfargument type="struct" name="args">
	</cffunction>

	<cffunction name="onError" returnType="void">
	    <cfargument name="Exception" required=true/>
	    <cfargument name="EventName" type="String" required=true/>

		<p><cfoutput>Cause: #Exception.ErrorCode#, #Exception.Message#</cfoutput></p>
		<p><cfoutput>Detail: #Exception.Detail#</cfoutput></p>
		<p><cfoutput>Message: #Exception.Message#</cfoutput></p>
		<p><cfoutput>Root Cause: #Exception.ErrorCode#, #Exception.Message#</cfoutput></p>
		<!--- <cfdump var="#Exception#" /> --->

		<cfsetting showdebugoutput="false">
	</cffunction>

	<cffunction name="onMissingTemplate" returnType="boolean">
	    <cfargument type="string" name="targetPage" required=true/>
	    <cfoutput>Missing page #targetPage#</cfoutput>
	    <cfsetting showdebugoutput="false">
	    <cfreturn true />
	</cffunction>

	<cffunction name="onRequestEnd" returnType="void">
	    <cfargument type="String" name="targetPage" required=true/>
	    <!---code goes here...--->
	</cffunction>

	<cffunction name="onSessionEnd" returnType="void" output="true">
	    <cfargument name="SessionScope" required=True/>
	    <cfargument name="ApplicationScope" required=False/>
	    <cfoutput>Session Out</cfoutput>
	</cffunction>

	<cffunction name="onSessionStart" returnType="void">
	    <!---code goes here...--->
			<!---<cfoutput>Session started</cfoutput>--->
	</cffunction>



</cfcomponent>


