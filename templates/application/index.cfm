<!DOCTYPE html>

<html>

<head>
    <title>iBOS/e Application Online</title>
	<link rel="icon" type="image/ico" href="../../resource/image/appicon/diginfologo.ico">
	<link rel="stylesheet" type="text/css" href="../../scripts/ext-4.2.2/resources/css/ext-all-neptune.css">
    <script type="text/javascript" src="../../scripts/ext-4.2.2/ext-all.js"></script>
	<script src="Api.cfm"></script>
    <script type="text/javascript" src="app.js">
    </script>
	<script type="text/javascript">
    	function getURLParameter(name) {
		  return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null
		}
	</script>
  	<style type="text/css">
		.field-margin {
			margin: 5px;
		}
		.field-margin-center {
			text-align: center;
		}
		.selected {
			background-color: #FF0;
		}
	</style>
</head>
<body>
	<cfset session.company_dsn = trim(url.companycode) & "_CBOSE" />
	<cfquery name="getAppVar" datasource="IBOSE_GLOBAL" maxrows="1">
		SELECT A.DESCRIPTION, A.COMPANYCODE, A.WEBDOMAIN, A.DBMS, A.DBMSVERSION, B.GLOBAL_DSN, B.COMPANY_DSN
		  FROM EGRGCOMPANYSETTINGS A LEFT JOIN EGRGCOMPANY B ON (A.COMPANYCODE=B.COMPANYCODE)
		 WHERE A.COMPANYCODE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(url.companycode)#">
	</cfquery>
	<cfloop query="getAppVar">
		<cfset client.companyname = DESCRIPTION />
		<cfset client.companycode = COMPANYCODE />
		<cfset client.domain = WEBDOMAIN />
		<cfset client.dbms = DBMS />
		<cfset client.dbmsversion = DBMSVERSION />
		<cfset client.global_dsn = GLOBAL_DSN />
		<cfset client.company_dsn = COMPANY_DSN />
	</cfloop>
</body>
</html>


<cfsetting showdebugoutput="false">