<cfsetting showdebugoutput="false" >
<cftry>
	<cflogin>
		    <cfif IsDefined("form.password") OR IsDefined("form.newpassword")>
				<cfif lcase(form.username) eq "admin">
					<cfset roles = "user,admin">
		        <cfelse>
		        	<cfset roles = "user">
				</cfif>

		        <!---Get the user and password
				Validate/Match user and password
				If match perform the following... Else return JSON message invalid or incorrect--->
				<cfscript>
					validationResult = StructNew();
					validationResult['message'] = '';
					authObj = CreateObject("component","IBOSE.login.userauthentication");
					theauthtype = authObj.authType(); //what kind of authentication the user selected
					if(theauthtype == 'googleid')
					{
						//code omitted
					} else if (theauthtype == 'facebook') {
						//code omitted
					} else if (theauthtype == 'yahooid') {
						//perform authentication using yahoo id oauth 2
					} else if (theauthtype == 'ldap') {
						try {
							lojb = CreateObject("component","IBOSE.login.Helper");

							ldapAtt = lojb.getLDAPAttributes(form.username);
							if(ldapAtt["LDAPSERVER"] == "false") throw (message="Requires a valid ldap user!");
							myldap = new ldap();
							myldap.setServer(ldapAtt["LDAPSERVER"]);
							myldap.setPort(ldapAtt["LDAPPORT"]);
							myldap.setLdapAttributes(ldapAtt["LDAPATTRIBUTES"]);
							myldap.setUsername(form.username);
							myldap.setPassword(form.password);
							result = myldap.query(start="#ldapAtt['LDAPSTART']#");

							if(result.recordcount gt 0) {
							    lojb.getUser();
							    theUsername = form.username;
							    thePassword = form.password;
							    validationResult = authObj.validateUserNative(theUsername,thePassword);
							} else {
							    throw (message="Requires a valid ldap user!");
							}
						}
						catch(Any e) {
							validationResult = StructNew();
						    validationResult["message"] = "invalidunameorpassword";
						    validationResult["detail"] = e.detail & " - " & e.message;
						    validationResult["description"] = "Requires a valid ldap user name or password.";
						    validationResult["duration"] = 5;
						}
						//login using ldap services like MS Active Directory, Apache Directory Service, OpenLDAP, etc
						//Note: no hash is used for ldap
					} else {
						//use native
						//login using the same database used by iBOS/e
						//validate username and password
						if(IsDefined("form.newpassword")) {
							theOldHashedPassword = form.myoldhashedpwd;
							theUsername = form.username;
							thePassword = form.newpassword;
							theRes = StructNew();
							theRes = authObj.changeUserPwdNative(theOldHashedPassword,theUsername,thePassword);
							if(theRes["message"] == "true") {
								validationResult = authObj.validateUserNative(theUsername,thePassword);
							} else {
								validationResult = theRes;
							}
						} else {
							theUsername = form.username;
							thePassword = form.password;
							validationResult = authObj.validateUserNative(theUsername,thePassword);
						}
					}

				</cfscript>

				<cfsavecontent variable="dcontent">
				<cfset message = validationResult["message"] >

					<cfif message eq "true" >
				        <cfloginuser name     = "#theUsername#"
									 password = "#thePassword#"
				                     roles    = "#roles#"
						/>

						<cfoutput>
						{
						"success": "true",
						"form": [{
								"detail":  "yessuccessdetail",
								"message": "#session.defaultuserapp#"
							}]
						}
						</cfoutput>
					<cfelseif message eq "changepassword" >
						<cfoutput>
						<cfquery name="getP" datasource="#session.global_dsn#" maxrows="1">
							SELECT PASSWORD
							  FROM EGRGUSERMASTER
							 WHERE USERID = '#session.USERID#'
						</cfquery>
						{
						"success": "true",
						"form": [{
								"detail":  "changepassword",
								"message": "changepassword",
								"username": "#session.USERID#",
								"hashpwd": "#trim(getP.PASSWORD)#",
								"type": "cpnextlogon"
							}]
						}
						</cfoutput>
					<cfelseif message eq "passwordisexpired" >
						<cfoutput>
						<cfquery name="getP" datasource="#session.global_dsn#" maxrows="1">
							SELECT PASSWORD
							  FROM EGRGUSERMASTER
							 WHERE USERID = '#session.USERID#'
						</cfquery>
						{
						"success": "true",
						"form": [{
								"detail":  "changepassword",
								"message": "changepassword",
								"username": "#session.USERID#",
								"hashpwd": "#trim(getP.PASSWORD)#",
								"type": "pwdisexpired"
							}]
						}
						</cfoutput>
					<cfelseif message eq "accountlockedout" >
						<cfoutput>
						{
						"success": "true",
						"form": [{
								"detail":  "#validationResult['description']#",
								"message": "accountlockedout",
								"duration": "#validationResult['duration']#"
							}]
						}
						</cfoutput>
					<cfelseif message eq "invalidunameorpassword" >
						<cfoutput>
						{
						"success": "true",
						"form": [{
								"detail":  "#validationResult['description']#",
								"message": "invalidunameorpassword",
								"duration": "#validationResult['duration']#"
							}]
						}
						</cfoutput>
					<cfelseif message eq "lockoutreset" >
						<cfoutput>
						{
						"success": "true",
						"form": [{
								"detail":  "#validationResult['description']#",
								"message": "lockoutreset",
								"duration": "#validationResult['duration']#"
							}]
						}
						</cfoutput>
					<cfelse>
						<cfoutput>
						{
						"success": "true",
						"form": [{
								"detail":  "#message#",
								"message": "message"
							}]
						}
						</cfoutput>
					</cfif> <!---end validation is struct--->
					</cfsavecontent>
					<cfoutput>#dcontent#</cfoutput>
			<cfelse>
				<!---only if the user is logged out--->
				<cfif cgi.SCRIPT_NAME NEQ "/index.cfm" >
					<cfif findnocase("HTTPS",cgi.SERVER_PROTOCOL) >
		    			<cflocation url="https://#CGI.HTTP_HOST#">
					<cfelse>
						<cflocation url="http://#CGI.HTTP_HOST#">
					</cfif>
				</cfif>
				<cfinclude template="login.cfm">
			    <cfabort>
			</cfif>
	</cflogin>

	<cfcatch type="any">
		<cfoutput>
		{
		"success": "true",
		"form": [{
				"detail":   "#cfcatch.Detail#",
				"message":  "#cfcatch.Message#"
			}]
		}
		</cfoutput>
	</cfcatch>
</cftry>