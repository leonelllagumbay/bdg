<cfset dfilen = trim(form.dfilename) />
<cfsetting enablecfoutputonly="true" showdebugoutput="false">

<cfheader name="Content-type" value="text/xml">
<cfheader name="Pragma" value="public">
<cfheader name="Cache-control" value="private">
<cfheader name="Expires" value="-1">

<cfhttp url="data/#dfilen#" result="dresult" />

<cfdump var="#dresult#">