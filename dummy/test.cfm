<!--- <cfhttp url="https://accounts.google.com/o/oauth2/token" method="post">
	<cfhttpparam name="code" value="[code from above]" type="formfield">
	<cfhttpparam name="client_id" value="561695249357-7tkuphd99v8q1ao3skn35hjgegb52s1f.apps.googleusercontent.com" type="formfield">
	<cfhttpparam name="client_secret" value="KLLm-o-Ni0k-YGYW7KRAeMOO" type="formfield">
	<cfhttpparam name="redirect_uri" value="https://localhost:8500/signin.cfm" type="formfield">
	<cfhttpparam name="grant_type" value="authorization_code" type="formfield">
</cfhttp> --->
<cfscript>
	s = FileRead(ExpandPath("../myapps/queryoutput/FBC/NS_059477B22606B030507BC2C8BCDA1A2F/app.js"), "utf-8");
	writedump(s);

</cfscript>