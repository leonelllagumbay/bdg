<cfcomponent persistent="true" table="EGRTQUERYGROUP">
	<cfproperty name="USERGRPID" fieldtype="id" type="string" generator="assigned">
	<cfproperty name="EQRYCODE" fieldtype="id" type="string" generator="assigned">
	<cfproperty name="SHOWPRINT" type="string">
	<cfproperty name="SHOWEDIT" type="string">
	<cfproperty name="SHOWDELETE" type="string">
	<cfproperty name="SHOWADD" type="string">
	<cfproperty name="SHOWCOPY" type="string">
	<cfproperty name="SHOWEXPORT" type="string">
	<cfproperty name="SHOWEMAIL" type="string">
	<cfproperty name="SHOWVIEW" type="string">
</cfcomponent>