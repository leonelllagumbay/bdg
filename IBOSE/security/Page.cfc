<cfcomponent displayname="Page" >
	<cffunction name="getAppScript" returntype="string" access="public">
		<cfargument name="appQuery" >

		<cfsavecontent variable="themainscript">
	<cfoutput>
	<script type="text/javascript">
	Ext.Loader.setConfig({enabled: true});
	Ext.Loader.setPath('Ext.ux', './scripts/ext-4.2.2/examples/ux');

	Ext.application({
		requires: #appQuery.SCRIPTREQUIRES#,
		name: 'Form',
		controllers: #appQuery.EXTCONTROLLERS#,
		appFolder: 'app',
		init: function(app) {
			GLOBAL_VARS_DIRECT = {
				USERID : '#session.userid#',
				PID : '#session.chapa#',
				FIRSTNAME : '#session.firstname#',
				LASTNAME : '#session.lastname#',
				MIDDLENAME : '#session.middlename#',
				MYMESSAGE : '#rereplace(session.mymessage,"[\r\n]"," ","all")#',
				MYPROFILEPIC : './resource/image/pics201/#lcase(session.companycode)#/#session.avatar#',
				COMPANYLOGO : '#session.icon_path##session.site_bannerlogo#',
				COMPANYCODE: '#session.companycode#',
				COMPANYNAME: '#session.companyname#',
				SITE: '#session.domain#'
			};
	</cfoutput>
	<cfloop list="#appQuery.EXTNAMESPACE#" index="nsListVal" delimiters=","  >
		<cfoutput>Ext.direct.Manager.addProvider(Ext.#nsListVal#.APIDesc);</cfoutput>
	</cfloop>
	<cfinvoke method="initAppWideError" returnvariable="appwideerr" />
	<cfoutput>
		#appwideerr#
		},
		launch: function(){
			_myAppGlobal = this;
			Ext.create('Ext.container.Viewport', {
				layout: 'border',
				bodyBorder: false,
				autoShow: true,
				items: [{
	</cfoutput>

				<cfinvoke method="initRegion" returnvariable="disRegionN">
					<cfinvokeargument name="regionName" value="north" > appQuery
					<cfinvokeargument name="appQuery" value="#appQuery#" >
				</cfinvoke>
				<cfinvoke method="initRegion" returnvariable="disRegionW">
					<cfinvokeargument name="regionName" value="west" >
					<cfinvokeargument name="appQuery" value="#appQuery#" >
				</cfinvoke>
				<cfinvoke method="initRegion" returnvariable="disRegionC">
					<cfinvokeargument name="regionName" value="center" >
					<cfinvokeargument name="appQuery" value="#appQuery#" >
				</cfinvoke>
				<cfinvoke method="initRegion" returnvariable="disRegionE">
					<cfinvokeargument name="regionName" value="east" >
					<cfinvokeargument name="appQuery" value="#appQuery#" >
				</cfinvoke>
				<cfinvoke method="initRegion" returnvariable="disRegionS">
					<cfinvokeargument name="regionName" value="south" >
					<cfinvokeargument name="appQuery" value="#appQuery#" >
				</cfinvoke>

	<cfoutput>#disRegionN#
				},{
				#disRegionW#
				},{
				#disRegionC#
				},{
				#disRegionE#
				},{
				#disRegionS#
				}]
			});
		}
	});
	</script>
	</cfoutput>
		</cfsavecontent>
		<cfreturn themainscript >
	</cffunction>

	<cffunction name="initRegion" returntype="String" access="private">
		<cfargument name="regionName" required="true">
		<cfargument name="appQuery" required="true">
<cfsavecontent variable="dRegion">
	<cfinvoke method="getRegions"
			  component="IBOSE.application.App"
			  returnVariable="regionQry"
			  appID="#appQuery.APPID#"
			  regionName="#regionName#"
	>
		<cfif regionQry.recordCount gt 0 >
			<cfoutput>region: '#regionName#',</cfoutput>
		<cfif trim(regionQry.HIDDEN) neq "" >
			<cfoutput>hidden: #regionQry.HIDDEN#,</cfoutput>
		</cfif>
		<cfif trim(regionQry.FLEX) neq "" >
			<cfoutput>flex: #regionQry.FLEX#,</cfoutput>
		</cfif>
		<cfif trim(regionQry.HEIGHT) neq "" >
			<cfoutput>height: #regionQry.HEIGHT#,</cfoutput>
		</cfif>
		<cfif trim(regionQry.WIDTH) neq "" >
			<cfoutput>width: #regionQry.WIDTH#,</cfoutput>
		</cfif>
		<cfif trim(regionQry.SPLIT) neq "" >
			<cfoutput>split: #regionQry.SPLIT#,</cfoutput>
		</cfif>
		<cfif trim(regionQry.TITLE) neq "" >
			<cfoutput>title: '#regionQry.TITLE#',</cfoutput>
		</cfif>
		<cfif trim(regionQry.MARGINS) neq "" >
			<cfoutput>margins: '[#regionQry.MARGINS#]',</cfoutput>
		</cfif>
		<cfif trim(regionQry.PADDING) neq "" >
			<cfoutput>padding: '[#regionQry.PADDING#]',</cfoutput>
		</cfif>
		<cfif trim(regionQry.COLLAPSIBLE) neq "" >
			<cfoutput>collapsible: #regionQry.COLLAPSIBLE#,</cfoutput>
		</cfif>
		<cfif trim(regionQry.AUTOSCROLL) neq "" >
			<cfoutput>autoScroll: #regionQry.AUTOSCROLL#,</cfoutput>
		</cfif>
		<cfif trim(regionQry.PANELEXTRA) neq "" >
			<cfoutput>#regionQry.PANELEXTRA#,</cfoutput>
		</cfif>

		<cfif trim(regionQry.LAYOUT) neq "" >
			<cfoutput>layout: {#regionQry.LAYOUT#},</cfoutput>
		</cfif>

		<cfif trim(regionQry.ITEMSWIDGETNAMES) neq "" >
			<cfoutput>items: #regionQry.ITEMSWIDGETNAMES#</cfoutput>
		</cfif>
	<cfelse>
		<cfoutput>
		region: '#regionName#',
		hidden: true
		</cfoutput>
	</cfif>
</cfsavecontent>
		<cfreturn dRegion />
	</cffunction>

	<cffunction name="initAppWideError">
<cfsavecontent variable="appwidestr">
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
    /* Any non-true return value (including none) will cause the error to be thrown */
}   /* End application-wide error handler */
</cfsavecontent>
		<cfreturn appwidestr />
	</cffunction>

	<cffunction name="prepareMainCSS" returntype="string" access="public">
		<cfargument name="appQuery" >

<cfsavecontent variable="maincss">
<cfoutput>
<style type="text/css">
#appQuery.EXTRACSS#
.field-margin {
	margin: 10px;
}
.selected {
	background-color: ##FF0;
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
   border-color: ##cf4c35 !important;
}
##topmenu {
	text-align: right;
}
##topmenu li {
	display: inline-block;
	list-style: none;
	font-size: .8em;
	color: black;
	text-decoration: none;
}
##topmenu li:hover {
	background-color: ##99bce8;
}

.redbackground {
    background-color: red;
}
</style>
</cfoutput>
</cfsavecontent>
		<cfreturn maincss />
	</cffunction>
</cfcomponent>