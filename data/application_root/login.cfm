<cfscript> /*user is logged out and main session here is unknown*/
	GlobalSettings = CreateObject("component","IBOSE.administrator.Settings");
	GlobalSettings.setGlobalSettings();
	/*select app even though user is logged out
	Apps that are used only when user is logged out ex. home page and the like
	*/
	outApp = CreateObject("component","IBOSE.application.App");
	appQuery = outApp.getApp();
</cfscript>


<cfif IsDefined("url.code") or IsDefined("url.access_token")> <!--- from google oauth redirect uri --->
	<cfinvoke component="IBOSE.login.Helper" method="loginToGoogle">
	<cfinclude template="signin.cfm">
	<cfset resStruct = Deserializejson(dcontent)>
	<cfif resStruct.form[1].detail eq "yessuccessdetail">
		<cflocation url="#session.domain#?bdg=#resStruct.form[1].message#" addtoken="false">
	<cfelse>
		<cfdump var="#resStruct#">
	</cfif>
	<cfabort>
</cfif>

<cfif appQuery.recordcount gt 0 >
	<cfif isdefined("appQuery.HOMEPAGE") > <!---go to homepage--->
		<cftry>
			<cfif Ucase(Left(appQuery.HOMEPAGE,4)) eq "HTTP">
				<cfset dhomepage = appQuery.HOMEPAGE>
			<cfelse>
			    <cfset dhomepage = "./#appQuery.HOMEPAGE#">
			</cfif>
        	<cflocation url="#dhomepage#?companyid=#session.companycode#" addtoken="false" >
        <cfcatch type="Any" >
        	<cfoutput>#cfcatch.detail# - #cfcatch.message#</cfoutput>
        </cfcatch>
        </cftry>
        <cfabort>
	</cfif>
	<cfif trim(appQuery.URLIFNOTEXT) neq "" >
		<cftry>
			<cfif Ucase(Left(appQuery.URLIFNOTEXT,4)) eq "HTTP">
				<cfset durl = appQuery.URLIFNOTEXT>
			<cfelse>
			    <cfset durl = "./#appQuery.URLIFNOTEXT#">
			</cfif>
        	<cflocation url="#durl#?companyid=#session.companycode#" addtoken="false" >
        <cfcatch type="Any" >
        	<cfoutput>#cfcatch.detail# - #cfcatch.message#</cfoutput>
        </cfcatch>
        </cftry>
        <cfabort>
	</cfif>
<cfelse>
	<cflocation url="./?bdg=MYIBOSE01052015" addtoken="false" >
</cfif>



<html>
	<head>
	    <title>iBOS/e</title>
	    <style type="text/css">
			.field-margin {
				margin: 10px;
			}
		</style>
		<link rel="icon" type="image/ico" href="./resource/image/appicon/diginfologo.ico">
		<link rel="stylesheet" type="text/css" href="scripts/ext-4.2.2/resources/css/ext-all-neptune.css">
	    <script type="text/javascript" src="scripts/ext-4.2.2/ext-all.js"></script>
		<script type="text/javascript" src="login.js"></script>
	</head>
	<body>
	</body>
</html>

<cfsetting showdebugoutput="false"  >