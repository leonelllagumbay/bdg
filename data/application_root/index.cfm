<!DOCTYPE html>
<html>
	<cfinvoke method="getApp"
	          component="IBOSE.application.App"
	          returnvariable="appQuery"
	          >

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
	<style type="text/css">

		<cfoutput>#appQuery.EXTRACSS#</cfoutput>

		.field-margin {
			margin: 10px;
		}
		.selected {
			background-color: #FF0;
		}
		.abc-tool-signout .x-tool-signout{
			background-size: 16px 15px;
			background-image:url(./resource/image/mainicon/mono-exit.png);
		}
		.abc-tool-signout:hover {
			opacity: .5;
		}

		.abc-tool-switchcompany .x-tool-switchcompany {
			background-size: 17px 17px;
			background-image:url(./resource/image/mainicon/switch.png);
		}
		.abc-tool-switchcompany:hover {
			opacity: .5;
		}

		.abc-tool-gotohome .x-tool-gotohome {
			background-size: 16px 15px;
			background-image:url(./resource/image/mainicon/home.png);
		}
		.abc-tool-gotohome:hover {
			opacity: .5;
		}


		.ctextarea {
			resize:both;
		}
		input.x-form-invalid-field {
		   border-color: #cf4c35 !important;
		}
		#topmenu {
			text-align: right;
		}
		#topmenu li {
			display: inline-block;
			list-style: none;
			font-size: .8em;
			color: black;
			text-decoration: none;
		}
		#topmenu li:hover {
			background-color: #99bce8;
		}

		.redbackground {
		    background-color: red;
		}
	</style>
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

    <script type="text/javascript">
    	function getURLParameter(name) {
		  return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null
		}
	</script>


<cftry>


<cfwebsocket
	     name        ="ws"
         onMessage   ="displayMessage"
		 subscribeto ="chat"
		 onError     ="displayError"
		 onOpen      ="displayOpen"
		 onClose     ="displayClose"
/>

<script type="text/javascript">
Ext.Loader.setConfig({enabled: true});
Ext.Loader.setPath('Ext.ux', './scripts/ext-4.2.2/examples/ux');

