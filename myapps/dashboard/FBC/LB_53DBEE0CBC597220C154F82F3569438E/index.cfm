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
				<script src='../../../queryoutput/FBC/NS_1B6EC9A20EAEF9391311AAEDBB9B82B5/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_48B2EBE0C7002A9E1FF596E5398F02A8/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_387B5E33B26001E52294FBB5C3F16A19/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_2EC9C9CC94AD3C605475A65DC0B4814D/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_2EB8F2A7017BC0D64BA10AE094487052/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_2CDB0EB8D75A2A5C8FE1D92B9D9F29C9/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_2C00DDDEC1818E01004206E638E9EEDF/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_2E5DF68DD8C9C22E35C3BA83917C1016/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_2EB36DCDD5008766558EB666CD0ABA99/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_51C021FCD2BE8380E4E874578E885A28/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_2EDD7067BEAD092F217F5D4E0CE400B4/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_2EDB6F3AD5A2279C9E6B8690031891A8/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_2ED4C4E3EDF50F1325EB61EAD366F0BC/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_2ECCDD3A98CCBCB8A067E085619C45D4/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_2EBD18FBC5CDCCBB10F0A2094CFB56BE/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_2EB5A34BE531D4AFDF7658BE397C60CA/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_2DEB4B28CB7237C3F68289B40A6B42F6/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_2CA402E29A563C0A77A4E384F62AA72B/Api.cfm'></script>
				<script src='../../../queryoutput/FBC/NS_2C5E8A1F92610514C6746E94C9F0D587/Api.cfm'></script>
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