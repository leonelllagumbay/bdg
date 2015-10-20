
<cfif ucase(GetAuthUser() neq "ADMIN") >
	<cfoutput><h2>Authenticated user is not an admin!</h2></cfoutput>
	<cfabort>
</cfif>
<html>
	<head>
	    <title>iBOS/e eNotes</title>
		<link rel="icon" type="image/ico" href="../../resource/image/appicon/diginfologo.ico">
		<link rel="stylesheet" type="text/css" href="../../scripts/ext-4.2.2/resources/css/ext-all.css">
	    <script type="text/javascript" src="../../scripts/ext-4.2.2/ext-all.js"></script>
		<script src="Api.cfm"></script>
	    <script type="text/javascript" src="app.js">
	    </script>
	</head>

<body>

</body>
</html>

<cfsetting showdebugoutput="false">