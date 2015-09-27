<!DOCTYPE html>
<html>
	<!---
		Query list of application using the bdg url parameter which is the application id
	--->
	<cfinvoke method="getApp"
	          component="IBOSE.application.App"
	          returnvariable="appQuery"
	          >

	<!---
		If app is found with that app id, redirect page like home or specified url.
		Remember this is the index call not the app page itself.
		If no app is found, try the default app which is "MYIBOSE01052015". This app must exist
		in the record for a successful home page or app page.
	--->
	<cfif appQuery.recordcount gt 0 >
		<cfif isdefined("appQuery.HOMEPAGE") > <!---go to homepage--->
			<cfif Ucase(Left(appQuery.HOMEPAGE,4)) eq "HTTP">
				<cfset dhomepage = appQuery.HOMEPAGE>
			<cfelse>
			    <cfset dhomepage = "./#appQuery.HOMEPAGE#">
			</cfif>
			<cflocation url="#dhomepage#" addtoken="false">
			<cfabort>
		</cfif>
		<cfif trim(appQuery.URLIFNOTEXT) neq "" >
			<cfif Ucase(Left(appQuery.URLIFNOTEXT,4)) eq "HTTP">
				<cfset durl = appQuery.URLIFNOTEXT>
			<cfelse>
			    <cfset durl = "./#appQuery.URLIFNOTEXT#">
			</cfif>
			<cflocation url="#durl#" addtoken="false">
			<cfabort>
		</cfif>
	<cfelse>
		<cflocation url="./?bdg=MYIBOSE01052015" addtoken="false" >
		<cfabort>
	</cfif>

	<cfif Not IsDefined("session.defaultuserapp") >
		<cfset session.defaultuserapp = appQuery.APPID >
	</cfif>

	<cfscript>
		appAccess = CreateObject("component","IBOSE.security.Access");
		resp = appAccess.checkUserAppAccess("#appQuery.APPID#","#session.userid#");
		if(resp == 'false') {
			throw (detail="App Access Not Allowed", message="App Access Not Allowed");
		}
	</cfscript>
<head>
    <title><cfoutput>#appQuery.NAMEORTITLE#</cfoutput></title>
	<cfinvoke method="prepareMainCSS"
		      component="IBOSE.security.Page"
		      returnvariable="maincss"
	>
		<cfinvokeargument name="appQuery" value="#appQuery#">
	</cfinvoke>
	<cfoutput>#maincss#</cfoutput>
	<cfoutput>
	<link rel="icon" type="image/ico" href="./resource/image/appicon/#appQuery.APPICON#">
	<link rel="stylesheet" type="text/css" href="./scripts/ext-4.2.2/resources/css/#session.companycsstheme#.css">
	#appQuery.EXTRACODE#
	</cfoutput>
	<script type="text/javascript" src="./scripts/ext-4.2.2/ext-all.js"></script>
	<script type="text/javascript" src="./scripts/chat/chat.js"></script>
	<script type="text/javascript" src="./scripts/ext-4.2.2/src/util/md5.js"></script>
	<cfloop list="#appQuery.APISCRIPTSOURCE#" index="nsListSc" delimiters=","  >
	<cfoutput><script src="./#nsListSc#"></script></cfoutput>
	</cfloop>
		<!---
			This function is used when an app (JS app) wants to tell the value of the url in the current window
		--->
	    <script type="text/javascript">
	    	function getURLParameter(name) {
			  return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null
			}
		</script>
<cftry>

<!---
	Web Socket (for ColdFusion 10 Enterprise and up) is used for chat app.
	To start chat with another colleagues, under My Network click the target user then start typing...
	Note: This does not work on CF10 Standard and early versions
	The auxiliary script can be found at scripts/chat/*
--->
<cfwebsocket
	     name        ="ws"
         onMessage   ="displayMessage"
		 subscribeto ="chat"
		 onError     ="displayError"
		 onOpen      ="displayOpen"
		 onClose     ="displayClose"
/>

<cfinvoke method="getAppScript"
	      component="IBOSE.security.Page"
	      returnvariable="appscript"
>
	<cfinvokeargument name="appQuery" value="#appQuery#">
</cfinvoke>
<cfoutput>#appscript#</cfoutput>

</head>
<body>

</body>

</html>
	<cfcatch>
		<cfoutput>
			{
				"success": false,
				"form": [{
					"detail": #cfcatch.Detail# #cfcatch.Message#"
				}]
			}
		</cfoutput>
	</cfcatch>
</cftry>
<cfsetting showdebugoutput="no" >

