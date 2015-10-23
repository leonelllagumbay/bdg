<html>
			<cfif ucase(GetAuthUser() neq "ADMIN") >
				<cfoutput><h2>Authenticated user is not an admin!</h2></cfoutput>
				<cfabort>
			</cfif>
			<head>
			    <title>iBOS/e Liveboard</title>
				<link rel='icon' type='image/ico' href='../../../../resource/image/appicon/diginfologo.ico'>
				<cfoutput><link rel='stylesheet' type='text/css' href='../../../../scripts/ext-4.2.2/resources/css/#session.companycsstheme#.css'></cfoutput>
			    <script type='text/javascript' src='../../../../scripts/ext-4.2.2/ext-all.js'></script>
				<script src='Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_81885B92D0CDC40CB36CDABAA240841E/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_48ABB0BFFB9D56789988D6F49F6E3E35/Api.cfm'></script>
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