Ext.application({
	requires:
		<cfoutput>#appQuery.SCRIPTREQUIRES#</cfoutput>,
	name: 'Form',

	controllers: <cfoutput>#appQuery.EXTCONTROLLERS#</cfoutput>,

	appFolder: 'app',

	init: function(app) {

		GLOBAL_VARS_DIRECT = {
			USERID : <cfoutput>'#session.userid#'</cfoutput>,
			PID : <cfoutput>'#session.chapa#'</cfoutput>,
			FIRSTNAME : <cfoutput>'#session.firstname#'</cfoutput>,
			LASTNAME : <cfoutput>'#session.lastname#'</cfoutput>,
			MIDDLENAME : <cfoutput>'#session.middlename#'</cfoutput>,
			MYMESSAGE : <cfoutput>'#rereplace(session.mymessage,"[\r\n]"," ","all")#'</cfoutput>,
			MYPROFILEPIC : <cfoutput>'./resource/image/pics201/#lcase(session.companycode)#/#session.avatar#'</cfoutput>,
			COMPANYLOGO : <cfoutput>'#session.icon_path##session.site_bannerlogo#'</cfoutput>,
			COMPANYCODE: <cfoutput>'#session.companycode#'</cfoutput>,
			COMPANYNAME: <cfoutput>'#session.companyname#'</cfoutput>,
			SITE: <cfoutput>'#session.domain#'</cfoutput>
		};

		<cfloop list="#appQuery.EXTNAMESPACE#" index="nsListVal" delimiters=","  >
			<cfoutput>Ext.direct.Manager.addProvider(Ext.#nsListVal#.APIDesc);</cfoutput>
		</cfloop>

		Ext.Error.handle = function(err) {
			console.log('app-wide error');
			console.log(err);

			var msg = err.msg;
			var res = msg.search('bdg=');
			var res2 = msg.search('<script src="Api.cfm">');

			if(res != -1 || res2 != -1) {
				Ext.create('Ext.window.Window', {
						title: 'Please sign in to continue!',
						width: 300,
						closable: false,
						modal: true,
						layout: 'anchor',
						items: [{
							xtype: 'form',
							flex: 1,
							items: [{
								xtype: 'textfield',
								fieldLabel: 'User name',
								name: 'username',
								labelAlign: 'top',
								height: 45,
								allowBlank: false,
								padding: '5 5 5 5',
								emptyText: 'username',
								listeners: {
									specialkey: function(btn, e) {
										if(e.type == 'keydown')
										{
											if(e.getKey() != e.ENTER) {
										         return true;
										    }
									    }
									    this.up('form').submitLogin(btn);
									}
								},
								anchor: '100%'
							}, {
								xtype: 'textfield',
								fieldLabel: 'Password',
								name: 'password',
								inputType: 'password',
								minLength: 1,
								maxLength: 50,
								height: 45,
								emptyText: 'password',
								labelAlign: 'top',
								allowBlank: false,
								padding: '5 5 5 5',
								anchor: '100%',
								listeners: {
									specialkey: function(btn, e) {
										if(e.type == 'keydown')
										{
											if(e.getKey() != e.ENTER) {
										         return true;
										    }
									    }
									    this.up('form').submitLogin(btn);
									}
								},
							},{
								xtype: 'displayfield',
								name: 'logindisplaymore',
								id: 'displayrespidid',
								value: '',
								padding: '5 5 5 5',
								anchor: '100%'
							},{
								xtype: 'displayfield',
								name: 'loginwithgoogle',
								padding: 10,
								value: '<a href="https://accounts.google.com/o/oauth2/auth?scope=openid email&redirect_uri=http://localhost:8500&response_type=code&client_id=561695249357-7tkuphd99v8q1ao3skn35hjgegb52s1f.apps.googleusercontent.com">Login with Google</a>'
							},{
								xtype: 'checkboxfield',
								fieldLabel: 'Login with LDAP',
								padding: '5 5 5 10',
								checked: false
							},{
								xtype: 'displayfield',
								name: 'home',
								padding: 10,
								value: '<a href="./">Home</a>'
							}],

							submitLogin: function(btn) {
								var theForm = btn.up('form');

								if (theForm.getForm().isValid()) {
									theForm.getEl().mask('Authenticating... Please wait...', 'loading');
									var dform = btn.up('form');
									var dpwd = dform.down('textfield[name=password]');
									var rpwd = dpwd.getValue();
									dpwd.setValue(Ext.util.md5.hash(rpwd));
										theForm.submit({
											url: 'blank.cfm',
											reset: true,
											method: 'POST',
											failure: function(form, action){
												theForm.getEl().unmask();
											},
											success: function(form, action){
												theForm.getEl().unmask();
												if (action.result.form[0].detail=='yessuccessdetail')
												{
													window.location.reload();
												} else
												{
													form.setValues([{
														id: 'displayrespidid',
														value: action.result.form[0].detail
													}]);
												}



											}
										});
								}
							},

							buttons: [{
								text: 'Sign in',
								padding: '5 50 5 50',
								action: 'signin',
								handler: function(btn, e) {
									this.up('form').submitLogin(btn);
								}

							}]

						}]
					}).show();

			} else {
				Ext.Msg.show({
	  				title: '',
	  				msg: 'Our apology, we are having technical problems.',
	  				buttons: Ext.Msg.OK,
	  				icon: Ext.Msg.WARNING
	  			});
			}

		    // any non-true return value (including none) will cause the error to be thrown
		} //end application-wide error handler

	},

	launch: function(){
		_myAppGlobal = this;
		Ext.create('Ext.container.Viewport', {
			layout: 'border',
			bodyBorder: false,
			autoShow: true,
			items: [{
				<cfinvoke method="getRegions"
						  component="IBOSE.application.App"
						  returnVariable="regionQry"
						  appID="#appQuery.APPID#"
						  regionName="north"
				>
				<cfif regionQry.recordCount gt 0 >
					region: 'north',
					<cfif trim(regionQry.HIDDEN) neq "" >
						hidden: <cfoutput>#regionQry.HIDDEN#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.FLEX) neq "" >
						flex: <cfoutput>#regionQry.FLEX#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.HEIGHT) neq "" >
						height: <cfoutput>#regionQry.HEIGHT#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.WIDTH) neq "" >
						width: <cfoutput>#regionQry.WIDTH#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.SPLIT) neq "" >
						split: <cfoutput>#regionQry.SPLIT#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.TITLE) neq "" >
						title: <cfoutput>'#regionQry.TITLE#',</cfoutput>
					</cfif>
					<cfif trim(regionQry.MARGINS) neq "" >
						margins: <cfoutput>'[#regionQry.MARGINS#]',</cfoutput>
					</cfif>
					<cfif trim(regionQry.PADDING) neq "" >
						padding: <cfoutput>'[#regionQry.PADDING#]',</cfoutput>
					</cfif>
					<cfif trim(regionQry.COLLAPSIBLE) neq "" >
						collapsible: <cfoutput>#regionQry.COLLAPSIBLE#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.AUTOSCROLL) neq "" >
						autoScroll: <cfoutput>#regionQry.AUTOSCROLL#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.PANELEXTRA) neq "" >
						<cfoutput>#regionQry.PANELEXTRA#,</cfoutput>
					</cfif>

					<cfif trim(regionQry.LAYOUT) neq "" >
						layout: <cfoutput>{#regionQry.LAYOUT#},</cfoutput>
					</cfif>

					<cfif trim(regionQry.ITEMSWIDGETNAMES) neq "" >
						items: <cfoutput>#regionQry.ITEMSWIDGETNAMES#</cfoutput>
					</cfif>
				<cfelse>
					region: 'north',
					hidden: true
				</cfif>
			},{
				<cfinvoke method="getRegions"
						  component="IBOSE.application.App"
						  returnVariable="regionQry"
						  appID="#appQuery.APPID#"
						  regionName="west"
				>
				<cfif regionQry.recordCount gt 0 >
					region: 'west',
					<cfif trim(regionQry.HIDDEN) neq "" >
						hidden: <cfoutput>#regionQry.HIDDEN#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.FLEX) neq "" >
						flex: <cfoutput>#regionQry.FLEX#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.HEIGHT) neq "" >
						height: <cfoutput>#regionQry.HEIGHT#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.WIDTH) neq "" >
						width: <cfoutput>#regionQry.WIDTH#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.SPLIT) neq "" >
						split: <cfoutput>#regionQry.SPLIT#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.TITLE) neq "" >
						title: <cfoutput>'#regionQry.TITLE#',</cfoutput>
					</cfif>
					<cfif trim(regionQry.MARGINS) neq "" >
						margins: <cfoutput>'[#regionQry.MARGINS#]',</cfoutput>
					</cfif>
					<cfif trim(regionQry.PADDING) neq "" >
						padding: <cfoutput>'[#regionQry.PADDING#]',</cfoutput>
					</cfif>
					<cfif trim(regionQry.COLLAPSIBLE) neq "" >
						collapsible: <cfoutput>#regionQry.COLLAPSIBLE#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.AUTOSCROLL) neq "" >
						autoScroll: <cfoutput>#regionQry.AUTOSCROLL#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.PANELEXTRA) neq "" >
						<cfoutput>#regionQry.PANELEXTRA#,</cfoutput>
					</cfif>

					<cfif trim(regionQry.LAYOUT) neq "" >
						layout: <cfoutput>{#regionQry.LAYOUT#},</cfoutput>
					</cfif>

					<cfif trim(regionQry.ITEMSWIDGETNAMES) neq "" >
						items: <cfoutput>#regionQry.ITEMSWIDGETNAMES#</cfoutput>
					</cfif>
				<cfelse>
					region: 'west',
					hidden: true
				</cfif>
			},{
				//
				<cfinvoke method="getRegions"
						  component="IBOSE.application.App"
						  returnVariable="regionQry"
						  appID="#appQuery.APPID#"
						  regionName="center"
				>
				<cfif regionQry.recordCount gt 0 >
					region: 'center',
					<cfif trim(regionQry.HIDDEN) neq "" >
						hidden: <cfoutput>#regionQry.HIDDEN#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.FLEX) neq "" >
						flex: <cfoutput>#regionQry.FLEX#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.HEIGHT) neq "" >
						height: <cfoutput>#regionQry.HEIGHT#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.WIDTH) neq "" >
						width: <cfoutput>#regionQry.WIDTH#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.SPLIT) neq "" >
						split: <cfoutput>#regionQry.SPLIT#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.TITLE) neq "" >
						title: <cfoutput>'#regionQry.TITLE#',</cfoutput>
					</cfif>
					<cfif trim(regionQry.MARGINS) neq "" >
						margins: <cfoutput>'[#regionQry.MARGINS#]',</cfoutput>
					</cfif>
					<cfif trim(regionQry.PADDING) neq "" >
						padding: <cfoutput>'[#regionQry.PADDING#]',</cfoutput>
					</cfif>
					<cfif trim(regionQry.COLLAPSIBLE) neq "" >
						collapsible: <cfoutput>#regionQry.COLLAPSIBLE#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.AUTOSCROLL) neq "" >
						autoScroll: <cfoutput>#regionQry.AUTOSCROLL#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.PANELEXTRA) neq "" >
						<cfoutput>#regionQry.PANELEXTRA#,</cfoutput>
					</cfif>

					<cfif trim(regionQry.LAYOUT) neq "" >
						layout: <cfoutput>{#regionQry.LAYOUT#},</cfoutput>
					</cfif>

					<cfif trim(regionQry.ITEMSWIDGETNAMES) neq "" >
						items: <cfoutput>#regionQry.ITEMSWIDGETNAMES#</cfoutput>
					</cfif>
				<cfelse>
					region: 'center',
					hidden: true
				</cfif>
			},{
				//
				<cfinvoke method="getRegions"
						  component="IBOSE.application.App"
						  returnVariable="regionQry"
						  appID="#appQuery.APPID#"
						  regionName="east"
				>
				<cfif regionQry.recordCount gt 0 >
					region: 'east',
					<cfif trim(regionQry.HIDDEN) neq "" >
						hidden: <cfoutput>#regionQry.HIDDEN#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.FLEX) neq "" >
						flex: <cfoutput>#regionQry.FLEX#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.HEIGHT) neq "" >
						height: <cfoutput>#regionQry.HEIGHT#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.WIDTH) neq "" >
						width: <cfoutput>#regionQry.WIDTH#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.SPLIT) neq "" >
						split: <cfoutput>#regionQry.SPLIT#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.TITLE) neq "" >
						title: <cfoutput>'#regionQry.TITLE#',</cfoutput>
					</cfif>
					<cfif trim(regionQry.MARGINS) neq "" >
						margins: <cfoutput>'[#regionQry.MARGINS#]',</cfoutput>
					</cfif>
					<cfif trim(regionQry.PADDING) neq "" >
						padding: <cfoutput>'[#regionQry.PADDING#]',</cfoutput>
					</cfif>
					<cfif trim(regionQry.COLLAPSIBLE) neq "" >
						collapsible: <cfoutput>#regionQry.COLLAPSIBLE#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.AUTOSCROLL) neq "" >
						autoScroll: <cfoutput>#regionQry.AUTOSCROLL#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.PANELEXTRA) neq "" >
						<cfoutput>#regionQry.PANELEXTRA#,</cfoutput>
					</cfif>

					<cfif trim(regionQry.LAYOUT) neq "" >
						layout: <cfoutput>{#regionQry.LAYOUT#},</cfoutput>
					</cfif>

					<cfif trim(regionQry.ITEMSWIDGETNAMES) neq "" >
						items: <cfoutput>#regionQry.ITEMSWIDGETNAMES#</cfoutput>
					</cfif>
				<cfelse>
					region: 'east',
					hidden: true
				</cfif>
			},{
				<cfinvoke method="getRegions"
						  component="IBOSE.application.App"
						  returnVariable="regionQry"
						  appID="#appQuery.APPID#"
						  regionName="south"
				>
				<cfif regionQry.recordCount gt 0 >
					region: 'south',
					<cfif trim(regionQry.HIDDEN) neq "" >
						hidden: <cfoutput>#regionQry.HIDDEN#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.FLEX) neq "" >
						flex: <cfoutput>#regionQry.FLEX#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.HEIGHT) neq "" >
						height: <cfoutput>#regionQry.HEIGHT#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.WIDTH) neq "" >
						width: <cfoutput>#regionQry.WIDTH#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.SPLIT) neq "" >
						split: <cfoutput>#regionQry.SPLIT#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.TITLE) neq "" >
						title: <cfoutput>'#regionQry.TITLE#',</cfoutput>
					</cfif>
					<cfif trim(regionQry.MARGINS) neq "" >
						margins: <cfoutput>'[#regionQry.MARGINS#]',</cfoutput>
					</cfif>
					<cfif trim(regionQry.PADDING) neq "" >
						padding: <cfoutput>'[#regionQry.PADDING#]',</cfoutput>
					</cfif>
					<cfif trim(regionQry.COLLAPSIBLE) neq "" >
						collapsible: <cfoutput>#regionQry.COLLAPSIBLE#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.AUTOSCROLL) neq "" >
						autoScroll: <cfoutput>#regionQry.AUTOSCROLL#,</cfoutput>
					</cfif>
					<cfif trim(regionQry.PANELEXTRA) neq "" >
						<cfoutput>#regionQry.PANELEXTRA#,</cfoutput>
					</cfif>

					<cfif trim(regionQry.LAYOUT) neq "" >
						layout: <cfoutput>{#regionQry.LAYOUT#},</cfoutput>
					</cfif>

					<cfif trim(regionQry.ITEMSWIDGETNAMES) neq "" >
						items: <cfoutput>#regionQry.ITEMSWIDGETNAMES#</cfoutput>
					</cfif>
				<cfelse>
					region: 'south',
					hidden: true
				</cfif>
			}]

		});

	}
});




</script>


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

