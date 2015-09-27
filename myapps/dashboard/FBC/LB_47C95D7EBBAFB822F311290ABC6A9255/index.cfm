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
				<script src='../../../queryoutput/FBC/NS_48F3979CD9E40EA88A5608197A0CFC99/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_48EEEE46C0A6E173B1716BA745E11F06/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_48EB6571AD6F9A2D40E98CF2BF6BB3DD/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_48E960D6B4C224DA34223648BCD0DC2F/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_48E84394A2649D06E1034D98E9CD4A63/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_48E70F48CE38988FAE729C963CBDA61C/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_48E5A919C621E9A46869283C82751148/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_48E36ADAD99F6BDD5FA11E51143C7634/Api.cfm'></script>
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