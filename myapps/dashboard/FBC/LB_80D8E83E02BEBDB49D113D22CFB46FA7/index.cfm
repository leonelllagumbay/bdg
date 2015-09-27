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
				<script src='../../../queryoutput/FBC/NS_3F607CFAA23CB277D5B0D2BFD80E8613/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_7EEFCEADE9112062D7B36FD6A5D72D51/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_7EFF35F8A5AD502E1796C19F3BD0C458/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_7F2DFA1BB35774DAAC0B7E6E560AD435/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_7F51BEEEA06D8FF53401E9307A6E8030/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_7F83CD85B0B7BB82976759BDED104907/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_7F90DFD609223C063FAAD035CB569681/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_7FA56882E5332BCA44B0389F085788F5/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_7FBD7325DA0172D1104151C954EF979D/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_7FE54E13F11CD85369BA5D1AA3D80A43/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_80C9F6FC90B74FB7FDF3B78C69508B26/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_F6CC55E8F4D96F2C8E04B3AADBC93381/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_F6F7A8DDCA320C91EA5C9D59DBEAD714/Api.cfm'></script>
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