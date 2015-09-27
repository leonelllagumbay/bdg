
<cfscript>
	appAccess = CreateObject("component","IBOSE.security.Access");
	resp = appAccess.checkUserQueryAccess("7F51BEEE-A06D-8FF5-3401E9307A6E8030","#session.userid#");
	if(resp == "false") {
		throw (detail="eQuery Access Not Allowed", message="eQuery Access Not Allowed");
	}
</cfscript>

<html>
	<head>
	    <title>Key Result Areas and Performance Indicators</title>
		<link rel='icon' type='image/ico' href='../../../../resource/image/appicon/diginfologo.ico'>
		<cfoutput><link rel='stylesheet' type='text/css' href='../../../../scripts/ext-4.2.2/resources/css/#session.companycsstheme#.css'></cfoutput>
	    <script type='text/javascript' src='../../../../scripts/ext-4.2.2/ext-all.js'></script>
		<script src='Api.cfm'></script>
	    <script type='text/javascript' src='app.js'>
	    </script>
		
			<style>
		    	.print-icon {
					background-image:url(http://localhost:8500/resource/image/appicon/print-icon.png);
					background-size: 15px 15px;
				}
				.view-icon {
					background-image:url(http://localhost:8500/resource/image/appicon/view-icon.png);
					background-size: 15px 15px;
				}
				.add-icon {
					background-image:url(http://localhost:8500/resource/image/appicon/add-icon.png);
					background-size: 15px 15px;
				}
				.edit-icon {
					background-image:url(http://localhost:8500/resource/image/appicon/edit-icon.png);
					background-size: 15px 15px;
				}
				.copy-icon {
					background-image:url(http://localhost:8500/resource/image/appicon/copy-icon.png);
					background-size: 15px 15px;
				}
				.delete-icon {
					background-image:url(http://localhost:8500/resource/image/appicon/delete-icon.png);
					background-size: 15px 15px;
				}
				.export-icon {
					background-image:url(http://localhost:8500/resource/image/appicon/export-icon.png);
					background-size: 15px 15px;
				}
				.email-icon {
					background-image:url(http://localhost:8500/resource/image/appicon/email-icon.png);
					background-size: 15px 15px;
				}
		    </style>
		
	</head>
<body>
</body>
</html>
<cfsetting showdebugoutput='false'>