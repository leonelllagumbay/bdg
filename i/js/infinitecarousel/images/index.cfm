<CFSET session.site_maincfm = "default.cfm">

<CFIF IsDefined("url.companyid") OR
	(IsDefined("client.loggedin") AND NOT(client.loggedin))>
	<CFIF IsDefined("url.notnewvisit")>
		<CFSET sNewVisit="&notnewvisit=">
	<CFELSE>
		<CFSET sNewVisit="">
	</CFIF>

	<CFIF IsDefined("url.companyid")>
		<CFSET sCompanyID=url.companyid>
	<CFELSE>
		<CFSET sCompanyID=client.companycode>
	</CFIF>

	<CFIF IsDefined("url.logout")>
		<CFSET sLogout=url.logout>
	<CFELSE>
		<CFSET sLogout="">
	</CFIF>

	<CF_IBOSELOG MODULE="ROOT" LEVEL="INFORMATION" FILE="index.cfm" MESSAGE="redirect to theme - not logged in - #getBaseTemplatePath()#">
	<CFLOCATION URL="#client.theme_path##session.site_maincfm#?logout=#sLogout#&companyid=#sCompanyID##sNewVisit#" ADDTOKEN="No">
<CFELSE>
	<CF_IBOSELOG MODULE="ROOT" LEVEL="INFORMATION" FILE="index.cfm" MESSAGE="redirect to theme - logged in">
	<CFLOCATION URL="#client.theme_path##session.site_maincfm#" ADDTOKEN="No">
</CFIF>

