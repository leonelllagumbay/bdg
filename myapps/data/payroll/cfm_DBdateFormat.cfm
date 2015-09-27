<!---date format converter mssql or oracle--->
<CFPARAM NAME = "attributes.dateConvert" DEFAULT = '#DATEFORMAT(NOW(), "mm/dd/yyyy")#'>
<CFPARAM NAME = "attributes.DBMS" DEFAULT = ''>
<CFIF isDefined("application.DBMS")>
	<CFSET attributes.DBMS = application.DBMS>
</CFIF>

<CFIF attributes.dateConvert NEQ "" AND isDate(attributes.dateConvert)>
	<CFIF attributes.DBMS EQ "ORACLE">
		<CFSET caller.dateResult = "to_date('#DATEFORMAT(attributes.dateConvert, "mm/dd/yyyy")#','mm/dd/yyyy')">
	<CFELSEIF attributes.DBMS EQ "MySQL">
	<!--- Added by Teki 10/20/2011 to Add DateFormat for MySQL --->
		<CFSET caller.dateResult = "'#DATEFORMAT(attributes.dateConvert, "yyyy/mm/dd")#'">
	<CFELSE>
		<CFSET caller.dateResult = "'#DATEFORMAT(attributes.dateConvert, "mm/dd/yyyy")#'">
	</CFIF>
<CFELSE>
	<CFSET caller.dateResult = "''">
</CFIF>

